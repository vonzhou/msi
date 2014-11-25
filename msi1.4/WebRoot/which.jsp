<%@ page language="java" import="java.util.*,java.sql.*,vonzhou.servlet.*" pageEncoding="UTF-8"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.io.PrintWriter"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //从数据库中获得控制指令，控制当前页面的切换和导航
    //得到控制指令which，回应ajax请求
    Connection conn=DBUtil.getConnection();
    String sql = "select * from indexctrl;";
    Statement stmt = conn.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery(sql);
    String which=null;
    int  valid=0;
     boolean flag=false;
    String url="erro";
    String stbFlag="0";
    
    //
    String mediaID="-1";//默认是-1.代表没有媒体推送请求命令
    
    while(rs.next()){
    	if(rs.getString(1).equals("1")){
    		which=rs.getString(2);
    	}else if(rs.getString(1).equals("13")){
    		valid=Integer.parseInt(rs.getString(2));
    	}
    		
    }
    //System.out.println(which);
    if(valid==1){
    	flag=true;
    	System.out.println("==============="+valid);
    	sql="select * from urltab where id="+which+";";
    	stmt=conn.prepareStatement(sql);
    	rs=stmt.executeQuery(sql);
    	while(rs.next()){
        	url=rs.getString(2);
        	break;
        }
    	System.out.println(url);
    	
    	//for(int i=0;i<100000;i++);//delay sometime to let index page get wanted info
    	sql = "update indexctrl set which=0 where id=13;";//操作后set enter invalid
        stmt = conn.prepareStatement(sql);
        stmt.executeUpdate(sql);
    	
    }
    if(which==null || which.equals(""))
    	which="1";
   //HttpServletResponse response=getServletContext().get  
  	PrintWriter out1 = response.getWriter();
  	
    out1.println("<div id='which'>"+which+"</div>");
    /*对于ajax请求回应改为从currentURL表中获取并回传，而不是从urltab获取后就回传，
    因为这种情况存在覆盖情况，不稳定。@2013.5.10*/
    //out1.println("<div id='url'>"+url+"</div>");
    if(!(url.equals("erro"))){
    	sql = "update currentURL set url='"+url+"' where id=1;";//操作后set enter invalid
        stmt = conn.prepareStatement(sql);
        stmt.executeUpdate(sql);
    }
    
    sql="select * from currentURL where id=1";
	stmt=conn.prepareStatement(sql);
	rs=stmt.executeQuery(sql);
	while(rs.next()){
    	url=rs.getString(2);
    	break;
    }
	
	sql="select * from media where id=9999";
	stmt=conn.prepareStatement(sql);
	rs=stmt.executeQuery(sql);
	while(rs.next()){
    	mediaID=rs.getString(2);
    	break;
    }
	
	sql="select * from stbctrl where id=8899";
	stmt=conn.prepareStatement(sql);
	rs=stmt.executeQuery(sql);
	while(rs.next()){
    	stbFlag=rs.getString(2);
    	break;
    }
    	
    rs.close(); 
    stmt.close(); 
    conn.close();
    out1.println("<div id='url'>"+url+"</div>");
    out1.println("<div id='media'>"+mediaID+"</div>");
    out1.println("<div id='stbFlag'>"+stbFlag+"</div>");
    /*
    if(!(url.equals("erro"))){
    	//System.out.println("111111111111111111111111111");
    	//response.sendRedirect(url);
    	ServletContext sc = getServletContext(); 

        RequestDispatcher rd = null; 

        rd = sc.getRequestDispatcher("/"+url);       //定向的页面 

        rd.forward(request, response); 
    }
    */
    %>


