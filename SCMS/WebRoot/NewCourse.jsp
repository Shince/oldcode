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
				if(theForm.id.value == "") alert("请填写课程号！");
				if(theForm.name.value == "") alert("请填写课程名！");
				if(theForm.place.value == "") alert("请填写上课地点！");
				if(theForm.point.value == "") alert("请填写课程学分！");
				return false;
				}
			return true;
			}
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<%Connection con=scms.dao.MyDAO.openDB();%>
	<center>
		录入资料---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
		<form method="post" action="/SCMS/servlet/NewCourse"
			name="NewCourseForm"
			onsubmit="return validateForm(document.NewCourseForm)">
			&nbsp;&nbsp;请输入课程号:
			<input type="text" name="id" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			&nbsp;&nbsp;请输入课程名:
			<input type="text" name="name" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			请输入上课时间:
			<select name="time1">
				<option value="星期一">星期一</option>
				<option value="星期二">星期二</option>
				<option value="星期三">星期三</option>
				<option value="星期四">星期四</option>
				<option value="星期五">星期五</option>
			</select>
			<select name="time2">
				<option value="上午">上午</option>
				<option value="下午">下午</option>
				<option value="晚上">晚上</option>
			</select>
			<br>
			请输入上课地点:
			<input type="text" name="place" size="18"
			style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">			
			<br>
			请输入授课老师:
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
			请输入课程学分:
			<input type="text" name="point" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			是否为学位课:&nbsp; 是
			<input type="radio" name="degree" value=1>
			&nbsp; 否
			<input type="radio" name="degree" value=2 checked="checked">
			<br>
			<br>
			<input type=submit value=确定 style="width:60px;height:25px;font-size:15px" onclick="return validateForm(document.NewCourseForm)">
		</form>
	</center>
</html>
