package GUIapp;

import java.awt.EventQueue;
import java.sql.*;


import javax.swing.JButton;
import javax.swing.JFrame;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JLabel;
import javax.swing.JTextField;

public class ClassGUI {

	private JFrame frame;
	private JTextField cName;
	private JTextField cID;
	private JTextField cCap;
	private Connection connection;


	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ClassGUI window = new ClassGUI();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public ClassGUI() {
		initialize();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection("jdbc:mysql://localhost/classes", "root", "");
			String statement = "SELECT class.name FROM class";
			Statement sqlStatement = connection.createStatement();
			ResultSet results = sqlStatement.executeQuery(statement);
		}
		
		catch( Exception e ){
			return;
		}
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(new GridLayout(0, 1, 0, 0));
		
		JLabel className = new JLabel("Class Name:");
		frame.getContentPane().add(className);
		
		cName = new JTextField();
		frame.getContentPane().add(cName);
		cName.setColumns(10);
		
		JLabel classID = new JLabel("Class ID:");
		frame.getContentPane().add(classID);
		
		cID = new JTextField();
		frame.getContentPane().add(cID);
		cID.setColumns(10);
		
		JLabel classCap = new JLabel("Class Capacity:");
		frame.getContentPane().add(classCap);
		
		cCap = new JTextField();
		frame.getContentPane().add(cCap);
		cCap.setColumns(10);
		
		JButton btnAdd = new JButton("Add Class");
		frame.getContentPane().add(btnAdd);
		
		btnAdd.addActionListener(new CustomActionListener());
	}
	
	class CustomActionListener implements ActionListener{
	      public void actionPerformed(ActionEvent e) {
	    	  String cNameText = cName.getText();
	    	  String cIDText = cID.getText();
	    	  String cCapText = cCap.getText();
	    	  if(!cNameText.equals("")) {
	    		  if(!cIDText.equals("")) {
	    			  if(!cCapText.equals("")) {
						try {
							String statement = ("SELECT class.id_name FROM class WHERE class.id_name = '" + cIDText + "';");
							Statement sqlStatement = connection.createStatement();
							ResultSet results = sqlStatement.executeQuery(statement);
							if(!results.next()) {
								statement = ("INSERT INTO class (name, cap, id_name) VALUES ('" + cNameText + "'," + cCapText + ",'" + cIDText + "');" );
								sqlStatement.executeUpdate(statement);
							}
						} 
						catch (Exception e1) {
							System.out.println(e1);
							return;
						}
	    			  }
	    		  }
	    	  }
	      }
	   }	

}
