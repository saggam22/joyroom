package co.dev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO_mac {
	static Connection conn;
	static ResultSet rs;
	static PreparedStatement psmt;
	static Statement stmt;

	public static Connection conn() {
		
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@jeedb_medium?TNS_ADMIN=/Users/binggla/Wallet_JEEDB";
			conn = DriverManager.getConnection(url, "hr", "Tnqtnql12!@#$");
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conn;
		
	}

	public static void disconn() {
		
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
