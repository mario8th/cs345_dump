package GUIapp;

import java.awt.EventQueue;

import javax.swing.JButton;
import javax.swing.JFrame;
import java.awt.GridLayout;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class Class {

	private JFrame frame;
	private JTextField cName;
	private JTextField cID;
	private JTextField cCap;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Class window = new Class();
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
	public Class() {
		initialize();
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
	}

}
