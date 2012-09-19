<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <!--IBM WebSphere Portal-->
   
   <title>CDUG: China DB2 Users Group / 中国DB2用户组</title>

		<META http-equiv="Content-Type" content="text/html; charset=utf-8">
		<META name="GENERATOR" content="IBM WebSphere Studio">
		<META http-equiv="Content-Style-Type" content="text/css">
		<style type="text/css">
		BODY {
		BACKGROUND-POSITION: 50% top; FONT-SIZE: 5px; MARGIN: -1px 0px; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: center
		}
		.text {
		FONT-SIZE: 12px; RIGHT: 4px; LEFT: 4px; COLOR: #000000; BOTTOM: 4px; LINE-HEIGHT: 16px; FONT-STYLE: normal; TOP: 4px; TEXT-ALIGN: left
		}
		</style>
</head>
<body>
<P class=text> 
<font size="3" color="#0000ff"><strong>图片上传成功！<br></strong></font>
图片名:<%=request.getParameter("fileName") %><br>
上传时间:<%=request.getParameter("date") %><br> 
URL: http://www.db2china.org/CDUG/source/Release/<%=request.getParameter("date")%>/<%=request.getParameter("fileName")%> 
</P></body>
</html>