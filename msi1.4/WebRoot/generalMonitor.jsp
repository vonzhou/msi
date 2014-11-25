<%@ page language="java" import="java.util.*,java.sql.*,vonzhou.servlet.*" pageEncoding="UTF-8"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.io.PrintWriter"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //从数据库中获得控制指令，控制内容页面菜单的切换和导航
    //得到控制指令key，回应ajax请求
    Connection conn=DBUtil.getConnection();
    String sql = "select * from CurrentKey;";
    Statement stmt = conn.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery(sql);
    String key="-1";//初始无效
    String enterFlag="0";
    
    while(rs.next()){
    	if(rs.getString(1).equals("1")){
    		key=rs.getString(2);
    	}else if(rs.getString(1).equals("2")){
    		enterFlag=rs.getString(2);
    	}
    }
    sql = "select * from Timer;";
    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery(sql);
    String timerValue=null;
    while(rs.next()){
    	if(rs.getString(1).equals("1")){
    		timerValue=rs.getString(2);
    		break;
    	}
    }
    rs.close(); 
    stmt.close(); 
    conn.close();
    System.out.println("======generalMonitor.jsp   :key="+key);
  	PrintWriter out1 = response.getWriter();
    out1.println("<div id='key'>"+key+"</div>");
    out1.println("<div id='timer'>"+timerValue+"</div>");
    out1.println("<div id='enterFlag'>"+enterFlag+"</div>");
    %>


