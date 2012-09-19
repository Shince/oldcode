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
			eval("parent.mainFrame.location='SelectCourse.jsp'");
			break;
		case 2:
			eval("parent.mainFrame.location='CourseManage.jsp'");
			break;
		case 3:
			eval("parent.mainFrame.location='CourseQuery.jsp'");
			break;
		case 4:
			eval("parent.mainFrame.location='MyCourse.jsp'");
			break;
		case 5:
			eval("parent.mainFrame.location='ResultQuery.jsp'");
			break;
		case 6:
			eval("parent.mainFrame.location='ChangePSW.jsp'");
			break;
		case 7:
			eval("parent.mainFrame.location='ChangeInfo.jsp'");
			break;
		case 8:
			eval("parent.mainFrame.location='Q&A.jsp'");
		default:break;
	}
}
function gotoHome(){
top.location = "index.html";
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
											选课相关
											<br>
										</TD>
									</tr>


									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(1)">
										<td colspan="1" height="35" align="center" id="n7"
											bgcolor="#FBEAD0" style="font-size:14px">
											网上选课
										</td>
									</tr>
									<tr>
										<td height="3" colspan="2"></td>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(2)">
										<td colspan="2" height="35" align="center" id="n9"
											bgcolor="#FBEAD0" style="font-size:14px">
											管理课程
											<br>
										</td>
									</tr>
									<tr>
										<TD height="32" colspan="2" background="image/pl_t_5.gif"
											valign="middle" align="center">
											课程相关
											<br>
										</TD>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(3)">
										<td height="35" colspan="2" align="center" id="m11"
											bgcolor="#FBEAD0" style="font-size:14px">
											课程查询
											<br>
										</td>
									</tr>
									<tr>
										<td height="3" colspan="2"></td>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(4)">
										<td height="35" colspan="2" align="center" id="m31"
											bgcolor="#FBEAD0" style="font-size:14px">
											我的课表
											<br>
										</td>
									</tr>
									<tr>
										<TD height="32" colspan="2" background="image/pl_t_5.gif"
											valign="middle" align="center">
											成绩相关
											<br>
										</TD>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(5)">
										<td height="35" colspan="2" align="center" id="m21"
											bgcolor="#FBEAD0" style="font-size:14px">
											成绩查询
										</td>
									</tr>
									<tr>
										<TD height="32" colspan="2" background="image/pl_t_5.gif"
											valign="middle" align="center">
											个人资料管理
											<br>
										</TD>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(6)">
										<td height="35" colspan="2" align="center" id="m21"
											bgcolor="#FBEAD0" style="font-size:14px">
											修改密码
											<br>
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
											修改资料
											<br>
										</td>
									</tr>
									<tr>
										<TD height="32" colspan="2" background="image/pl_t_5.gif"
											valign="middle" align="center">
											Q&amp;A
											<br>
										</TD>
									</tr>
									<tr
										onMouseOver="this.style.cursor='hand',this.style.color='red'"
										onMouseOut="this.style.color='#000000'" onClick="gotoPage(8)">
										<td height="35" colspan="2" align="center" id="m21"
											bgcolor="#FBEAD0" style="font-size:14px">
											查看问题
											<br>
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
												【登出】</a>
											<br>
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
