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
	 <style type="text/css">
  
    #wrap1{
    width: 1260px;
    height:600px;
    }
    #tv{
    font-size: 30px;
    background-color:;
    color:red;
    width: 1100px;
    height:600px;
    border: thick;
    float: left;
    position: absolute;
    }
    
    #wrap{
    width: 160px;
    height:600px;
    float: right;
    }
    #time{
    width: 165px;
    height:305px;
    background-color: gray;
    font-size:30px;
    color:red;
    font:serif;
    }
    #weather{
    width: 160px;
    height:300px;
    }
    #wrap3{
    width: 1260px;
    height:100px;
    float: none;
     background-color: #0099CC;
    }
   
    #marquee1,#marquee2{
    height:50px;
    font-size:30px;
    }
    #marquee1bak,#marquee2bak{
    height:50px;
    font-size:30px;
    }
    #fd2{
    width: 1260px;
    height:50px;
    background-color: #FF6600;
    }
    
    marquee{
    font-size:30px;
    }
    
   
    
    
    
    </style>

  </head>
  <body bgcolor="transparent" onload="loadPage();">
 
  <script>
  var xmlHttp=null;
  var temp1="";//两个滚动字幕串值
  var temp2="";
  var chanelAdd="";
  var rollFlag="no";
  var changeFlag="no";
  
  var volume=50;
  var mp= new MediaPlayer();
  mp.setSingleMedia("deliver://259000000.6875.64.8");
  mp.playFromStart();
  mp.setVideoDisplayMode(0);
  mp.setVideoDisplayArea(0,0,1103,603);
  mp.refreshVideoDisplay();
  
  
  
  
  var time = new Date( ); //获得当前时间 
  
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
  
  function updateRoll(){
	  clearInterval(marqueetemp);
	  clearInterval(marquee2temp);
	  marquee1.innerHTML=temp1;
	  marquee2.innerHTML=temp2;
	  marquee1bak.innerHTML=marquee1.innerHTML;
	  marquee2bak.innerHTML=marquee2.innerHTML;
	  marqueetemp=setInterval(Marquee,speed);
	  marquee2temp=setInterval(Marquee2,speed);
	  
	  
  }
  
  
  function doaction(){
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
	document.getElementById("content").innerHTML=xmlHttp.responseText;
	temp1=document.getElementById("w1").innerHTML;
	temp2=document.getElementById("w2").innerHTML;
	
	
	chanelAdd=document.getElementById("chanel").innerHTML;
	rollFlag=document.getElementById("rollFlag").innerHTML;
	changeFlag=document.getElementById("changeFlag").innerHTML;
	
	var date=document.getElementById("date").innerHTML;
	document.getElementById("time").innerHTML=date; 
	
	if(rollFlag=="ok"){
		updateRoll();
	}
	//得到滚动标签，并设置内容。
	//var m1=document.getElementById("marquee1");
	//var m2=document.getElementById("marquee2");

	
	//Marquee();
	//marquee2.innerHTML=temp2;
	
	//if(changeFlag=="ok"){
		
		//chanelAdd="deliver://"+chanelAdd;
		//alert(chanelAdd);
		//mp.setSingleMedia(chanelAdd);
		//mp.playFromStart();
	//}
	
	
    }//end if readystate
  }

	function startXMLHttp(){
		var url = "monitor4p2.jsp";
  		var callbackfun= doaction ;
		xmlHttp=GetXmlHttpObject(callbackfun);
		xmlHttp.open("GET", url , true);
		xmlHttp.send(null);
		
		
		//setInterval(Marquee,speed); 
		setTimeout("startXMLHttp()" , 1000);
	}
	
	


	
	
	function loadPage(){
	//operateMenu(currentMenu);
	startXMLHttp();
	//setInterval("disptime()",1000);
	}
	
	//显示时间
	 function disptime( ){ 
     
     var hour = time.getHours( ); //获得小时、分钟、秒 
     var minute = time.getMinutes( ); 
     var second = time.getSeconds( )+1; 
     var apm="AM"; //默认显示上午: AM 
    
     if (hour>12) //按12小时制显示 
     { 
      hour=hour-12; 
      apm="PM" ; 
     } 
     if (minute < 10) //如果分钟只有1位，补0显示 
      minute="0"+minute; 
     if (second < 10) //如果秒数只有1位，补0显示 
      second="0"+second; 
     /*设置文本框的内容为当前时间*/ 
     document.getElementById("time").innerHTML=hour+":"+minute+":"+second+" "+apm; 
    // document.getElementById("time").innerHTML="333333";
     /*设置定时器每隔1秒（1000毫秒），调用函数disptime()执行，刷新时钟显示*/ 
    // var myTime = setTimeout("disptime()",1000); 
    } 
	

