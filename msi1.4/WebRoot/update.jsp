<%@ page language="java" import="java.util.*,java.sql.*,vonzhou.servlet.*" pageEncoding="UTF-8"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.io.PrintWriter"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
   	int which = Integer.parseInt(request.getParameter("which"));
   	
    Connection conn=DBUtil.getConnection();
    String sql = "update indexctrl set which="+which+" where id=1;";
    Statement stmt = conn.prepareStatement(sql);
    stmt.executeUpdate(sql);
  
   //System.out.println(which);
    stmt.close(); 
    conn.close();
    
  	PrintWriter out1 = response.getWriter();
    out1.println("<div id='which'>"+which+"</div>");
    %>


