<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<SCRIPT language="JavaScript">
			function validateForm(theForm) {
				if(((theForm.time1.value == "")&&(theForm.time2.value != ""))||
				((theForm.time1.value != "")&&(theForm.time2.value == ""))){
				alert("�γ�ʱ����д����");
				return false
				}
			return true
			}  
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />	
	<center>
		�޸��û�---ʹ���ߣ�
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
	</center>
	<form method="post" action="/SCMS/servlet/ChangeCourse" name="ChangeCourseForm"
		onsubmit="return validateForm(document.ChangeCourseForm)">
<center>
			��ѡ��Ҫ�޸ĵĿγ�:
			<select name="id">
			<option value="">��</option>
			<%
			Connection con=scms.dao.MyDAO.openDB();
			java.sql.ResultSet rs=scms.dao.MyDAO.select(con,"*","Course_table ORDER BY COURSE_NAME ASC");
			while(rs.next()){
			%>
			<option value="<%=rs.getString("COURSE_NAME")%>"><%=rs.getString("COURSE_NAME")%></option>
			<%
			}
			%>
			</select>			
			<br>
			<br>
			�������޸���Ϣ:<br>
			&nbsp;&nbsp;������γ̺�:
		<input type="text" name="newid" size="18"
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		 &nbsp;&nbsp;������γ���:
		<input type="text" name="name" size="18"
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		�������Ͽ�ʱ��:
		<select name="time1">
				<option value=""></option>
				<option value="����һ">����һ</option>
				<option value="���ڶ�">���ڶ�</option>
				<option value="������">������</option>
				<option value="������">������</option>
				<option value="������">������</option>
			</select>
			<select name="time2">
				<option value=""></option>
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
				<option value="">
					
				</option>
				<%
					java.sql.ResultSet rs1 = scms.dao.MyDAO.select(con, "*",
					"User_table", "CONDITION =" + 2+"ORDER BY NAME ASC");
					while (rs1.next()) {
				%>
				<option value="<%=rs1.getString("NAME")%>">
					<%=rs1.getString("NAME")%>
				</option>
				<%
				}
				%>
			</select>
		&nbsp; &nbsp; &nbsp; &nbsp;
		<br>
		������γ�ѧ��:
		<input type="text" name="point" size="18" 
		style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
		<br>
		�Ƿ�Ϊѧλ��:&nbsp; 
		��<input type="radio" name="degree" value=1> 
		&nbsp; 
		��<input type="radio" name="degree" value=2 checked="checked"">
		<br>
			<br>
			<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
			<br>
			<br>
			ע:�޸���Ϣ�粻��дĬ��Ϊ���޸Ĵ��
	</center>
	</form>
</html>
