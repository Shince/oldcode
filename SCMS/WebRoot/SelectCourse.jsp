<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<SCRIPT language="JavaScript">
			function validateForm(theForm) {
				if(theForm.id.value == ""){
				alert("����дҪ�γ̺ţ�");
				return false;
				}
			return true;
			}
	</SCRIPT>
	<body >
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<center>
		����ѡ��---ʹ���ߣ�
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
		<form method="post" action="/SCMS/servlet/SelectCourseID"
			name="SelectCourseForm"
			onsubmit="return validateForm(document.SelectCourseForm)">
			<input type="hidden" value="<jsp:getProperty name="user" property="ID" />" name="s_id">
			<input type="hidden" value="<jsp:getProperty name="user" property="NAME" />" name="s_name">
			����γ̺�ѡ�Σ�
			<br>
			<br>
			������γ̺�:
			<input type="text" name="id" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			<br>
			<input type=submit value=ȷ�� style="width:60px;height:25px;font-size:15px">
			<br>
			<br>
		</form>
		<hr color=#F9A859>
		<br>
		ѡ��γ�ѡ�Σ�
		<form method="post" action="/SCMS/servlet/SelectCourseOther">
			<input type="hidden" value="<jsp:getProperty name="user" property="ID" />" name="s_id">
			<input type="hidden" value="<jsp:getProperty name="user" property="NAME" />" name="s_name">
			<table width=610 border=1>
				<tr height="20px"">
					<td align="center" width="20px">
					
					</td>
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
					<td align="center" width="80px">
						��ѡ����
					</td>
				</tr>
				<%
					String id = new String();
					String name = new String();
					String time = new String();
					String place = new String();
					String point = new String();
					String teacher = new String();
					String degree = new String();
					Connection con = scms.dao.MyDAO.openDB();
					java.sql.ResultSet rs = scms.dao.MyDAO.select(con, "*",
							"Course_table ORDER BY COURSE_NAME ASC");
					try {
						while (rs.next()) {
							int num = 0;
							id = rs.getString("COURSE_ID");
							name = rs.getString("COURSE_NAME");
							time = rs.getString("COURSE_TIME");
							place = rs.getString("COURSE_PLACE");
							teacher = rs.getString("COURSE_TEACHER");
							point = rs.getString("COURSE_POINT");
							degree = rs.getString("IS_DEGREE");
							java.sql.ResultSet rs1 = scms.dao.MyDAO.select(con, "*","Mark_table","COURSE_ID = '"+id+"'");
							while(rs1.next()){//ͳ����ѡ�˿ε�������
								++num;
							}
							if (degree.equals("1")) {
						degree = "��";
							} else {
						degree = "��";
							}
				%>
				<tr height="20px"">
					<td align="center" width="20px">
					<input type="checkbox" name="id" value="<%=id%>">				
					</td>
					<td align="center" width="80px">
						<%=id%>
					</td>
					<td align="center" width="80px">
						<%=name%>
					</td>
					<td align="center" width="80px">
						<%=time%>
					</td>
					<td align="center" width="80px">
						<%=place%>
					</td>
					<td align="center" width="80px">
						<%=teacher%>
					</td>
					<td align="center" width="80px">
						<%=point%>
					</td>
					<td align="center" width="80px">
						<%=degree%>
					</td>
					<td align="center" width="80px">
						<%=num%>
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
			<br>
			<input type="submit" value=ȷ�� style="width:60px;height:25px;font-size:15px">
		</form>
		<form name="CannelForm">
			<input type="submit" value=ȡ�� style="width:60px;height:25px;font-size:15px">
		</form>
	</center>
	</body>
</html>
