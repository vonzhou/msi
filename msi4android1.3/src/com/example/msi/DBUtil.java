package com.example.msi;


import java.sql.Connection;
import java.sql.DriverManager;



public class DBUtil {//���ݿ����������
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
