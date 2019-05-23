package GUIapp;

import java.awt.EventQueue;
import java.sql.*;

import javax.swing.JFrame;
import javax.swing.JTextField;

import GUIapp.ClassGUI.CustomActionListener;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JLabel;
import javax.swing.JComboBox;
import javax.swing.JButton;

public class Student {

	private JFrame frame;
	private JTextField fname;
	private JTextField lname;
	private JTextField studentID;
	private JComboBox<String> comboBox;
	private Connection connection;
	private JLabel label_message;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Student window = new Student();
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
	public Student() {
		initialize();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection("jdbc:mysql://localhost/classes", "root", "");
			String statement = "SELECT class.name FROM class";
			Statement sqlStatement = connection.createStatement();
			ResultSet results = sqlStatement.executeQuery(statement);
			while(results.next()) {
				comboBox.addItem(results.getString(1));
			}
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
		
		JLabel lblCoursesToChoose = new JLabel("Courses to choose from:");
		frame.getContentPane().add(lblCoursesToChoose);
		//access classes to populate combo box
		comboBox = new JComboBox<String>();
		frame.getContentPane().add(comboBox);
		
		JLabel lblFirstName = new JLabel("First Name:");
		frame.getContentPane().add(lblFirstName);
		
		fname = new JTextField();
		frame.getContentPane().add(fname);
		fname.setColumns(10);
		
		JLabel lblLastName = new JLabel("Last Name:");
		frame.getContentPane().add(lblLastName);
		
		lname = new JTextField();
		frame.getContentPane().add(lname);
		lname.setColumns(10);
		
		JLabel lblStudentId = new JLabel("Student ID:");
		frame.getContentPane().add(lblStudentId);
		
		studentID = new JTextField();
		frame.getContentPane().add(studentID);
		studentID.setColumns(10);
		
		JLabel label = new JLabel("");
		frame.getContentPane().add(label);
		
		JButton btnEnroll = new JButton("Enroll");
		frame.getContentPane().add(btnEnroll);
		
		btnEnroll.addActionListener(new CustomActionListener());

		label_message = new JLabel("");
		frame.getContentPane().add(label_message);
	}
	
	class CustomActionListener implements ActionListener{
	      public void actionPerformed(ActionEvent e) {
	    	  label_message.setText("");
	    	  String fNameText = fname.getText();
	    	  String lNameText = lname.getText();
	    	  String studentIDText = studentID.getText();
	    	  if(!fNameText.equals("")) {
	    		  if(!lNameText.equals("")) {
	    			  if(!studentIDText.equals("")) {
						try {
							// if student doesn't exist
								// add student
							String statement = ("SELECT student.id FROM student WHERE student.id = " + studentIDText + ";");
							Statement sqlStatement = connection.createStatement();
							ResultSet results = sqlStatement.executeQuery(statement);
							if(!results.next()) {
								statement = ("INSERT INTO student (id, f_name, l_name) VALUES (" + studentIDText + ",'" + fNameText + "','" + lNameText + "');" );
								sqlStatement.executeUpdate(statement);
							}
							// if class full
							statement = ("SELECT COUNT(student_in_class.student_id) FROM student_in_class;");
							sqlStatement = connection.createStatement();
							ResultSet classCount = sqlStatement.executeQuery(statement);
							
							statement = ("SELECT class.cap FROM class;");
							sqlStatement = connection.createStatement();
							ResultSet classCap = sqlStatement.executeQuery(statement);
							
							statement = ("SELECT class.id FROM class WHERE class.name = '" + comboBox.getSelectedItem().toString() + "';");
							sqlStatement = connection.createStatement();
							ResultSet classID = sqlStatement.executeQuery(statement);
							
							statement = ("SELECT student_in_waitlist.student_id FROM student_in_waitlist WHERE student_in_waitlist.student_id = " + studentIDText + ";");
							sqlStatement = connection.createStatement();
							ResultSet studInWait = sqlStatement.executeQuery(statement);
							
							statement = ("SELECT student_in_class.student_id FROM student_in_class WHERE student_in_class.student_id = " + studentIDText + ";");
							sqlStatement = connection.createStatement();
							ResultSet studInClass = sqlStatement.executeQuery(statement);
							
							if(!classID.next())
							{
								System.out.println("Something went wrong");
							}
							
							if(classCount.next() && classCap.next()) {
								if(classCap.getString(1).equals(classCount.getString(1))) {
									// If student in waitlist
									if(studInClass.next())
									{
										if(studInClass.getString(1).equals(studentIDText))
										{
											return;
										}
									}
									if(!studInWait.next())
									{
										label_message.setText("Class is full, adding to waitlist");
										statement = ("INSERT INTO student_in_waitlist (student_id, class_id) VALUES (" + studentIDText + "," + classID.getString(1) + ");" );
										sqlStatement.executeUpdate(statement);
										return;
									}
								}
							}
							
							// if student not enrolled in class
							if(studInClass.next()) {
								if(!studInClass.getString(1).equals(studentIDText))
								{
									statement = ("INSERT INTO student_in_class (student_id, class_id) VALUES (" + studentIDText + "," + classID.getString(1) + ");" );
									sqlStatement.executeUpdate(statement);
								}
								return;
							}
							statement = ("INSERT INTO student_in_class (student_id, class_id) VALUES (" + studentIDText + "," + classID.getString(1) + ");" );
							sqlStatement.executeUpdate(statement);
							return;
								// add to class
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
