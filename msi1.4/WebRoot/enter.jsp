<%@ page language="java" import="java.util.*,java.sql.*,vonzhou.servlet.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Connection conn=DBUtil.getConnection();
String sql = "select * from enter2Index;";
Statement stmt = conn.prepareStatement(sql);
ResultSet rs = stmt.executeQuery(sql);
int  valid=0;
while(rs.next()){
	if(rs.getString(1).equals("1")){
		valid=Integer.parseInt(rs.getString(2));
		break;
	}
}
System.out.println(valid+"========enter.jsp");
//PrintWriter out1 =  response.getWriter();
out.println("<div id='valid'>"+valid+"</div>");



%>
