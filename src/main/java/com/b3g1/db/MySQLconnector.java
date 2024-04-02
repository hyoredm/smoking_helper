package com.b3g1.db;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;


public class MySQLconnector extends Querys {

	public MySQLconnector() { // 기본 생성자

	}

	public static Connection conn = null;

	/** MySQL Connect Method **/
	public static Connection connectDB() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id_mysql, pw_mysql);
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("connectDB(): " + e.getMessage());
		}
		return conn;
	} // connectDB() END

	
	
	
}
