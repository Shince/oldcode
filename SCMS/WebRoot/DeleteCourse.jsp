<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<SCRIPT language="JavaScript">
			function validateForm(theForm) {
				if((theForm.id1.value == "")||
				(theForm.id1.value != theForm.id2.value)){
				if(theForm.id1.value == "") alert("����дҪɾ�����ʻ���");
				if(theForm.id1.value != theForm.id2.value) alert("�����ʻ����벻һ�£�");
				return false
				}
			return true
			}  
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<%Connection con=scms.dao.MyDAO.openDB();%>
	<center>
		ɾ���û�---ʹ���ߣ�
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/DeleteCourse" name="DeleteCourseForm"
		onsubmit="return validateForm(document.DeleteCourseForm)">
����γ̺�ɾ����<br><br>
			������Ҫɾ���Ŀγ̺�:
			<input type="text" name="id1" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			��������һ�δ˿γ̺�:
			<input type="text" name="id2" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			<br>
			<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
			<br>
			<br>
	</form>
	<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/DeleteCourseOther">
			ѡ��γ���ɾ����
			<br><br>			
			��ѡ��Ҫɾ���Ŀγ�����
			<select name="name">
			<option value="">��</option>
			<%
			java.sql.ResultSet rs=scms.dao.MyDAO.select(con,"*","Course_table ORDER BY COURSE_NAME ASC");
			while(rs.next()){
			%>
			<option value="<%=rs.getString("COURSE_NAME")%>"><%=rs.getString("COURSE_NAME")%></option>
			<%
			}
			%>
			</select>
			<br><br>
			<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
	</form>
	<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/DeleteCourseTeacher">
			ѡ���ڿ���ʦɾ����
			<br><br>			
			ѡ��ɾ���˽�ʦ���ڵĿγ̣�
			<select name="teacher">
			<option value="">��</option>
			<%
			java.sql.ResultSet rs1=scms.dao.MyDAO.select(con,"*","User_table","CONDITION="+2+"ORDER BY NAME ASC");
			while(rs1.next()){
			%>
			<option value="<%=rs1.getString("NAME")%>"><%=rs1.getString("NAME")%></option>
			<%
			}
			%>
			</select>
			<br><br>
			<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
	</form>
	</center>
</html>
