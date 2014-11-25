<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Pattern 1</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <style type="text/css">
  
    #up{
    width: 1260px;
    height:175px;
    }
    #up_wrap1,#bottom_wrap1{
     width: 630px;
    height:175px;
    float:left;
    }
    #up_wrap2,#bottom_wrap2{
    width: 630px;
    height:175px;
    float:right;
    }
    #u1,#b1{
    width: 315px;
    height:175px;
    float:right;
    background-color:#CC6699;
    }
    #u2,#b2{
    width: 315px;
    height:175px;
    float:right;
    background-color:#FF99FF;
    }
    #u3,#b3{
    width: 315px;
    height:175px;
    float:left;
    background-color:#FF6600;
    }
    #u4,#b4{
    width: 315px;
    height:175px;
    float:right;
    background-color:#FFFF33;
    }
    #bottom{
    width: 1260px;
    height:175px;
    }
    #middle{
    width: 1260px;
    height:350px;
    background-color:;
    }
    #m1{
    width: 315px;
    height:350px;
    float: left;
    background-color: gray;
    }
    #tv{
    font-size: 30px;
    background-color:;
    color:red;
    width: 630px;
    height:350px;
    border: thick;
    float: right;
    }
    
    #wrap{
    width: 945px;
    height:350px;
    float: left;
    }
    #m2{
    width: 315px;
    height:175px;
    float: right;
    background-color: gray;
    font-size:40px;
    color:red;
    }
    
    </style>

  </head>
  
  <body bgcolor="transparent">
  <script>
  var xmlHttp=null;
  
  var volume=50;
  var mp= new MediaPlayer();
  mp.setSingleMedia("deliver://259000000.6875.64.9");
  mp.playFromStart();
  mp.setVideoDisplayMode(0);
  mp.setVideoDisplayArea(315,175,633,353);
  mp.refreshVideoDisplay();
  
  
  var u1=document.getElementById("u1_img");
  var u2=document.getElementById("u2");
  var u3=document.getElementById("u3");
  var u4=document.getElementById("u4");
  var m1=document.getElementById("m1");
  var m2=document.getElementById("m2");
  var b1=document.getElementById("b1");
  var b2=document.getElementById("b2");
  var b3=document.getElementById("b3");
  var b4=document.getElementById("b4");
  var imgStr1="";
  var imgStr2="";
  var imgStr3="";
  var imgStr4="";
   var num = new Array();
  function getNumb(){
       
        for(var i = 0; i < 4; i++){
            var val =  Math.ceil(Math.random() * 20+1);
            var isEqu = false;
            for(var idx in num){
                if(num[idx] == val){isEqu = true; break;}
            }
            if(isEqu)
                i--;
            else
                num[i] = val;
        }
        //return num;
    }
 
  
  function updateLogo(){
	  getNumb();
	  //alert(num);
	  imgStr1="LogoImg1/"+num[0]+".jpg";
	  imgStr2="LogoImg1/"+num[1]+".jpg";
	  imgStr3="LogoImg1/"+num[2]+".jpg";
	  imgStr4="LogoImg1/"+num[3]+".jpg";
	  document.images[0].src=imgStr1;
	  document.images[1].src=imgStr2;
	  document.images[2].src=imgStr3;
	  document.images[3].src=imgStr4;
	  
	  imgStr1="LogoImg2/"+num[0]+".jpg";
	  imgStr2="LogoImg2/"+num[1]+".jpg";
	  document.images[4].src=imgStr1;
	  document.images[5].src=imgStr2;
	  
	  imgStr1="LogoImg3/"+num[0]+".jpg";
	  imgStr2="LogoImg3/"+num[1]+".jpg";
	  imgStr3="LogoImg3/"+num[2]+".jpg";
	  imgStr4="LogoImg3/"+num[3]+".jpg";
	  document.images[6].src=imgStr1;
	  document.images[7].src=imgStr2;
	  document.images[8].src=imgStr3;
	  document.images[9].src=imgStr4;
	  
  }
  
 setInterval(updateLogo,2000);
  
  
  
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
	
    }//end if readystate
  }

	function startXMLHttp(){
		var url = "monitor4p1.jsp";
  		var callbackfun= doaction ;
		xmlHttp=GetXmlHttpObject(callbackfun);
		xmlHttp.open("GET", url , true);
		xmlHttp.send(null);
		
		setTimeout("startXMLHttp()" , 1000);
	}
	
	


	
	
	function loadPage(){
	//operateMenu(currentMenu);
	//startXMLHttp();
	//disptime();
	}
	
	//点击遥控器键事件驱动
    	document.onkeydown = function(e){
				if(ajaxFinish == 0)
				return;
				var val =  e.which || e.keyCode;  
				
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
						//alert(current+"");
					     break; 
					case 37:   //left
						 break;
					case 40:  //bottom
					case 38:  //top
						 break; 
					case 13:  //enter
					window.location.href="pattern2.jsp";
					break;
						 
					case 48: break;	 
					case 49:  //1
						window.location.href="index.jsp";	
						//alert("Hello vonzhou!");
						 break;
					case 50:	//2
						break;	
					case 51:
						break;	//3
					
					default:
						 break;
				}
				
			}//end grabDown
	

</script>
	<div id="up">  
	<div id="up_wrap1">
   <div id="u1"><img src="LogoImg1/1.jpg" width="314px" height="174px"/> </div>
    <div id="u2"> <img src="LogoImg1/2.jpg" width="314px" height="174px"/></div>
   </div>
  <div id="up_wrap2">
   <div id="u3"><img src="LogoImg1/3.jpg" width="314px" height="174px"/> </div>
    <div id="u4"><img src="LogoImg1/4.jpg" width="314px" height="174px"/> </div>
   </div>
	</div>
   
   <div id="middle">  
   <div id="wrap">
   <div id="m1"><img src="LogoImg2/1.jpg" width="314px" height="349px"/> </div>
    <div id="tv"> </div>
   </div>
   <div id="m2"><img src="LogoImg2/2.jpg" width="314px" height="349px"/> </div>
   </div>
   
    <div id="bottom">  
   <div id="bottom_wrap1">
   <div id="b1"><img src="LogoImg3/1.jpg" width="314px" height="174px"/> </div>
    <div id="b2"><img src="LogoImg3/2.jpg" width="314px" height="174px"/> </div>
   </div>
  <div id="bottom_wrap2">
   <div id="b3"><img src="LogoImg3/3.jpg" width="314px" height="174px"/> </div>
    <div id="b4"><img src="LogoImg3/4.jpg" width="314px" height="174px"/> </div>
   </div>
   </div>
   
    
    <div id="content"></div>
  </body>
</html>
