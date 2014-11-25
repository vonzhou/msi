<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Movie Page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <style type="text/css">
    body{
    background-image: url("imgs/bg.jpg");
    width: 1366px;
    height: 600px;
    overflow: hidden;
    }
    .menu{
    border:solid 1px red;
    }
    #menu{
    font-size: 30px;
    color:red;
    width: 250px;
    height:600px;
    border: thick;
    float: left;
    position: absolute;
    }
    
    #show{
    width: 1116px;
    height:600px;
    float: right;
    background-color: gray;
    }
    
    #image{
    }
    
    
    
    </style>

  </head>
  
  <body onload="loadPage();">
  <script>
  var currentMenu=3;//当前选中菜单
  var menuCount=10;//菜单数量
  var currentImg="TVplayImgs/baifamonv.jpg";
  var base="NewsImgs/";
  var xmlHttp=null;
  var xmlHttp2=null;//利用这个请求在每次响应后清除控制标志,这种方案不可行。
  var timerValuePre=-1;//利用本次ajax请求获得的定时器值，与之前的进行比较如果相同
  //则表示无效，否则进行响应，并且更新timerValuePre
  var timerValueCurrent=null;//
  var enterFlag=0;//
  
  
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
	document.getElementById("content").innerHTML=xmlHttp.responseText;
	var key=Number(document.getElementById("key").innerHTML);
	timerValueCurrent=Number(document.getElementById("timer").innerHTML);
	enterFlag=Number(document.getElementById("enterFlag").innerHTML);
	
	if(timerValuePre!=timerValueCurrent){
		timerValuePre=timerValueCurrent;
		//alert(key);
	switch(key){
		case -1://key invalid,do nothing.
			break;
		case 39: //right
			break; 
		case 37:   //left
			 break;
		case 40:  //down key
			wipeOldMenu();
			currentMenu = currentMenu >= menuCount ?  1: (currentMenu + 1);
			operateMenu(currentMenu);
			break;
		case 38:  //up key
		 	wipeOldMenu();
			currentMenu = currentMenu <= 1 ? menuCount : (currentMenu - 1);
			operateMenu(currentMenu);
			break; 
		case 13:  //enter
			break;	
		case 640://back
			break;
		case 468://home
			window.location.href="home.jsp";
			break;
	}//end switch
	
	if(enterFlag==1){
		var url="movie/test.html";
		window.location.href=url;
	}
	
	
	
	}//end !=
	
    }//end if readystate
  }

	function startXMLHttp(){
		var url = "generalMonitor.jsp?flag=";
  		var callbackfun= doaction ;
		xmlHttp=GetXmlHttpObject(callbackfun);
		xmlHttp.open("GET", url , true);
		xmlHttp.send(null);
		
		setTimeout("startXMLHttp()" , 1000);
	}
	
	function startXMLHttp2(){
		var url = "generalInvalid.jsp" ;
		var callbackfun= Invalide ;
		xmlHttp2=GetXmlHttpObject(callbackfun);
		xmlHttp2.open("GET","",true);
		xmlHttp2.send(null);
		setTimeout("startXMLHttp2()" , 1500);
	}


	function Invalide(){
		
	}
	
	function wipeOldMenu(){
		var curentDiv=document.getElementById(currentMenu);
		curentDiv.style.backgroundColor="";
		curentDiv.style.fontSize="30px";
	}
	
	function operateMenu(current){
		var curentDiv=document.getElementById(current);
		curentDiv.style.backgroundColor="cyan";
		curentDiv.style.fontSize="40px";
		
		currentImg=base+getCurrentImg();
		var image=document.getElementById("image");
		image.setAttribute("src",currentImg)
		//curentDiv.style.;
		//alert("ddddddddddddd");
	}
	
	function getCurrentImg(){
		var temp="";
		switch(currentMenu){
		case 1:temp="xinhua.jpg";break;
		case 2:temp="chutian.jpg";break;
		case 3:temp="ifeng.jpg";break;
		case 4:temp="sina.jpg";break;
		case 5:temp="huanqiu.jpg";break;
		case 6:temp="tecent.jpg";break;
		case 7:temp="yahoo.jpg";break;
		case 8:temp="renmin.jpg";break;
		case 9:temp="wangyi.jpg";break;
		case 10:temp="mingzhan.jpg";break;
		default:temp="404.jpg";break;
		}
		return temp;
	}
	
	function loadPage(){
	operateMenu(currentMenu);
	startXMLHttp();
	//startXMLHttp2();
	}
	//window.onload = 
//ajaxUrl();
	
	//点击遥控器键事件驱动
    	document.onkeydown = function(e){
				if(ajaxFinish == 0)
				return;
				var val =  e.which || e.keyCode;  
				//alert(val);
				var type;
				switch(val){	
					case 640: //return
						e.preventDefault();
						break;
					case 27:
						e.preventDefault();
						AppManager.startLocalAppByID("com_coship_app_dvbplayer",'');
						break;
					case 39: //right
					     break; 
					case 37:   //left
						 break;
					case 40:  //down key
						 wipeOldMenu();
						 currentMenu = currentMenu >= menuCount ?  1: (currentMenu + 1);
						 operateMenu(currentMenu);
						 break;
					case 38:  //up key
						 wipeOldMenu();
						 currentMenu = currentMenu <= 1 ? menuCount : (currentMenu - 1);
						 operateMenu(currentMenu);
						 
						 break; 
					case 13:  //enter
						break;	
					case 468:  //home
						window.location.href="http://127.0.0.1:8080/msi2/IndexServlet";
						break;	
					case 27:  //exit
						break;	
						 
					case 48: break;	 
					case 49:  //1
						 break;
					case 50:	//2
						break;	
					case 51:
						break;	//3
					case 52:	
						break;	//4
					case 53:	
						break;	//5
					case 54:
						break;	//6
					case 55: 
						break;	//7
					case 56: 
						break;	//8
					default:
						 break;
				}
				
			}//end grabDown

</script>
    <div id="menu">
    <div id="1" class="menu">新华网</div>
  	<div id="2" class="menu">楚天都市报</div>
  	<div id="3" class="menu">凤凰资讯</div>
  	<div id="4" class="menu">新浪新闻</div>
  	<div id="5" class="menu">环球网</div>
  	<div id="6" class="menu">腾讯资讯</div>
  	<div id="7" class="menu">中国雅虎</div>
  	<div id="8" class="menu">人民网</div>
  	<div id="9" class="menu">网易资讯</div>
  	<div id="10" class="menu">新闻名站</div>
    </div>
    
    <div id="show">
    <img alt="" src="" id="image"/>
    </div>
    <div id="content"></div>
  </body>
</html>
