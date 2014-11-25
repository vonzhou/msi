<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index2.jsp' starting page</title>

	<style type="text/css">    
*{font-size:20px; font-family:Verdana;margin:0;padding:0}    
#play img {border:0px}    
#play {width:692px;height:382px;overflow:hidden;margin:0 0 0 0;}    
#play_info{position:absolute;margin-top:300px;padding:8px 0 0 20px;height:42px;width:550px;color:#fff;z-index:1001;}    
#play_info b{font-size:14px;display:block;font-color:#00f}    
#play_bg {position:absolute;background-color:#000;margin-top:300px;height:50px;width:346px;filter: Alpha(Opacity=30);opacity:0.3;z-index:1000}    
#play_text {position:absolute;margin:300px 0 0 600px;height:50px;width:500px;z-index:1002;}    
#play_text ul {list-style-type:none; width:60px;height:50px;display:block;padding-top:1px;_padding-top:0px;filter: Alpha(Opacity=80);opacity:0.8;}    
#play_text ul li {width:18px;height:18px;float:left;background-color:#000;display:block;color:#FFF;text-align:center;margin:1px;cursor:pointer;font-family:"Courier New";}    
#play_list a{display:block;width:692px;height:382px;position:absolute;overflow:hidden}    
</style>  



	
  </head>
  
  <body>
  <script type="text/javascript" src="jquery.js.php"></script>
    <script type="text/javascript">
    var t = n = count = 0;  
   	var current=1;
    
    function method(x)
{
    	$("#play_info").html($("#play_list a").eq(arguments[0]).find("img").attr('alt'));    
        $("#play_info").unbind().click(function(){window.open($("#play_list a").eq(arguments[0]).attr('href'), "_blank")})    
        $("#play_list a").filter(":visible").fadeOut(500).parent().children().eq(arguments[0]).fadeIn(1000);    
        $("#play_text li").css({"background":"#fff",'color':'#000'}).siblings().css({"background":"#000",'color':'#fff'});
        $("#flag").html((arguments[0]+1)).css({"background":"#fff",'color':'#f00'});
 }
    
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
     	method(i);
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
						//window.location.href="http://127.0.0.1:8080/msi/chanel1.jsp";break;			 
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
    <a href="http://localhost:808/" target="_blank">   
        <img src="imgs/1.jpg" title="" alt="<b>搜索一下</b>无限乐趣，由你选择！" width=692px height="382px"/>   
    </a>   
    <a href="http://localhost:8080/msi/index2.jsp" target="_blank">   
        <img src="imgs/2.jpg" title="" alt="<b>经典电影</b>为什么选择我？这个问题的答案很长，我需要用一生的时间来回答你。" />   
    </a>   
    <a href="http://koyoz.com/3.jpg" target="_blank">   
        <img src="./imgs/3.jpg" title="" alt="<b>直播频道</b>熊猫”阿宝为啥这么红？" />   
    </a>   
    <a href="http://koyoz.com/4.jpg" target="_blank">   
        <img src="./imgs/4.jpg" title="" alt="<b>热播剧场</b>" />   
    </a>   
    <a href="http://koyoz.com/5.jpg" target="_blank">   
        <img src="./imgs/5.jpg" title="" alt="<b>综艺荟萃</b>天后王菲“复出”开价一亿" />   
    </a>   
    <a href="http://koyoz.com/6.jpg" target="_blank">   
        <img src="./imgs/6.jpg" title="" alt="<b>新闻实事</b>阿Sa赞郑伊健“保存”得好" />   
    </a>   
    <a href="http://koyoz.com/7.jpg" target="_blank">   
        <img src="./imgs/7.jpg" title="" alt="<b>体育</b>北影演员：甘当‘死跑龙套的’" />   
    </a>   
    <a href="http://koyoz.com/8.jpg" target="_blank">   
        <img src="./imgs/8.jpg" title="" alt="<b>心灵之旅</b>我要登高，我要望远，我要做一次心灵的洗涤" />   
    </a>   
    <a href="http://koyoz.com/9.jpg" target="_blank">   
        <img src="./imgs/1.jpg" title="" alt="<b>服务指南</b>联系我们　ｖｏｎｚｈｏｕ＠１６３．ｃｏｍ" />   
    </a>   
    </div>   
</div>  
    <script type="text/javascript">
    method(1);
    </script>
    
    
    
  </body>
</html>
