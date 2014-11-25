<%@ page language="java" import="java.util.*,vonzhou.servlet.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String mediaID=request.getParameter("flag");//这里得到的是null？？？？？？？？？？？？？？
System.out.println("media.jsp       mediaId="+mediaID);
String mediaName="error";
String base="media/";

Connection conn=DBUtil.getConnection();
String sql = "select * from media where id="+mediaID+";";
Statement stmt = conn.prepareStatement(sql);
ResultSet rs = stmt.executeQuery(sql);
while(rs.next()){
	mediaName=rs.getString(2);
	break;
}
System.out.println("media.jsp       mediaName="+mediaName);
String temp=base+mediaName;


rs.close();
stmt.close();
conn.close();




%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'media.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	
	</script>

  </head>
  
  <body>
    <img alt="" src="<%=temp %>"  />
    <input type="text" value="<%=temp %>"/>
  </body>
</html>
