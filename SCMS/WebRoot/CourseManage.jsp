<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
	<SCRIPT language="JavaScript">
			function WhenClick(n) {
				CourseManageForm.c_id.value=n;
				CourseManageForm.action="/SCMS/servlet/CourseManage";
				CourseManageForm.submit();
				}
	</SCRIPT>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
		<center>
		课程管理---使用者：
		<jsp:getProperty name="user" property="NAME" />
		<hr color=#F9A859>
		<form method="post" name="CourseManageForm">
		<input type="hidden" name="c_id" value="">
		<input type="hidden" name="s_id" value="<jsp:getProperty name="user" property="ID" />">
		<table width=610 border=1>
			<tr height="20px">
				<td align="center" width="80px">
					课程号
				</td>
				<td align="center" width="80px">
					课程名
				</td>
				<td align="center" width="80px">
					授课教师
				</td>
				<td align="center" width="80px">
					学分
				</td>
				<td align="center" width="80px">
					学位课
				</td>
				<td align="center" width="15px">				
				</td>
			</tr>
	    <%
	    String id=new String();
		String name=new String();
		String teacher=new String();
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
					point=rs.getString("COURSE_POINT");
					degree=rs.getInt("IS_DEGREE");
					if (degree==1){
						is_degree = "是";
						}
						else{
						is_degree = "否";
						}
		%>
		<tr height="20px">
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
				<td align="center" width="15px">
				<input type="button" name="delete" value="删除" style="width:60px;height:25px;font-size:15px" onclick="WhenClick('<%=id%>')">
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
		</form>
	</center>
</html>
