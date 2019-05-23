package GUIapp;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JTextField;
import java.awt.BorderLayout;
import java.awt.GridLayout;
import javax.swing.JLabel;
import javax.swing.JComboBox;
import javax.swing.JButton;

public class Student {

	private JFrame frame;
	private JTextField fname;
	private JTextField lname;
	private JTextField textField;

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
		JComboBox comboBox = new JComboBox();
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
		
		textField = new JTextField();
		frame.getContentPane().add(textField);
		textField.setColumns(10);
		
		JLabel label = new JLabel("");
		frame.getContentPane().add(label);
		
		JButton btnEnroll = new JButton("Enroll");
		frame.getContentPane().add(btnEnroll);
		
		JLabel label_1 = new JLabel("");
		frame.getContentPane().add(label_1);
	}

}
