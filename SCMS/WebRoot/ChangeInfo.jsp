<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<center>
		�޸�����---ʹ���ߣ�
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
		<table width=610 border=1>
			<tr height="20px"">
				<td align="center" width="80px">
					����
				</td>
				<td align="center" width="80px">
					��ϵ��ַ
				</td>
				<td align="center" width="80px">
					�绰����
				</td>
				<td align="center" width="80px">
					��У���
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
			������������ϵ��ַ:
			<input type="text" name="address" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			���������ĵ绰����:
			<input type="text" name="phone" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br> 
			���������Ľ�У���:
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
			<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
			<br>
			<br>
			ע:�޸���Ϣ�粻��дĬ��Ϊ���޸Ĵ��
		</form>
	</center>
</html>
