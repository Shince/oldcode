<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<SCRIPT language="JavaScript">
			function validateForm(theForm) {
				if(	(theForm.psw1.value == "") ||	
				(theForm.psw2.value == "")||
				(theForm.psw1.value != theForm.psw2.value)){
				if(	(theForm.psw1.value == "") ||	
				(theForm.psw2.value == "")) alert("请填写密码！");
				if( theForm.psw1.value != theForm.psw2.value )
				alert("两次输入密码不一致！");
				return false
				}
			return true
			}  
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<center>
		修改密码---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/ChangePSW"
		name="PSWForm" onsubmit="return validateForm(document.PSWForm)">
		请输入您的旧密码:
		<input type="password" name="psw" size="18"
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		请输入您的新密码:
		<input type="password" name="psw1" size="18" 
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		请再输入一次密码:
		<input type="password" name="psw2" size="18" 
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		<br>
		<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
		</form>
</center>
</html>