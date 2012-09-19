<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<SCRIPT language="JavaScript">
			function validateForm(theForm) {
				if(theForm.id.value == ""){
				alert("请填写要修改的帐户！");
				return false
				}
			return true
			}  
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<center>
		修改用户---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
	</center>
	<form method="post" action="/SCMS/servlet/ChangeData" name="ChangeDataForm"
		onsubmit="return validateForm(document.ChangeDataForm)">
		<center>
			请输入要修改的帐户:
			<input type="text" name="id" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>

			<br>
			请输入修改信息:
			<br>
			帐户:
			<input type="text" name="newid" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			姓名:
			<input type="text" name="name" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			密码:
			<input type="password" name="psw" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			<br>
			<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
			<br>
			<br>
			注:修改信息如不填写默认为不修改此项。
	</center>
	</form>
</html>
