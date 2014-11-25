<%@ page language="java" import="java.util.*,java.sql.*,vonzhou.servlet.*,java.util.Date" pageEncoding="UTF-8"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    int index=1;
    int id=1;
    int recordCount=0;
    String temp1=null;
    String temp2=null;
    int timeValue=0;
    int timeValue2=0;
    String currentChanel="1";
    String tempChanel="no";
    String changeFlag="no";
    String rollFlag="no";
    
    Connection conn=DBUtil.getConnection();
    String sql = "select time from Timer4Pattern where id=2;";//获取当前时间，10秒才会继续下面的操作。
    Statement stmt = conn.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery(sql);
    PrintWriter out1 = response.getWriter();
    while(rs.next()){
    	timeValue=Integer.parseInt(rs.getString(1));
    	break;
    }
    
    sql = "select time from Timer4Pattern where id=11;";//获取当前时间，10秒才会继续下面的操作。
    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery(sql);
    while(rs.next()){
    	timeValue2=Integer.parseInt(rs.getString(1));
    	break;
    }
    
    sql = "select address from DeliverCtrl where id=0;";//获取当前索引
	    stmt = conn.prepareStatement(sql);
	    rs = stmt.executeQuery(sql);
	    while(rs.next()){
	    	currentChanel=rs.getString(1);
	    	break;
	    }
    
    if(timeValue==20){
    	 sql = "select content from AdsWords where id=0;";//获取当前索引
    	    stmt = conn.prepareStatement(sql);
    	    rs = stmt.executeQuery(sql);
    	    while(rs.next()){
    	    	index=Integer.parseInt(rs.getString(1));
    	    	break;
    	    }
    	   // System.out.println("index==="+index);
    	    
    	    sql="select count(*) from AdsWords;";
    	    stmt = conn.prepareStatement(sql);
    	    rs = stmt.executeQuery(sql);
    	    while(rs.next()){
    	    	recordCount=Integer.parseInt(rs.getString(1));
    	    	break;
    	    }
    	    recordCount=recordCount-1;//减去那个保存index的记录
    	    //System.out.println("recordCount==="+recordCount);
    	    
    	    id=index>recordCount?1:index;
    	    sql="select content from AdsWords where id="+id+";";
    	    stmt = conn.prepareStatement(sql);
    	    rs = stmt.executeQuery(sql);
    	    while(rs.next()){
    	    	temp1=rs.getString(1);
    	    	break;
    	    }
    	    id++;
    	    id=id>recordCount?1:id;
    	    sql="select content from AdsWords where id="+id+";";
    	    stmt = conn.prepareStatement(sql);
    	    rs = stmt.executeQuery(sql);
    	    while(rs.next()){
    	    	temp2=rs.getString(1);
    	    	break;
    	    }
    	    
    	    rollFlag="ok";
    	    
    	   // System.out.println("temp1==="+temp1);
    	   // System.out.println("temp2==="+temp2);
    	   
    	   index=id+1;//更新索引值
    	   index=index>recordCount?1:index;
    	   sql = "update AdsWords set content='"+index+"' where id=0;";
    	   stmt = conn.prepareStatement(sql);
    	   stmt.executeUpdate(sql);
    	   
    	   sql = "update Timer4Pattern set time=0 where id=2;";
    	   stmt = conn.prepareStatement(sql);
    	   stmt.executeUpdate(sql);
    	   
    	   
    	    
    	    
    	   
    }else{
    	timeValue++;
    	sql = "update Timer4Pattern set time="+timeValue+" where id=2;";
 	    stmt = conn.prepareStatement(sql);
 	    stmt.executeUpdate(sql);
    	
    	
    }
    
    
    if(timeValue2==10){
   	 
   	   // System.out.println("index==="+index);
   	   int x=Integer.parseInt(currentChanel);
   	    System.out.println(x);
   	    sql="select address from DeliverCtrl where id="+x+";";
   	    stmt = conn.prepareStatement(sql);
   	    rs = stmt.executeQuery(sql);
   	    while(rs.next()){
   	    	tempChanel=rs.getString(1);
   	    	break;
   	    }
   	    x++;
   	    x=x>3?1:x;
   	 changeFlag="ok";
   	 
   	 sql = "update Timer4Pattern set time=0 where id=11;";
	   stmt = conn.prepareStatement(sql);
	   stmt.executeUpdate(sql);
   	 
   	   sql = "update DeliverCtrl set address='"+x+"' where id=0;";
   	   stmt = conn.prepareStatement(sql);
   	   stmt.executeUpdate(sql);
   }else{
   	timeValue2++;
   	sql = "update Timer4Pattern set time="+timeValue2+" where id=11;";
	    stmt = conn.prepareStatement(sql);
	    stmt.executeUpdate(sql);
   }
    
    
    Date date=new Date();
    SimpleDateFormat df=new SimpleDateFormat("yyyy-mm-dd");
   // String str=df.format(date).toString();
    
    
    out1.println("<div id='w1'>"+temp1+"</div>");
    out1.println("<div id='w2'>"+temp2+"</div>");
    out1.println("<div id='chanel'>"+tempChanel+"</div>");
    out1.println("<div id='changeFlag'>"+changeFlag+"</div>");
    out1.println("<div id='rollFlag'>"+rollFlag+"</div>");
    out1.println("<div id='date'>"+date+"</div>");
    
    
    
    rs.close(); 
    stmt.close(); 
    conn.close();
   
   
    %>


