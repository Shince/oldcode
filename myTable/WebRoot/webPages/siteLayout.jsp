<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html:html lang="true">
  <head>
    <html:base />
    
    <title><tiles:getAsString name="title" ignore="true" /></title>

	<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="PMR,Customer,Search">
	<meta http-equiv="description" content="Customer PMR Search Page">
	
	<link rel="stylesheet" type="text/css" href="../style/styles.css">
	<script src="../js/jquery.js" type="text/javascript"></script>
	<script src="../js/jqueryEIP2.js" type="text/javascript"></script>

	<script src="../js/jsFunction.js" type="text/javascript"></script>
	<script src="../js/ajax.js" type="text/javascript"></script>
	
	<link rel="stylesheet" type="text/css" media="all" href="../style/calendar-win2k-cold-1.css" title="win2k-cold-1" />
	<script type="text/javascript" src="../js/calendar.js"></script>
	<script type="text/javascript" src="../js/calendar-zh.js"></script>
	<script type="text/javascript" src="../js/calendar-setup.js"></script>
	
	
  </head>
  
  <body>

	    <table cellpadding="0" cellspacing="0" align="center" width="100%">
	    	<tr height="20">
	    		<td>
	    			<tiles:insert attribute="header" ignore="false"></tiles:insert>
	    		</td>
	    	</tr>
	    	<tr height="15">
	    		<td>
	    			<tiles:insert attribute="queryLable" ignore="false"></tiles:insert>
	    		</td>
	    	</tr>
	    	<tr height="500">
	    		<td>
	    			<tiles:insert attribute="tableLable" ignore="false" ></tiles:insert>
	    		</td>
	    	</tr>
	    	<tr height="15">
	    		<td>
	    			<tiles:insert attribute="footer" ignore="false"></tiles:insert>
	    		</td>
	    	</tr>
	    </table>

  </body>
</html:html>