</script>
	<div id="wrap1">  
	
	 <div id="tv">  </div>
    <div id="wrap">
     <div id="time"> 
     
     </div>
    <div id="weather">
    <img alt="" src="weatherImg/1.jpg">
      </div>
     </div>
     
	</div>
   <div id="wrap3">
     <div id="imgmarquee1" style="OVERFLOW: hidden; WIDTH: 980px; height:50px; align: left; background-color:#0099CC;"> 
<div style="width:2000px">
<!--id="marquePic1"里面的宽度一定要大于id="imgmarquee"的宽度才能看到效果 width:600px;>WIDTH: 580px;
大的div宽度要为span的两倍才可以，不然会换行width:1200px zdz的作品，流风的作品 -->
   <span id="marquee1" style="width:1000px; background-color:#990033;height:50px;">
  欢迎使用该系统！
   </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <span id="marquee1bak" style="width:1000px;background-color:#990033;height:50px;"></span> 
</div>
</div> 

 <div id="imgmarquee2" style="OVERFLOW: hidden; WIDTH: 980px; height:50px; align: left; background-color:#0099CC;"> 
<div style="width:2000px">
<!--id="marquePic1"里面的宽度一定要大于id="imgmarquee"的宽度才能看到效果 width:600px;>WIDTH: 580px;
大的div宽度要为span的两倍才可以，不然会换行width:1200px zdz的作品，流风的作品 -->
   <span id="marquee2" style="width:1000px; background-color:#990033;height:50px;">
   博观而约取，厚积而薄发。
   </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <span id="marquee2bak" style="width:1000px;background-color:#990033;height:50px;"></span> 
</div>
</div> 
   
   </div>
 
    
  

  

    
    <div id="content"></div>
    
    <script type="text/javascript"> 
var imgmarquee1 = document.getElementById('imgmarquee1');
var marquee1bak = document.getElementById('marquee1bak');
var marquee1 = document.getElementById('marquee1');
var speed=10;//控制移动的速度,数越大越慢
marquee1bak.innerHTML=marquee1.innerHTML;
function Marquee(){ 
if(imgmarquee1.scrollLeft>=marquee1.scrollWidth){ 
imgmarquee1.scrollLeft=0;
}else{ 
//demo.scrollLeft++; 
imgmarquee1.scrollLeft++; 
}
} 
var marqueetemp=setInterval(Marquee,speed); 
imgmarquee.onmouseover=function() {clearInterval(marqueetemp)} //鼠标移到上面停止并清除计数 
imgmarquee.onmouseout=function() {marqueetemp=setInterval(Marquee,speed)} //鼠标离开重新计数

var imgmarquee2 = document.getElementById('imgmarquee2');
var marquee2bak = document.getElementById('marquee2bak');
var marquee2 = document.getElementById('marquee2');
var speed=10;//控制移动的速度,数越大越慢
marquee2bak.innerHTML=marquee2.innerHTML;
function Marquee2(){ 
if(imgmarquee2.scrollLeft>=marquee2.scrollWidth){ 
imgmarquee2.scrollLeft=0;
}else{ 
//demo.scrollLeft++; 
imgmarquee2.scrollLeft++; 
}
} 
var marquee2temp=setInterval(Marquee2,speed); 
imgmarquee2.onmouseover=function() {clearInterval(marquee2temp)} //鼠标移到上面停止并清除计数 
imgmarquee2.onmouseout=function() {marquee2temp=setInterval(Marquee2,speed)} //鼠标离开重新计数
</script>
  </body>
</html>
