package com.classic.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ClassicDBConnection {
	
	private static String url = "jdbc:oracle:thin:@localhost:1521:XE";
	//private static String url = "jdbc:oracle:thin:@192.168.0.2:1521:XE"; //for Gwak MBP
	private static String driverName = "oracle.jdbc.driver.OracleDriver";
	private static String id = "classic_admin";
	private static String pw = "admin1234";
	
	public static Connection getConnection() throws Exception{
		Connection conn = null;
		Class.forName(driverName);
		conn = DriverManager.getConnection(url, id, pw);
		return conn;
	}
	
	public static void close(Connection conn) {
		try {
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement pstmt, Connection conn) {
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
/*	public static void main(String[] args) {
		Connection conn;
		try {
			conn = ClassicDBConnection.getConnection();
			System.out.println(conn.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
}
