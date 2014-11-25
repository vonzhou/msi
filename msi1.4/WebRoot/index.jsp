<%@ page language="java" import="java.util.*,java.sql.*,vonzhou.servlet.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MSI Navigation</title>

	<style type="text/css">    
*{font-size:20px; font-family:Verdana;margin:0;padding:0}    
#play img {border:0px}    
#play {width:900px;height:600px;overflow:hidden;margin:0 0 0 0;}    
#play_info{position:absolute;margin-top:500px;padding:8px 0 0 20px;height:100px;width:500px;color:#fff;z-index:1001;}    
#play_info b{font-size:20px;display:block;font-color:#00f}    
#play_bg {position:absolute;background-color:#000;margin-top:500px;height:70px;width:800px;filter: Alpha(Opacity=30);opacity:0.3;z-index:1000}    
#play_text {position:absolute;margin:500px 0 0 700px;height:50px;width:600px;z-index:1002;}    
#play_text ul {list-style-type:none; width:60px;height:50px;display:block;padding-top:1px;_padding-top:0px;filter: Alpha(Opacity=80);opacity:0.8;}    
#play_text ul li {width:18px;height:18px;float:left;background-color:#000;display:block;color:#FFF;text-align:center;margin:1px;cursor:pointer;font-family:"Courier New";}    
#play_list a{display:block;width:800px;height:600px;position:absolute;overflow:hidden}    
</style>  

	
  </head>
  <!-- //ajax实现    -->
  <body>
  <input id="which2" type="hidden"/>
  <script type="text/javascript" src="jquery.js.php"></script>
    <script type="text/javascript">
    var xmlHttp=null;
    var current;
    var t = n = count = 0;  
    //var urlBase="http://192.168.2.3:8080/msi2/";
    var urlBase="http://127.0.0.1:8080/msi2/";//本机测试时用环回地址
    var tempURL="erro";
    var mediaID="-1";
    var stbFlag="0";
    var urlArray=new Array();//
    /*在浏览器和机顶盒中间件内嵌浏览器中所使用的方式不同。*/
    /*1.在IE中测试通过
    //创建XMLHttpRequest对象
    function createXMLHttp(){
    	if(window.ActiveXObject){  //把这种情况放在前面就可以创建，why??
    		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    	}else{
    		xmlHtttp = new XMLHttpRequest();
    	}
    	if(xmlHttp==null)
    		xmlHtttp = new XMLHttpRequest();
		//alert(xmlHttp);
    }
   
    
    //
	//建立主过程
	function startXMLHttp(){
   	 	createXMLHttp(); //建立xmlHttp 对象
   	 	//alert(xmlHttp);
   	 	xmlHttp.onreadystatechange =doaction; //xmlHttp下的onreadystatechange方法 控制传送过程
    	xmlHttp.open("POST","which.jsp",true); //建立一个新的http请求，传送方式 读取的页面 异步与否(如果为真则自动调用dodo函数)
    	xmlHttp.send(null); //发送
    	
    	//alert("send request");
 
   		setTimeout("startXMLHttp()",3000);  // 定时调用 
	}
 	
	function doaction(){
		//alert("action");
		 //alert(xmlHttp.readystate);
   		 if(xmlHttp.readystate==4){ // xmlHttp下的readystate方法 4表示传送完毕
   			
       		 if(xmlHttp.status==200){ // xmlHttp的status方法读取状态（服务器HTTP状态码） 200对应OK 404对应Not Found（未找到）等
             	document.getElementById("content").innerHTML=xmlHttp.responseText //xmlHttp的responseText方法 得到读取页数据,一定要抓取到当前页面，可以设为隐藏
             	
             	//document.getElementById("which2").value=xmlHttp.responseText.substr(0); //xmlHttp的responseText方法 得到读取页数据
             	method(Number(document.getElementById("which").innerHTML)-1);
           	}
  		 } 
	}
	*/
	function updateDB(which){
   	 	xmlHttp.onreadystatechange =doaction; //xmlHttp下的onreadystatechange方法 控制传送过程
    	xmlHttp.open("GET","update.jsp?which="+which,true); //建立一个新的http请求，传送方式 读取的页面 异步与否(如果为真则自动调用dodo函数)
    	xmlHttp.send(null); //发送
	}
	
	 /*2.在机顶盒中间件内嵌浏览器*/
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
	document.getElementById("content").innerHTML=xmlHttp.responseText //xmlHttp的responseText方法 得到读取页数据,一定要抓取到当前页面，可以设为隐藏
   current= Number(document.getElementById("which").innerHTML);
   tempURL=document.getElementById("url").innerHTML;
   mediaID=Number(document.getElementById("media").innerHTML);
   stbFlag=Number(document.getElementById("stbFlag").innerHTML);
   method(current-1);
	if(mediaID>0){//先处理媒体推送,并把响应的ID传送到显示页面。
    window.location.href="media.jsp?flag="+mediaID;
	}
	
	if(stbFlag=="1"){//
    window.location.href="stb.htm";
	}
	
   if(tempURL!="erro"){//然后是处理是否进入内容页面。
	var temp=urlBase+tempURL;
    window.location.href=tempURL;
  }
  	
  // if(urlArray.length>=1){
	   //alert(urlArray.length);
	 // 
	  // window.location.href=urlArray[count];
  // }
	   
	 
	  // url=urlBase+url;
	  // alert(typeof(url));
	   //alert(url);
	  
	   //window.location.reload("google.jsp");
	  //document.location.href=url+"?backurl="+window.location.href;//??????????????why not
	   // window.open(url,"_self");                                                                         
	                                              
	                                                                             
	   //window.navigate(url+"");
	   //ScriptManager.RegisterClientScriptBlock(UpdatePanel1, typeof(UpdatePanel), "t", "window.location.href='"+url+"';", true);
    }
}

