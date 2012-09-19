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
		课程查询---使用者：
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
					授课老师
				</td>
				<td align="center" width="80px">
					学分
				</td>
				<td align="center" width="80px">
					学位课
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
			请输入所查课程号:
			<input type="text" name="courseID" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			请输入所查课程名:
			<input type="text" name="courseName" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			请输入所查课时间:
			<select name="time1">
				<option value=""></option>
				<option value="星期一">星期一</option>
				<option value="星期二">星期二</option>
				<option value="星期三">星期三</option>
				<option value="星期四">星期四</option>
				<option value="星期五">星期五</option>
			</select>
			<select name="time2">
				<option value=""></option>
				<option value="上午">上午</option>
				<option value="下午">下午</option>
				<option value="晚上">晚上</option>
			</select>
			<br>
			请选择授课老师名:
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
			请输入该课程学分:
			<input type="text" name="courseMark" size="18"
				style="font-size: 12px; font-family: Verdana; border: 1px solid #81849D">
			<br>
			请选择是否学位课:
			<select name="isDegree">
			<option value=""></option>
			<option value="1">是</option>
			<option value="2">否</option>
			</select>
			<br>
			<br>
			<input type=submit name=submit value=确定 style="width:60px;height:25px;font-size:15px">
		</form>
	</center>
</html>
