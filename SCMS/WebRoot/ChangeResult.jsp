<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<jsp:directive.page import="java.util.Vector;"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<SCRIPT language="JavaScript">
			function validateForm1(theForm) {
				if((theForm.c_name1.value == "")||
					(theForm.s_id.value == "")||
					(theForm.s_rs1.value == "")){				
						if(theForm.c_name1.value == "") alert("请选择课程！");
						if(theForm.s_id.value == "") alert("请输入学号！");
						if(theForm.s_rs1.value == "") alert("请输入分数！");					
					return false;
					}
				return true;
				}
			
			function validateForm2(theForm) {
				if((theForm.c_name2.value == "")||
				(theForm.s_name.value == "")||
				(theForm.s_rs2.value == "")){				
					if(theForm.c_name2.value == "") alert("请选择课程！");
					if(theForm.s_name.value == "") alert("请输入姓名！");
					if(theForm.s_rs2.value == "") alert("请输入分数！");					
				return false;
				}
			return true;
			}
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<jsp:useBean class="scms.model.Mark" id="mark" scope="session" />
	<jsp:useBean class="scms.model.Reason" id="reason" scope="session" />
	<center>
		成绩修改---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
			<br>
			<form method="post" action="/SCMS/servlet/ChangeResultID" name="ChangeResultIDForm" onsubmit="return validateForm1(document.ChangeResultIDForm)">
			输入学号修改：
			<br><br>
			请选择课程: 
			<select name="c_name1">
				<option value=""></option>
				<%
					Connection con = scms.dao.MyDAO.openDB();
					java.sql.ResultSet rs2 = scms.dao.MyDAO.select(con, "*",
							"Course_table ORDER BY COURSE_NAME ASC");
					while (rs2.next()) {
				%>
				<option value="<%=rs2.getString("COURSE_NAME")%>">
					<%=rs2.getString("COURSE_NAME")%>
				</option>
				<%
				}
				%>
			</select> 
			&nbsp; &nbsp; &nbsp;<br>
			请输入学号：
			<input type="text" name="s_id">
			<br>
			请输入分数：
			<input type="text" name="s_rs1">
			<br><br>
			<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
			</form>
			<br><br>
			<hr color=#F9A859>
			<br>
			<form method="post" action="/SCMS/servlet/ChangeResultNAME" name="ChangeResultNAMEForm" onsubmit="return validateForm2(document.ChangeResultNAMEForm)">
			输入姓名修改：
			<br><br>
			请选择课程: 
			<select name="c_name2">
				<option value=""></option>
				<%
					java.sql.ResultSet rs1 = scms.dao.MyDAO.select(con, "*",
							"Course_table ORDER BY COURSE_NAME ASC");
					while (rs1.next()) {
				%>
				<option value="<%=rs1.getString("COURSE_NAME")%>">
					<%=rs1.getString("COURSE_NAME")%>
				</option>
				<%
				}
				%>
			</select> 
			&nbsp; &nbsp; &nbsp;<br>
			请输入姓名：
			<input type="text" name="s_name">
			<br>
			请输入分数：
			<input type="text" name="s_rs2">
			<br><br>
			<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
			</form>
	</center>
</html>
