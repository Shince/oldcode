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
				(theForm.psw2.value == "")) alert("����д���룡");
				if( theForm.psw1.value != theForm.psw2.value )
				alert("�����������벻һ�£�");
				return false
				}
			return true
			}  
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<center>
		�޸�����---ʹ���ߣ�
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/ChangePSW"
		name="PSWForm" onsubmit="return validateForm(document.PSWForm)">
		���������ľ�����:
		<input type="password" name="psw" size="18"
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		����������������:
		<input type="password" name="psw1" size="18" 
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		��������һ������:
		<input type="password" name="psw2" size="18" 
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		<br>
		<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
		</form>
</center>
</html>