/*
//监控，当android端Enter键入时转至相应的页面。同一个xmlhttprequest对象不能进行递归访问服务器。？？？
function monitor(){
		xmlHttp.onreadystatechange =doaction2; 
    	xmlHttp.open("GET","enterFromAndroid.jsp",true); 
    	xmlHttp.send(null); //发送
}
function doaction2(){
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
	//alert(xmlHttp.responseText);
	document.getElementById("content2").innerHTML=xmlHttp.responseText //xmlHttp的responseText方法 得到读取页数据,一定要抓取到当前页面，可以设为隐藏
   //document.getElementById("which2").value=xmlHttp.responseText.substr(0); //xmlHttp的responseText方法 得到读取页数据
   var url=document.getElementById("url").innerHTML;
   //alert(url);
   if(url !="erro")    window.location.href=url;
    }
}
*/
function startXMLHttp(){
	var url = "which.jsp" ;
	var callbackfun= doaction ;
	//alert(1);
	xmlHttp=GetXmlHttpObject(callbackfun);
	xmlHttp.open("GET", url , true);
	xmlHttp.send(null);
	
	//monitor();
	
	setTimeout("startXMLHttp()" , 1500);
}


window.onload = startXMLHttp() ;

   	
   	//var whichFormAndroid=Number(document.getElementById("which2").value);
   	//如果要控制切换的不是当前页面则刷新
   	//if(current==whichFormAndroid){
   		//flag=0;	//flag=0;表示无效
   //	}
  // 	else current=whichFormAndroid;
   	//alert(current);
    
   	//根据数字导航进行滚屏
    function method(x){ 
    	var y=Number(arguments[0]);
    	$("#play_info").html($("#play_list a").eq(y).find("img").attr('alt'));    
        $("#play_info").unbind().click(function(){window.open($("#play_list a").eq(y).attr('href'), "_blank")})    
        $("#play_list a").filter(":visible").fadeOut(1).parent().children().eq(y).fadeIn(10);    
        $("#play_text li").css({"background":"#fff",'color':'#000'}).siblings().css({"background":"#000",'color':'#fff'});
        $("#flag").html((y+1)).css({"background":"#fff",'color':'#f00'});
        /*//放这里还是不行的！！！！！！！！！！
        if(tempURL !="erro"){
        	alert("hello");
        	window.location.href="google.jsp";
        }
        */
        //
       // updateDB((y+1));
        //alert("hello");
        //document.getElementById("play").focus()";
        //current=x;
    }//end method
    
   
    //页面初次加载装扮页面
    $(function(){    
    count = $("#play_list a").size();    
    $("#play_list a:not(:first-child)").hide();    
    $("#play_info").html($("#play_list a:first-child").find("img").attr('alt'));    
    $("#play_text li:first-child").css({"background":"#fff",'color':'#000'});    
    $("#play_info").click(function(){window.open($("#play_list a:first-child").attr('href'), "_blank")});    
    //$("#flag").html(1).css({"background":"#fff",'color':'#f00'});
    $("#play_text li").click(function() {    
        var i = $(this).text() - 1;    
        n = i;    
        if (i >= count) return;  
      //  alert(i+1);
     	method(i);
     	//updateDB(i+1);
    });  
    //在浏览器中测试可以自动滚屏。cannot in jidinghe
   // t = setInterval("showAuto()", 2000);    
   // $("#play").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 2000);});    
})    
   /*
function showAuto()    
{    
    n = n >= (count - 1) ? 0 : n + 1;    
    $("#play_text li").eq(n).trigger('click');    
}  
  */ 
 
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
						current = current >= 8 ? 1 : current + 1; 
						//alert(current+"");
						method(current-1);
					     break; 
					case 37:   //left
						current = current <= 1 ? 8 : current - 1; 
						method(current-1);
						 break;
					case 40:  //bottom
					case 38:  //top
						 clearTimeout(listtimer);
						 e.preventDefault();  
						 if (val == 40) type = 1;
						 else type = -1;
						 keyUpDown(type);
						 listtimer = setTimeout("cutAds(" + type + ");",300);
						 break; 
					case 13:  //enter
						window.location.href="google.jsp";break;			 
						 funonclick(elementFocusFlag,elementListFocusFlag, "");
						 
					case 48: break;	 
					case 49:  //1
							//window.location.href="http://127.0.0.1:8080/msi/chanel1.jsp";	
						//alert("Hello vonzhou!");
						method(0);
						current=1;
						 break;
					case 50:	//2
						method(1);
						current=2;
						break;	
					case 51:
						method(2);
						current=3;
						break;	//3
					case 52:	
						method(3);
						current=4;
						break;	//4
					case 53:	
						method(4);
						current=5;
						break;	//5
					case 54:
						method(5);
						current=6;
						break;	//6
					case 55: 
						method(6);
						current=7;
						break;	//7
					case 56: 
						method(7);
						current=8;
						break;	//8
						 //funonclick(elementFocusFlag,elementListFocusFlag, "url_" + (val - 49));
						break;
					default:
						 break;
				}
				
			}//end grabDown
	
    </script>

    <div id="play">     
    <div id="play_bg"></div>   
    <div id="play_info"></div>   
    <div id="play_text">   
        <ul>   
            <li>1</li>   
            <li>2</li>   
            <li>3</li>   
            <li>4</li>   
            <li>5</li>   
            <li>6</li>   
            <li>7</li>   
            <li>8</li>   
            <li id="flag"></li>   
        </ul>   
    </div>   
    <div id="play_list">   
    <a href="google.jsp" target="_blank" name="a">   
        <img src="imgs/1.jpg" title="" alt="<b></b>" width="800px" height="576px"/>   
    </a>   
    <a href="movie.jsp" target="_blank" name="a">   
        <img src="imgs/2.jpg" title="" alt="<b>经典电影</b>为什么选择我？这个问题的答案很长，我需要用一生的时间来回答你。" width="800px" height="576px"/>   
    </a>   
    <a href="live.jsp" target="_blank" name="a">   
        <img src="./imgs/3.jpg" title="" alt="<b>直播频道</b>拿什么留给你？" width="800px" height="576px"/>   
    </a>   
    <a href="TVplay.jsp" target="_blank">   
        <img src="./imgs/4.jpg" title="" alt="<b>热播剧场</b>不抛弃，不放弃。" width="800px" height="576px"/>   
    </a>   
    <a href="variety.jsp" target="_blank">   
        <img src="./imgs/5.jpg" title="" alt="<b>综艺荟萃</b>温柔的拒绝远胜于严厉的苛责" width="800px" height="576px"/>   
    </a>   
    <a href="news.jsp" target="_blank">   
        <img src="./imgs/6.jpg" title="" alt="<b>新闻实事</b>当狗咬人不是新闻，但是当一个人咬狗才是新闻" width="800px" height="576px"/>   
    </a>   
    <a href="sports.jsp" target="_blank">   
        <img src="./imgs/7.jpg" title="" alt="<b>体育</b>静止便是死亡，只有运动才能敲开永生的大门" width="800px" height="576px"/>   
    </a>   
    <a href="travel.jsp" target="_blank">   
        <img src="./imgs/8.jpg" title="" alt="<b>心灵之旅</b>我要登高，我要望远，我要做一次心灵的洗涤" width="800px" height="576px"/>   
    </a>   
    <a href="service.jsp" target="_blank">   
        <img src="./imgs/9.jpg" title="" alt="<b>服务指南</b>联系我们　ｖｏｎｚｈｏｕ＠１６３．ｃｏｍ" />   
    </a>   
    </div>   
</div>


<div id="content"  style="display:none;"></div>
<div id="content2" style="display:none;"></div>

    
    
   
    
    
  </body>
</html>
