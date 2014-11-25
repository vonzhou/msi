<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function func(){
		var mp = new MediaPlayer();//创建一个MediaPlayer 对象，同时生成本地播放实例的标识
		alert(mp);
		var nativePlayerInstanceId = mp.getNativePlayerInstanceId ();//读取本地的媒体播放
		//实例的标识。保留这个标识以便在跨页面时，标识这个本地的媒体播放实例
		var url="http://play.baidu.com/?__m=mboxCtrl.playSong&__a=1262598&__o=/song/1262598||playBtn&fr=-1||www.baidu.com";
		mp.setSingleMedia(url); //设置媒体播放器播放媒体内容，支持URL 格式
		mp.playFromStart();//开始播放
	}
	



	</script>

  </head>
  
  <body>
   <input type="button" value="Play"  onclick="func();"/>

  </body>
</html>
