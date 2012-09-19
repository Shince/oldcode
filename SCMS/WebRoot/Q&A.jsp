<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=GBK'>
	<SCRIPT language="JavaScript">
			function validateForm(theForm) {
				if((theForm.title.value == "")||
				(theForm.text.value == "")){
				alert("问题名和问题内容不能为空！");
				return false
				}
			return true
			}  
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"> 
	<center>
		查看问题---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
		<br>
		<table width=610 border=1 align="center" cellspacing="2px" cellpadding="2px">
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
			</tr>
			<%
			Connection con = scms.dao.MyDAO.openDB();
			java.sql.ResultSet rs = MyDAO.select(con, "*", "QA_table");
			try{
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
			</tr>
			<%
				}
				}catch(Exception e){
				System.out.println(e);
				}
			scms.dao.MyDAO.closeDB(con);
			%>
		</table>
		<br>
		<hr color=#F9A859>
		<br>
		<table border=1>
			<tr>
				<td>
					<form method="post" action="/SCMS/servlet/QAService" name="QAForm"
						onsubmit="return validateForm(document.QAForm)">
						<br>
						问题标题:
						<input type=text name=title size=40 maxlength=100 value="">
						<br>
						<br>
						<textarea name=text rows=10 cols=80></textarea>
						<br>
						<div align=center>
							<input type=submit value=发送 style="width:60px;height:25px;font-size:15px">
							<input type=reset value=清除 style="width:60px;height:25px;font-size:15px">
						</div>
						</form>
				</td>
			</tr>
		</table>
	</center>
	</body>
</html>
