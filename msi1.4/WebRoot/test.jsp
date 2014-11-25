<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Pattern 2</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
   
    
    
 

  </head>
  <body >

	
	
 
    
    <div id="imgmarquee" style="OVERFLOW: hidden; WIDTH: 580px; align: left; background-color:#0099CC;"> 
<div style="width:1200px">
<!--id="marquePic1"里面的宽度一定要大于id="imgmarquee"的宽度才能看到效果 width:600px;>WIDTH: 580px;
大的div宽度要为span的两倍才可以，不然会换行width:1200px zdz的作品，流风的作品 -->
   <span id="marquePic1" style="width:600px; background-color:#990033;">
   博观而约取，厚积而薄发。
   </span>
   <span id="marquePic2" style="width:600px;background-color:#990033;"></span> 
</div>
</div> 

  

    
    <div id="content"></div>
    <div id="chanel">deliver://259000000.6875.64.8</div>
      <script>
  	var imgmarquee = document.getElementById('imgmarquee');
var marquePic2 = document.getElementById('marquePic2');
var marquePic1 = document.getElementById('marquePic1');
var speed=10;//控制移动的速度,数越大越慢
marquePic2.innerHTML=marquePic1.innerHTML;//把marquePic1的内容复制到marquePic2里面
function Marquee(){ 
if(imgmarquee.scrollLeft>=marquePic1.scrollWidth){ 
imgmarquee.scrollLeft=0;
}else{ 
//demo.scrollLeft++; 
imgmarquee.scrollLeft++; 
}
} 
var marqueetemp=setInterval(Marquee,speed); 
//imgmarquee.onmouseover=function() {clearInterval(marqueetemp)} //鼠标移到上面停止并清除计数 
//imgmarquee.onmouseout=function() {marqueetemp=setInterval(Marquee,speed)} //鼠标离开重新计数



</script>
  </body>
</html>
