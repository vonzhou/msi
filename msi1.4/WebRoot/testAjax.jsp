<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="margin-top: 1px;" bgcolor="#243069">

</body>
<script>
var x=1;

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
//alert(23);
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
//alert(xmlHttp.responseText);
document.getElementById("test").innerHTML=xmlHttp.responseText+x;
x++;
   
		 
      }
}

function startXMLHttp(){
var url = "which.jsp" ;
var callbackfun= doaction ;
//alert(1);
	xmlHttp=GetXmlHttpObject(callbackfun);
	xmlHttp.open("GET", url , true);
	xmlHttp.send(null);
	
	setTimeout("startXMLHttp()" , 1000);
}


window.onload = startXMLHttp() ;

//ajaxUrl();

</script>

<div id="test"></div>
</html>
