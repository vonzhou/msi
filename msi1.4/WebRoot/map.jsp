<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
<meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
<title>百度地图API自定义地图</title>
<!--引用百度地图API-->
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
</head>

<body>
  <!--百度地图容器-->
  <div style="width:697px;height:550px;border:#ccc solid 1px;" id="dituContent"></div>
</body>
<script type="text/javascript">
var map =null;


    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }
    
    //创建地图函数：
    function createMap(){
        map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(114.317637,30.792267);//定义一个中心点坐标
        map.centerAndZoom(point,10);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    
    function ZoomControl(){
  // 默认停靠位置和偏移量
  this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
  this.defaultOffset = new BMap.Size(10, 10);
}

// 通过JavaScript的prototype属性继承于BMap.Control
ZoomControl.prototype = new BMap.Control();

// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
ZoomControl.prototype.initialize = function(map){
  // 创建一个DOM元素
  var div = document.createElement("div");
  // 添加文字说明
  div.appendChild(document.createTextNode("放大1级"));
  // 设置样式
  div.style.cursor = "pointer";
  div.style.border = "1px solid gray";
  div.style.backgroundColor = "white";
  // 绑定事件,点击一次放大两级
  div.onclick = function(e){
    //map.setZoom(map.getZoom() + 2);
   // alert(map.getZoom());
   //map.setZoom(14);
 // map.reset();
 map.zoomIn();
  }
  // 添加DOM元素到地图中
  map.getContainer().appendChild(div);
  // 将DOM元素返回
  return div;
}
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	
        var myZoomCtrl = new ZoomControl();
// 添加到地图当中
map.addControl(myZoomCtrl);
        
        //map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	//var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	//map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	//var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	//map.addControl(ctrl_sca);
    }
    
    
    initMap();//创建和初始化地图
    
    

//var map = new BMap.Map("allmap");
//map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);

// 定义一个控件类,即function

// 创建控件


 
</script>



</html>