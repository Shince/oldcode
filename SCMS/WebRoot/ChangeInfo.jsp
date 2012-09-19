<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<center>
		修改资料---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
		<table width=610 border=1>
			<tr height="20px"">
				<td align="center" width="80px">
					姓名
				</td>
				<td align="center" width="80px">
					联系地址
				</td>
				<td align="center" width="80px">
					电话号码
				</td>
				<td align="center" width="80px">
					入校年份
				</td>
			</tr>
			<tr height="20px"">
				<td align="center" width="80px">
				<jsp:getProperty name="user" property="NAME" />
				</td>
				<td align="center" width="80px">
				<jsp:getProperty name="user" property="ADDRESS" />
				</td>
				<td align="center" width="80px">
				<jsp:getProperty name="user" property="PHONE" />
				</td>
				<td align="center" width="80px">
				<jsp:getProperty name="user" property="GRADE" />
				</td>
			</tr>
		</table>
		<hr color=#F9A859>
		<form method="post" action="/SCMS/servlet/ChangeInfo" name="InfoForm"
			onsubmit="return validateForm(document.InfoForm)">
			请输入您的联系地址:
			<input type="text" name="address" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			请输入您的电话号码:
			<input type="text" name="phone" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br> 
			请输入您的进校年份:
			<select name="grade">
			<%
			int year;
			for(year=2007;year>=1907;--year)
			{
			%>
			<option value="<%=year %>"><%=year %></option>
			<%
			}
			%>
			</select> 
			&nbsp; &nbsp; &nbsp; &nbsp;<br>
			<br>
			<input type=submit value=确定 style="width:60px;height:25px;font-size:15px">
			<br>
			<br>
			注:修改信息如不填写默认为不修改此项。
		</form>
	</center>
</html>
