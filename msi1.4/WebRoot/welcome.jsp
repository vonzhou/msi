<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
*{font-size:20px; font-family:Verdana;margin:0;padding:0}    
#div {width:800px;height:600px;overflow:hidden;margin:0 0 0 0;}  
#submit {width:200px;height:50px;margin:550px 0 0 600px;}    
</style>  

  </head>
  
  <body>
   <script type="text/javascript">
    var xmlHttp=null;
    var valid=0;
    var urlBase="http://192.168.2.3:8080/msi2/";
 function GetXmlHttpObject(handler){ 
	var objXmlHttp=null;
	objXmlHttp=new XMLHttpRequest();
	if(objXmlHttp.overrideMimeType){
		objXmlHttp.overrideMimeType('text/xml'); 
	}	
	objXmlHttp.onload=handler ;
	objXmlHttp.onerror=handler ;
	return objXmlHttp;
}

function doaction(){
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
		//alert(xmlHttp.responseText);
	document.getElementById("content").innerHTML=xmlHttp.responseText //xmlHttp的responseText方法 得到读取页数据,一定要抓取到当前页面，可以设为隐藏
    valid= Number(document.getElementById("valid").innerHTML);
	if(valid==1){
		window.location.href="index.jsp";
	}
    }
}

function startXMLHttp(){
	var url = "enter.jsp" ;
	var callbackfun= doaction ;
	xmlHttp=GetXmlHttpObject(callbackfun);
	xmlHttp.open("GET", url , true);
	xmlHttp.send(null);
	
	setTimeout("startXMLHttp()" , 1500);
}

window.onload = startXMLHttp() ;
</script>
<!-- 
	<div id="div" style="background-image:url(imgs/welcome.jpg)">
   	<form action="IndexServlet" method="post">
   	<input type="submit" value=" 进   入  " id="submit"/>
   	</form>
 -->
   <div id="div" style="background-image:url(imgs/welcome.jpg)">
   <input type="submit" value=" 进   入  " id="submit"/>
   	<div id="content"></div>
   	</div>
  </body>
</html>
