<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<SCRIPT language="JavaScript">
			function validateForm(theForm) {
				if((theForm.id.value == "")||
				(theForm.name.value == "")||
				(theForm.place.value == "")||
				(theForm.point.value == "")){
				if(theForm.id.value == "") alert("����д�γ̺ţ�");
				if(theForm.name.value == "") alert("����д�γ�����");
				if(theForm.place.value == "") alert("����д�Ͽεص㣡");
				if(theForm.point.value == "") alert("����д�γ�ѧ�֣�");
				return false;
				}
			return true;
			}
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<%Connection con=scms.dao.MyDAO.openDB();%>
	<center>
		¼������---ʹ���ߣ�
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
		<form method="post" action="/SCMS/servlet/NewCourse"
			name="NewCourseForm"
			onsubmit="return validateForm(document.NewCourseForm)">
			&nbsp;&nbsp;������γ̺�:
			<input type="text" name="id" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			&nbsp;&nbsp;������γ���:
			<input type="text" name="name" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			�������Ͽ�ʱ��:
			<select name="time1">
				<option value="����һ">����һ</option>
				<option value="���ڶ�">���ڶ�</option>
				<option value="������">������</option>
				<option value="������">������</option>
				<option value="������">������</option>
			</select>
			<select name="time2">
				<option value="����">����</option>
				<option value="����">����</option>
				<option value="����">����</option>
			</select>
			<br>
			�������Ͽεص�:
			<input type="text" name="place" size="18"
			style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">			
			<br>
			�������ڿ���ʦ:
			<select name="teacher">
				<%
					java.sql.ResultSet rs = scms.dao.MyDAO.select(con, "*",
					"User_table", "CONDITION =" + 2+"ORDER BY NAME ASC");
					while (rs.next()) {
				%>
				<option value="<%=rs.getString("NAME")%>">
					<%=rs.getString("NAME")%>
				</option>
				<%
				}
				%>
			</select> 
			&nbsp; &nbsp; &nbsp; &nbsp;<br>
			������γ�ѧ��:
			<input type="text" name="point" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			�Ƿ�Ϊѧλ��:&nbsp; ��
			<input type="radio" name="degree" value=1>
			&nbsp; ��
			<input type="radio" name="degree" value=2 checked="checked">
			<br>
			<br>
			<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px" onclick="return validateForm(document.NewCourseForm)">
		</form>
	</center>
</html>
