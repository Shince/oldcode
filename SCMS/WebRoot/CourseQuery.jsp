<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<jsp:directive.page import="java.util.Vector;"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<jsp:useBean class="scms.model.CourseVec" id="coursevec" scope="session" />
	<%Connection con=scms.dao.MyDAO.openDB();%>
	<center>
		�γ̲�ѯ---ʹ���ߣ�
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
		<table width=610 border=1>
			<tr height="20px"">
				<td align="center" width="80px">
					�γ̺�
				</td>
				<td align="center" width="80px">
					�γ���
				</td>
				<td align="center" width="80px">
					�Ͽ�ʱ��
				</td>
				<td align="center" width="80px">
					�Ͽεص�
				</td>
				<td align="center" width="80px">
					�ڿ���ʦ
				</td>
				<td align="center" width="80px">
					ѧ��
				</td>
				<td align="center" width="80px">
					ѧλ��
				</td>
			</tr>
			<%
			int time=coursevec.getVEC().size()/7;
			int life=0;
			while(time!=0){
			%>						
			<tr height="20px"">
				<td align="center" width="80px">
				<%=coursevec.getVEC().get(life+0) %>
				</td>
				<td align="center" width="80px">
				<%=coursevec.getVEC().get(life+1) %>
				</td>
				<td align="center" width="80px">
				<%=coursevec.getVEC().get(life+2) %>
				</td>
				<td align="center" width="80px">
				<%=coursevec.getVEC().get(life+3) %>
				</td>
				<td align="center" width="80px">
				<%=coursevec.getVEC().get(life+4) %>
				</td>
				<td align="center" width="80px">
				<%=coursevec.getVEC().get(life+5) %>
				</td>
				<td align="center" width="80px">
				<%=coursevec.getVEC().get(life+6) %>
				</td>
			</tr>
			<%
			--time;
			life+=7;
			}
			%>
		</table>
		<hr color=#F9A859>
			<%
			session.removeAttribute("coursevec");
			%>
		<form method="post" action="/SCMS/servlet/CourseQuery">
			����������γ̺�:
			<input type="text" name="courseID" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			����������γ���:
			<input type="text" name="courseName" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			�����������ʱ��:
			<select name="time1">
				<option value=""></option>
				<option value="����һ">����һ</option>
				<option value="���ڶ�">���ڶ�</option>
				<option value="������">������</option>
				<option value="������">������</option>
				<option value="������">������</option>
			</select>
			<select name="time2">
				<option value=""></option>
				<option value="����">����</option>
				<option value="����">����</option>
				<option value="����">����</option>
			</select>
			<br>
			��ѡ���ڿ���ʦ��:
			<select name="teacher">
				<option value="">
					
				</option>
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
			</select>&nbsp; &nbsp; &nbsp; &nbsp;  			 
			<br>
			������ÿγ�ѧ��:
			<input type="text" name="courseMark" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			��ѡ���Ƿ�ѧλ��:
			<select name="isDegree">
			<option value=""></option>
			<option value="1">��</option>
			<option value="2">��</option>
			</select>
			<br>
			<br>
			<input type=submit name=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
		</form>
	</center>
</html>
