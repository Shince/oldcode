<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
		<center>
		授课查询---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
		<table width=610 border=1>
			<tr height="20px"">
				<td align="center" width="80px">
					课程号
				</td>
				<td align="center" width="80px">
					课程名
				</td>
				<td align="center" width="80px">
					上课时间
				</td>
				<td align="center" width="80px">
					上课地点
				</td>
				<td align="center" width="80px">
					学分
				</td>
				<td align="center" width="80px">
					学位课
				</td>
				<td align="center" width="80px">
					选课人数
				</td>
			</tr>
	    <%
	    String id=new String();
		String name=new String();
		String time=new String();
		String place=new String();
		String point=new String();
		String degree=new String();
		
		Connection con=scms.dao.MyDAO.openDB();
		java.sql.ResultSet rs=scms.dao.MyDAO.select(con,"*","Course_table","COURSE_TEACHER="+"'"+user.getNAME()+"'");	
				try{
				while(rs.next()){
					int num = 0;
					id=rs.getString("COURSE_ID");
					name=rs.getString("COURSE_NAME");
					time=rs.getString("COURSE_TIME");
					place=rs.getString("COURSE_PLACE");
					point=rs.getString("COURSE_POINT");
					degree=rs.getString("IS_DEGREE");
					java.sql.ResultSet rs1 = scms.dao.MyDAO.select(con, "*","Mark_table","COURSE_ID = '"+id+"'");
					while(rs1.next()){//统计已选此课的人数；
								++num;
							}
					if (degree.equals("1")){
						degree = "是";
						}
						else{
						degree = "否";
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
				<%=time %>
				</td>
				<td align="center" width="80px">
				<%=place %>
				</td>
				<td align="center" width="80px">
				<%=point %>
				</td>
				<td align="center" width="80px">
				<%=degree %>
				</td>
				<td align="center" width="80px">
						<%=num%>
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
