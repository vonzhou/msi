<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="refresh" content="2; url=http://127.0.0.1:8080/msi2/IndexServlet">
<!-- 2秒后跳转到IndexServlet进行相应的初始化工作，这是必要的。
 -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome to MSI system!</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">    
*{font-size:30px; font-family:Verdana;margin:0;padding:0;font-color:blue}    
#div {width:800px;height:600px;overflow:hidden;margin:0 0 0 0;}  
  
</style>  

  </head>
  
  <body>
   

	<div id="div" style="background-image:url(imgs/welcome.jpg)">
   	正在启动..........
  
   	</div>
  </body>
</html>
