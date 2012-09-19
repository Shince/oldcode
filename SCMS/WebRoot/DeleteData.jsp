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
	<center>
		删除用户---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/DeleteData" name="DeleteDataForm"
		onsubmit="return validateForm(document.DeleteDataForm)">
			输入删除：
			<br><br>
			请输入要删除的帐户:
			<input type="text" name="id1" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			请再输入一次此帐户:
			<input type="text" name="id2" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			<br>
			<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
			<br><br>
			<hr color=#F9A859>
			<br>
			</form>
			<form method="post" action="/SCMS/servlet/DeleteDataOther">
			选择删除：
			<br><br>			
			请选择要删除的帐户：
			<select name="id">
			<option value="null">无</option>
			<%
			Connection con=scms.dao.MyDAO.openDB();
			java.sql.ResultSet rs=scms.dao.MyDAO.select(con,"*","User_table ORDER BY ID ASC");
			while(rs.next()){
			%>
			<option value="<%=rs.getString("ID")%>"><%=rs.getString("ID")%></option>
			<%
			}
			%>
			</select>
			<%
			if(false){
			%>
			<br><br>
			<table width=610 border=1>
			<tr height="20px"">
				<td align="center" width="80px">
					帐户
				</td>
				<td align="center" width="80px">
					姓名
				</td>
				<td align="center" width="80px">
					地址
				</td>
				<td align="center" width="80px">
					入校年份
				</td>
			</tr>
			<tr height="20px"">
				<td align="center" width="80px">
					
				</td>
				<td align="center" width="80px">
					
				</td>
				<td align="center" width="80px">
					
				</td>
				<td align="center" width="80px">
					
				</td>
			</tr>
			</table>
			<%
			}
			%>
			<br><br>
			<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
			</form>
	</center>
</html>
