<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
		<center>
		�ڿβ�ѯ---ʹ���ߣ�
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
					�ڿν�ʦ
				</td>
				<td align="center" width="80px">
					ѧ��
				</td>
				<td align="center" width="80px">
					ѧλ��
				</td>
				<td align="center" width="80px">
					����
				</td>
			</tr>
	    <%
	    String id=new String();
		String name=new String();
		String teacher=new String();
		String mark=new String();
		String point=new String();
		int degree;
		String is_degree = new String();
		
		Connection con=scms.dao.MyDAO.openDB();
		java.sql.ResultSet rs=scms.dao.MyDAO.select(con,"*","Mark_table","STUDENT_ID="+"'"+user.getID()+"'");	
				try{
				while(rs.next()){
					id=rs.getString("COURSE_ID");
					name=rs.getString("COURSE_NAME");
					teacher=rs.getString("COURSE_TEACHER");
					mark=rs.getString("COURSE_MARK");
					point=rs.getString("COURSE_POINT");
					degree=rs.getInt("IS_DEGREE");
					mark=rs.getString("COURSE_MARK");
					if (degree==1){
						is_degree = "��";
						}
						else{
						is_degree = "��";
						}
		%>
		<tr height="20px"">
				<td align="center" width="80px">
				<%=id %>
				</td>
				<td align="center" width="80px">
				<%=name %>
				</td>
				<td align="center" width="80px">
				<%=teacher %>
				</td>
				<td align="center" width="80px">
				<%=point %>
				</td>
				<td align="center" width="80px">
				<%=is_degree %>
				</td>
				<td align="center" width="80px">
				<%=mark %>
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
	</center>
</html>
