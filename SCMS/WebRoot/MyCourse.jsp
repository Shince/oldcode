<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<jsp:directive.page import="java.util.Vector;" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
	</head>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<center>
		课表查询---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
	</center>
	<body>
		<%
			Vector name = new Vector();
			Vector time = new Vector();
			Vector place = new Vector();
			Connection con = scms.dao.MyDAO.openDB();
			java.sql.ResultSet rs = scms.dao.MyDAO.select(con, "*",
					"Mark_table", "STUDENT_ID=" + "'" + user.getID() + "'");
			while (rs.next()) {
				name.addElement(rs.getString("COURSE_NAME"));
				time.addElement(rs.getString("COURSE_TIME"));
				place.addElement(rs.getString("COURSE_PLACE"));
			}
		%>
		<center>
			<br>
			<br>
			<table width="600" border=1 height="211">
				<tr height="20px"">
					<td align="center" width="80px">

					</td>
					<td align="center" width="80px">
						星期一
					</td>
					<td align="center" width="80px">
						星期二
					</td>
					<td align="center" width="80px">
						星期三
					</td>
					<td align="center" width="80px">
						星期四
					</td>
					<td align="center" width="80px">
						星期五
					</td>


				</tr>
				<tr>
					<td valign="middle">
						上午
					</td>
					<td valign="middle">

						<%
						int flag=-1;
								for (int n = 0; n != name.size(); ++n) {
								
								if (time.get(n).equals("星期一上午")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>
						&nbsp;
						<br>
						<br>
						&nbsp;
						<%}
							flag = -1;
						%>
					</td>
					<td valign="middle">

						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期二上午")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
						if (flag == -1) {
						%>
						&nbsp;
						<br>
						<br>
						&nbsp;
						<%}
							flag = -1;
						%>
					</td>
					<td valign="middle">

						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期三上午")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>
						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
					<td valign="middle">

						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期四上午")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>
						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
					<td valign="middle">

						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期五上午")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>
						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
				</tr>
				<tr>
					<td valign="middle">
						下午
					</td>
					<td valign="middle">
						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期一下午")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>
						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
					<td valign="middle">
						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期二下午")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>
						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
					<td valign="middle">
						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期三下午")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>

						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
					<td valign="middle">
						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期四下午")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>

						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
					<td valign="middle">
						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期五下午")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>

						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>


				</tr>
				<tr>
					<td valign="middle">
						晚上
					</td>
					<td valign="middle">
						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期一晚上")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>

						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
					<td valign="middle">
						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期二晚上")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>

						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
					<td valign="middle">
						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期三晚上")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>

						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
					<td valign="middle">
						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期四晚上")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>

						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>
					<td valign="middle">
						<%
								for (int n = 0; n != name.size(); ++n) {
								if (time.get(n).equals("星期五晚上")) {
								flag=1;
						%>
						<%=name.get(n)%>
						<br>
						<br>
						<%=place.get(n)%>
						<%
							}
							}
							if (flag == -1) {
						%>

						&nbsp;
						<br>
						<br>
						&nbsp;
						<%
							}
							flag = -1;
						%>
					</td>


				</tr>
			</table>
		</center>
		<%
		scms.dao.MyDAO.closeDB(con);
		%>
	</body>
</html>
