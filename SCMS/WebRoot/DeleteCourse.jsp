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
				if(theForm.id1.value == "") alert("请填写要删除的帐户！");
				if(theForm.id1.value != theForm.id2.value) alert("两次帐户输入不一致！");
				return false
				}
			return true
			}  
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<%Connection con=scms.dao.MyDAO.openDB();%>
	<center>
		删除用户---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/DeleteCourse" name="DeleteCourseForm"
		onsubmit="return validateForm(document.DeleteCourseForm)">
输入课程号删除：<br><br>
			请输入要删除的课程号:
			<input type="text" name="id1" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			请再输入一次此课程号:
			<input type="text" name="id2" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			<br>
			<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
			<br>
			<br>
	</form>
	<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/DeleteCourseOther">
			选择课程名删除：
			<br><br>			
			请选择要删除的课程名：
			<select name="name">
			<option value="">无</option>
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
			<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
	</form>
	<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/DeleteCourseTeacher">
			选择授课老师删除：
			<br><br>			
			选择删除此教师教授的课程：
			<select name="teacher">
			<option value="">无</option>
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
			<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
	</form>
	</center>
</html>
