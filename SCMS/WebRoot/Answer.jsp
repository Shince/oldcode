<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=GBK'>
	<SCRIPT language="JavaScript">
			function WhenClick(n) {
				AnswerForm.title.value=n;
				AnswerForm.action="/SCMS/servlet/Answer";
				AnswerForm.submit();
				}
			function WhenClick1(n) {
				AnswerForm.title.value=n;
				AnswerForm.action="/SCMS/servlet/DeleteQuestion";
				AnswerForm.submit();
				}
	</SCRIPT>	
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<br>
			管理问题---使用者：
			<jsp:getProperty name="user" property="NAME" />
			<hr color=#F9A859>
			<br>
			<form method="post" name="AnswerForm">
			<input type="hidden" name="title" value="">
			<table width=610 border=1 align="center" cellspacing="2px"
				cellpadding="2px">
				<tr height="20px"">
					<td nowrap>
						标题
					</td>
					<td>
						内容
					</td>
					<td>
						回答
					</td>
					<td colspan="2">
					问题管理
					</td>
				</tr>
				<%
					Connection con = scms.dao.MyDAO.openDB();
					java.sql.ResultSet rs = MyDAO.select(con, "*", "QA_table");
					try {
						while (rs.next()) {
							String title = rs.getString("TITLE");
							String text = rs.getString("TEXT");
							String context = rs.getString("CONTENT");
				%>
				<tr height="20px"">
					<td nowrap>
						<%=title%>
					</td>
					<td>
						<%=text%>
					</td>
					<td>
						<%=context%>
					</td>
					<td>
					<input type="button" name="answer" value="回答" style="width:60px;height:25px;font-size:15px" onclick="WhenClick('<%=title%>')">
					</td>
					<td>
					<input type="button" name="delete" value="删除" style="width:60px;height:25px;font-size:15px" onclick="WhenClick1('<%=title%>')">
					</td>
				</tr>
				<%
					}
					} catch (Exception e) {
						System.out.println(e);
					}
					scms.dao.MyDAO.closeDB(con);
				%>
			</table>
			<br>
			<hr color=#F9A859>
			<br>
			<textarea name=text rows=10 cols=80></textarea>
			</form>
		</center>
	</body>
</html>
