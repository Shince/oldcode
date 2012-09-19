<%@ page contentType="text/html;charset=GBK"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="scms.dao.MyDAO" />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>Student Page</title>
	</head>
	<style>
.chart_list{
	border-collapse:collapse;
	border-bottom-style:solid;
	border-bottom-width:1px;
	border-bottom-color:#666666;
	border-left-style:solid;
	border-left-width:1px;
	border-left-color:#666666;
	background-color:#FFFFFF;
}
.chart_list td{
	border-top-style:solid;
	border-top-width:1px;
	border-top-color:#666666;
	border-right-style:solid;
	border-right-width:1px;
	border-right-color:#666666;
}
.aa{
	background-color:#FFFF33;
}
.bb{
	background-color:#FFFFFF;
}
</style>
<script>
function gotoPage(option){
	switch(option){
		case 1:
			eval("parent.mainFrame.location='NewCourse.jsp'");
			break;
		case 2:
			eval("parent.mainFrame.location='ChangeCourse.jsp'");
			break;
		case 3:
			eval("parent.mainFrame.location='DeleteCourse.jsp'");
			break;
		case 4:
			eval("parent.mainFrame.location='ChangeResult.jsp'");
			break;
		case 5:
			eval("parent.mainFrame.location='NewData.jsp'");
			break;
		case 6:
			eval("parent.mainFrame.location='ChangeData.jsp'");
			break;
		case 7:
			eval("parent.mainFrame.location='DeleteData.jsp'");
			break;
		case 8:
			eval("parent.mainFrame.location='ChangeInfo.jsp'");
			break;
		case 9:
			eval("parent.mainFrame.location='ChangeResult.jsp'");
			break;
		default:break;
	}
}
function gotoHome(){
top.location = "index.html";
//gotoHome没用到
}
</script>
	<jsp:useBean class="scms.model.User" id="user" scope="session" />
	<body topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#FBEAD9">
		<TABLE id="left" cellSpacing=0 cellPadding=0 width="190" border=0
			align="left">
			<TR>
				<TD valign=top>
					<TABLE height=5 cellSpacing=0 cellPadding=0 width="100%"
						align=center border=0>
						<TR>
							<TD width=9>
								<IMG height=32 src="image/pl_t_3.gif" width=9>
							</TD>
							<TD background="image/pl_t_5.gif" valign="middle" align="center">
								<font size="3"><strong>欢迎您:</strong> 
	<jsp:getProperty name="user" property="NAME" /> <strong>&nbsp;</strong>
								</font>
							</TD>
							<TD width=9>
								<IMG height=32 src="image/pl_t_6.gif" width=9>
							</TD>
						</TR>
					</TABLE>
					<TABLE
						style="BORDER-RIGHT: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid"
						cellSpacing=0 cellPadding=3 width="100%" border=0
						bgcolor="#ffffff">
						<TR>
							<TD valign="top">
								<table width="180" border="0" cellpadding="0" cellspacing="0"
									bgcolor="#F9A859" align="center" height="278">
									<tr>
										<TD height="32" colspan="2" background="image/pl_t_5.gif"
											valign="middle" align="center"> 
											课程相关<br>
										</TD>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(1)">
										<td height="35" colspan="2" align="center" id="m21"
											bgcolor="#FBEAD0" style="font-size:14px"> 
											录入课程<br>
										</td>
									</tr>
									<tr>
										<td height="3" colspan="2"></td>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(2)">
										<td height="35" colspan="2" align="center" id="m21"
											bgcolor="#FBEAD0" style="font-size:14px"> 
											修改课程<br>
										</td>
									</tr>
									<tr>
										<td height="3" colspan="2"></td>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(3)">
										<td height="35" colspan="2" align="center" id="m21"
											bgcolor="#FBEAD0" style="font-size:14px"> 
											删除课程<br>
										</td>
									</tr>
									<tr>
										<TD height="32" colspan="2" background="image/pl_t_5.gif"
											valign="middle" align="center"> 
											成绩相关<br>
										</TD>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(4)">
										<td height="35" colspan="2" align="center" id="m11"
											bgcolor="#FBEAD0" style="font-size:14px">  
											成绩修改<br>
										</td>
									</tr>
									
									
									<tr>
										<TD height="32" colspan="2" background="image/pl_t_5.gif"
											valign="middle" align="center"> 
											用户相关<br>
										</TD>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(5)">
										<td height="35" colspan="2" align="center" id="m21"
											bgcolor="#FBEAD0" style="font-size:14px">
											录入用户<br>
										</td>
									</tr>
									<tr>
										<td height="3" colspan="2"></td>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(6)">
										<td height="35" colspan="2" align="center" id="m21"
											bgcolor="#FBEAD0" style="font-size:14px"> 
											修改用户<br>
										</td>
									</tr>
									<tr>
										<td height="3" colspan="2"></td>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(7)">
										<td height="35" colspan="2" align="center" id="m21"
											bgcolor="#FBEAD0" style="font-size:14px"> 
											删除用户<br>
										</td>
									</tr>
									<tr>
										<TD height="32" colspan="2" background="image/pl_t_5.gif"
											valign="middle" align="center"> 
											管理员管理<br>
										</TD>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(8)">
										<td height="35" colspan="2" align="center" id="m21"
											bgcolor="#FBEAD0" style="font-size:14px"> 
											修改资料<br>
										</td>
									</tr>
									
									
									
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'">
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoHome()">
										<td height="35" colspan="2" align="center" id="m21"
											background="image/pl_t_5.gif" style="font-size:14px">
											<a href="http://localhost:8080/SCMS/index.html"
												onclick="javascript:top.location.replace(this.href); event.returnvalue=false; ">
												【登出】</a><br>
										</td>
									</tr>
								</table>
							</TD>
						</tr>
					</TABLE>
					<TABLE height=5 cellSpacing=0 cellPadding=0 width="100%"
						align=center background="image/0830_cor_bot.gif" border=0>
						<TR>
							<TD width=5>
								<IMG height=5 src="image/0830_cor_3.gif" width=5>
							</TD>
							<TD width="100%"></TD>
							<TD width=5>
								<IMG height=5 src="image/0830_cor_4.gif" width=5>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
	</body>
</html>
