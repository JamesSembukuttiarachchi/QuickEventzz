package com.event;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	//use url, username, password
	private static String url = "jdbc:mysql://localhost:3306/eventdb";
	private static String user = "root";
	private static String password = "DBpassword";
	private static Connection con;
	
	//connection
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//create connection
			con = DriverManager.getConnection(url, user, password);
			
		}
		catch(Exception e) {			//error handling
			
			//give user the unsucces message
			System.out.println("Database connection failed");
		}
		
		return con;
		
	}
	
}
