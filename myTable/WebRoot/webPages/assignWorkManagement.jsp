<%@ page language="java" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Assign Work Management</title>
  </head>
  
  <body>
  <div id="AssignWorkManagement">
    <div id="CustomerNames">
    	Loading Customer Names...
    </div>
    <div id="Workers">
    	Loading Workers...
    </div>
    <div id="Status">
    </div>
  </div>
  </body>
</html>
