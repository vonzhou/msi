<%@ page language="java" import="java.util.*,java.sql.*,vonzhou.servlet.*" pageEncoding="UTF-8"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.io.PrintWriter"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //先从entertab确认是否Enter按下，若有效则
    //从导航表indexctrl中得到当前页面which，据此从urltab表中获取其进入的URL回传给index页面，控制页面跳转
    Connection conn=DBUtil.getConnection();
    String sql = "select * from entertab where id=13;";
    Statement stmt = conn.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery(sql);
    int  valid=0;
    int which=1;
    String url=null;
    while(rs.next()){
    	valid=Integer.parseInt(rs.getString(2));
    	break;
    }
    System.out.println(valid);
    if(valid==1){
    	sql="select * from indexctrl where id=1;";
    	stmt=conn.prepareStatement(sql);
    	rs=stmt.executeQuery(sql);
    	while(rs.next()){
        	which=Integer.parseInt(rs.getString(2));
        	break;
        }
    	
    	sql="select * from urltab where id="+which+";";
    	stmt=conn.prepareStatement(sql);
    	rs=stmt.executeQuery(sql);
    	while(rs.next()){
        	url=rs.getString(2);
        	break;
        }
    	
    }else{
    	url="erro";
    }
    
    
    rs.close(); 
    stmt.close(); 
    conn.close();
   
   // HttpServletResponse response=getServletContext().get  
  	PrintWriter out1 = response.getWriter();
    out1.println("<div id='url'>"+url+"</div>");
    %>


