<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<jsp:directive.page import="java.util.Vector;"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<SCRIPT language="JavaScript">
			function validateForm(theForm) {
				if((theForm.name.value == "")||
				(theForm.id.value == "")||
				(theForm.mark.value == "")){				
					if(theForm.id.value == "") alert("请输入学号！");
					if(theForm.name.value == "") alert("请选择课程名！");
					if(theForm.mark.value == "") alert("请输入分数！");					
				return false;
				}
			return true;
			}  
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<jsp:useBean class="scms.model.Mark" id="mark" scope="session" />
	<center>
		成绩录入---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
		<form method="post" action="/SCMS/servlet/TeacherShowResult">
			请选择课程:
			<select name="name" onchange=submit();>
				<option value=""></option>
				<%
					Connection con = scms.dao.MyDAO.openDB();
					boolean check = false;
					int n=0;
					java.sql.ResultSet rs2 = scms.dao.MyDAO.select(con, "*",
							"Course_table","COURSE_TEACHER = '"+user.getNAME()+"'");
					while (rs2.next()) {
				%>
				<option value="<%=rs2.getString("COURSE_NAME")%>">
					<%=rs2.getString("COURSE_NAME")%>
				</option>
				<%
				}
				%>
			</select>
		</form>
		<hr color=#F9A859>
		<form method="post" action="/SCMS/servlet/NewResult">		
		<%
		Vector id_vec = new Vector();
		java.sql.ResultSet rs1 = scms.dao.MyDAO
		.select(con, "*", "Mark_table", "COURSE_NAME='"
		+ mark.getCOURSE_NAME() + "'");
		if(rs1.next()){
		%>
		您选择的课程是：<BASEFONT COLOR =#FF0000><%=mark.getCOURSE_NAME()%></BASEFONT>		
		<%
		}
		%>		
		<br>
		<br>
		<table width=610 border=1>
			<tr height="20px"">
				<td>
					学号
				</td>
				<td>
					姓名
				</td>
				<td>
					分数
				</td>
			</tr>
			<%	
				java.sql.ResultSet rs = scms.dao.MyDAO
				.select(con, "*", "Mark_table", "COURSE_NAME='"
				+ mark.getCOURSE_NAME() + "'");			
				while(rs.next()) {
				String student_id = rs.getString("STUDENT_ID");
				String student_name = rs.getString("STUDENT_NAME");
				String student_mark = rs.getString("COURSE_MARK");
				id_vec.addElement(student_id);
			%>
			<tr height="20px"">
				<td>
					<%=student_id%>
				</td>
				<td>
					<%=student_name%>
				</td>
				<td>
					<input type="text" name="course_mark_<%=n%>" value="<%=student_mark%>" style="width:30px;height:20px;font-size:20px">
					<input type="hidden" name="course_name" value=<%=mark.getCOURSE_NAME()%>>
					<input type="hidden" name="student_id_<%=n%>" value=<%=student_id%>>
				</td>
			</tr>
			<%
				check = true;
				++n;
				}
				scms.dao.MyDAO.closeDB(con);
			%>
		</table>
		<%session.removeAttribute("mark");%>
		<br>
		<%
		if(check){
		%>
		<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
		<%
		}
		%>
		</form>
	</center>
</html>
