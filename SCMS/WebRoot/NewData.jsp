<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<SCRIPT language="JavaScript">
			function validateForm(theForm) {
				if(	(theForm.psw.value == "") ||	
				(theForm.id.value == "")||
				(theForm.name.value == "")){
				if(theForm.id.value == "") alert("����д�ʺţ�");
				if(theForm.name.value == "") alert("����д������");
				if(theForm.psw.value == "") alert("����д���룡");
				return false
				}
			return true
			}  
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<center>
		¼���û�---ʹ���ߣ�
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/NewData"
		name="NewDataForm" onsubmit="return validateForm(document.NewDataForm)">
		��ѡ�������û�:&nbsp;
		ѧ��<input type="radio" name="condition" value=1 checked="checked">
		&nbsp;
		��ʦ<input type="radio" name="condition" value=2>
		&nbsp;
		����Ա<input type="radio" name="condition" value=3> 
		<br><br>
		�����������ʺ�:
		<input type="text" name="id" size="18"
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		��������������:
		<input type="text" name="name" size="18"
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		�������ʹ����:
		<input type="password" name="psw" size="18" 
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		<br>
		<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
		</form>
</center>
</html>