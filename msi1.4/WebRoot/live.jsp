<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>

  </head>
  
  <body>
   <script type="text/javascript">
    var xmlHttp=null;
    var current;
    var t = n = count = 0;  
    var urlBase="http://127.0.0.1:8080/msi2/";
    var tempURL="erro";
    
    function GetXmlHttpObject(handler){ 
    	//alert(21);
		var objXmlHttp=null;
		objXmlHttp=new XMLHttpRequest();
		if(objXmlHttp.overrideMimeType){
			objXmlHttp.overrideMimeType('text/xml'); 
		}	
		objXmlHttp.onload=handler ;
		objXmlHttp.onerror=handler ;
		//alert(objXmlHttp);//
		return objXmlHttp;
	}
    
    
    function doaction(){
    	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
			//alert(xmlHttp.responseText);
			document.getElementById("content").innerHTML=xmlHttp.responseText //xmlHttp的responseText方法 得到读取页数据,一定要抓取到当前页面，可以设为隐藏
   			//document.getElementById("which2").value=xmlHttp.responseText.substr(0); //xmlHttp的responseText方法 得到读取页数据
  			 current= Number(document.getElementById("which").innerHTML);
   			 tempURL=document.getElementById("url").innerHTML;
   			 method(current-1);
   			if(tempURL!="erro"){
	   			var temp=urlBase+tempURL;
	   			//alert(temp);
    			window.location.href=tempURL;
  			}
    	}
	}


	function startXMLHttp(){
		var url = "which.jsp" ;
		var callbackfun= doaction ;
		//alert(1);
		xmlHttp=GetXmlHttpObject(callbackfun);
		xmlHttp.open("GET", url , true);
		xmlHttp.send(null);

		setTimeout("startXMLHttp()" , 1500);
	}


	window.onload = startXMLHttp() ;
	
    function method(x){ 
       
    }//end method
    
 
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
  
  <table width="55%" height="55%">
  <tr>
  <td><img src="imgTV/chongqing.jpg"/><br/>
  <a href="live/chongqing.jsp">重庆卫视</a></td>
  <td><img src="imgTV/hubei.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/hubei.jsp">湖北卫视</a></td>
  <td><img src="imgTV/yunnan.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/yunnan.jsp">云南卫视</a></td>
  <td><img src="imgTV/shandong.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/shandong.jsp">山东卫视</a></td>
  <td><img src="imgTV/sichuan.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/sichuan.jsp">四川卫视</a></td>
  </tr>
  <tr>
  <td><img src="imgTV/guizhou.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/guizhou.jsp">贵州卫视</a></td>
  <td><img src="imgTV/beijing.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/beijing.jsp">北京卫视</a></td>
  <td><img src="imgTV/dongnan.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/dongnan.jsp">东南卫视</a></td>
  <td><img src="imgTV/gansu.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/gansu.jsp">甘肃卫视</a></td>
  <td><img src="imgTV/henan.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/henan.jsp">河南卫视</a></td>
  </tr>
   <tr>
  <td><img src="imgTV/jiangsu.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/jiangsu.jsp">江苏卫视</a></td>
  <td><img src="imgTV/lvyou.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/lvyou.jsp">旅游卫视</a></td>
  <td><img src="imgTV/qinghai.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/qinghai.jsp">青海卫视</a></td>
  <td><img src="imgTV/shenzhen.jpg"/><br/>
  <a href="http://127.0.0.1:8080/msi/live/shenzhen.jsp">深圳卫视</a></td>
  <td><img src="imgTV/youxi.jpg"/><br/>
  <a href="live/youxi.jsp">游戏卫视</a></td>
  </tr>
  </table>
 
  </body>
</html>
