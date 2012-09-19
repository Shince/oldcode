<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="DAO.DAO" />
<jsp:directive.page import="utility.*" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>CDUG Administrator's Control Panel</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href='/CDUG/css/login.css' rel="stylesheet"
			type="text/css" />
	</head>
	<script language="JavaScript">
if(self.parent.frames.length != 0) {
	self.parent.location=document.location;
}
function redirect(url) {
	window.location.replace(url);
}
</script>
	<br />
	<br />
	<br />
	<br />
	<jsp:useBean class="Bean.User" id="user_session" scope="session" />
	<form method="post" name="login" action="/CDUG/servlet/Adminlogin">
	<input type="hidden" name="name" value="<%=user_session.getUser_id()%>">
		<%
		if(!(user_session.getUser_access()==2)) {
		%>
		<script type="text/javascript">
		javascript:parent.location='/CDUG/index.jsp'
		</script>
		<%
		}
		%>
		<table width="600" border="0" cellpadding="8" cellspacing="0"
		class="logintable" align="center">
		<tr class="loginheader">
			<td width="80"></td>
			<td width="100"></td>
			<td></td>
			<td width="120"></td>
			<td width="80"></td>
		</tr>
		<tr style="height: 40px">
			<td>
				&nbsp;
			</td>
			<td class="line1">
				<span style="color: #ffff66; font-size: 14px; font-weight: bold;">后台管理</span>
			</td>
			<td class="line1">
				&nbsp;
			</td>
			<td class="line1">
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td class="line2">
				&nbsp;
			</td>
			<td class="line2">
				&nbsp;
			</td>
			<td class="line2">
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td align="right">
				用户名:
			</td>
			<td>
				<%=user_session.getUser_id()%>
			</td>
			<td>
				<a
					href="javascript:window.close();">退出</a>
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td align="right">
				密 码:
			</td>
			<td>
				<input type="password" name="admin_password" size="25">
			</td>
			<td>
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td class="line1">
				&nbsp;
			</td>
			<td class="line1" align="center">
				<input type="submit" class="button" value="提 交" />
				<script language="JavaScript">document.login.admin_password.focus();</script>
			</td>
			<td class="line1">
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td class="line2">
				&nbsp;
			</td>
			<td class="line2">
				&nbsp;
			</td>
			<td class="line2">
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
			<td>
				&nbsp;
			</td>
		</tr>	
	</table>
	</form>
</html>