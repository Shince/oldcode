<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<link rel="stylesheet" type="text/css" media="all" href="../style/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/calendar-zh.js"></script>
<script type="text/javascript" src="../js/calendar-setup.js"></script>

<div id="genTable">

	<div id="input">
		pmrID:
		<input type="text" name="pmrID" size="10" maxlength="7"/>
		<br />
		
		起始日期：
		<input type="text" name="d_s" size="20" value="2002-11-1" id="begin_date_b">
		<input type="reset" value="..." onclick="return showCalendar('begin_date_b', 'y-m-d');">
		<br />
		
		终止日期：
		<input type="text" name="d_e" size="20" value="2004-11-1" id="end_date_b">
		<input type="reset" value="..." onclick="return showCalendar('end_date_b', 'y-m-d');">
		<br />
	</div>
	<div id="status">
		blah...blah....
	</div>

</div>