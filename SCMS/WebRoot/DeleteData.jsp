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
				if(theForm.id1.value == "") alert("����дҪɾ�����ʻ���");
				if(theForm.id1.value != theForm.id2.value) alert("�����ʻ����벻һ�£�");
				return false
				}
			return true
			}  
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<center>
		ɾ���û�---ʹ���ߣ�
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
	<form method="post" action="/SCMS/servlet/DeleteData" name="DeleteDataForm"
		onsubmit="return validateForm(document.DeleteDataForm)">
			����ɾ����
			<br><br>
			������Ҫɾ�����ʻ�:
			<input type="text" name="id1" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			��������һ�δ��ʻ�:
			<input type="text" name="id2" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			<br>
			<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
			<br><br>
			<hr color=#F9A859>
			<br>
			</form>
			<form method="post" action="/SCMS/servlet/DeleteDataOther">
			ѡ��ɾ����
			<br><br>			
			��ѡ��Ҫɾ�����ʻ���
			<select name="id">
			<option value="null">��</option>
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
					�ʻ�
				</td>
				<td align="center" width="80px">
					����
				</td>
				<td align="center" width="80px">
					��ַ
				</td>
				<td align="center" width="80px">
					��У���
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
			<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
			</form>
	</center>
</html>
