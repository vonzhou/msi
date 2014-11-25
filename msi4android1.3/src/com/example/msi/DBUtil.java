package com.example.msi;


import java.sql.Connection;
import java.sql.DriverManager;



public class DBUtil {//数据库操作辅助类
	public static Connection getConnection(){
		String url="jdbc:mysql://localhost:3306/msidb";
		String username="root";
		String psd="vonzhou";
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn=DriverManager.getConnection(url,username,psd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	


}
