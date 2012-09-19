<%@ page language="java" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Category Management</title>
  </head>
  
  <body>
  <div id="myCategory">
    <div id="Category">
    	Loading Main Category...
    </div>
    <div id="SubCategory">
    	Loading Sub Category...
    </div>
  </div>
  </body>
</html>
