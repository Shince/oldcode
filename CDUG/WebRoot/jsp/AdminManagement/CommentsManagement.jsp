<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="DAO.DAO" />
<jsp:directive.page import="java.math.*" />
<jsp:directive.page import="MD5.MD5" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>CDUG: China DB2 Users Group / 中国DB2用户组</title>

		<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<META name="GENERATOR" content="IBM WebSphere Studio">
		<META http-equiv="Content-Style-Type" content="text/css">

		<link href='/CDUG/css/Portal.png' rel="shortcut icon">
		<link href='/CDUG/css/LWP_Styles.css' rel="styleSheet" type="text/css">
		<link href='/CDUG/css/Styles.css' rel="styleSheet" type="text/css">
		<link href='/CDUG/css/HelpStyles.css' rel="styleSheet" type="text/css">
		<link href="/CDUG/css/idug_style_11.css" rel="styleSheet"
			type="text/css">
		<SCRIPT language=JavaScript src="/CDUG/javascript/photo.js"></SCRIPT>
		<SCRIPT language="JavaScript">
  			function Delete(){

				if(confirm("确定删除这些评论？")){
				return true;
				}
				else{
				return false;
				}
			}
			
 
      		function SelectAll(){
      		 	var objs = document.getElementsByTagName("input");
				  for(var i=0; i<objs.length; i++) {
				    if(objs[i].type.toLowerCase() == "checkbox" )
				      objs[i].checked = true;
				  }
      		 }
      		function CancleSelect(){
      		 	var objs = document.getElementsByTagName("input");
				  for(var i=0; i<objs.length; i++) {
				    if(objs[i].type.toLowerCase() == "checkbox" )
				      objs[i].checked = false;
				  }
      		 }

			
</SCRIPT>
	</head>
	<jsp:useBean class="Bean.User" id="admin_session" scope="session" />
	<%
		if (admin_session.getUser_access() != 2) {
	%>
	<body onload="javascript:parent.location='/CDUG/index.jsp';"></body>
	<%
		} else {
	%>
	<body>
		<table width="1000" border="0" cellpadding="0" cellspacing="0"
			align="center">

			<a name="head_beg"></a>
			<jsp:include page="../managehead.jsp" flush="true"></jsp:include>
			<a name="head_end"></a>

			<tr bgcolor="#FFFFFF">
				<td height="15">
					<table border="0" width="100%" cellpadding="0" cellspacing="0"
						align="center">
						<tr height="100%">
							<td valign="top">
								<table border="0" width="192px" cellpadding="0" cellspacing="0"
									align="center">
									<tr>
										<td width="100%" valign="top">
											<a name="left_beg"></a>
											<jsp:include page="../manageleft.jsp" flush="true"></jsp:include>
											<a name="left_end"></a>
										</td>
									</tr>
								</table>
							</td>
							<td width="100%" valign="top">
								<table border="0" width="100%" cellpadding="0" cellspacing="0"
									align="center">
									<tr>
										<td width="100%" valign="top">
											<a name="7_2_15M"></a>




											<table border="0" width="100%" height="100%" align="center"
												cellpadding="0" cellspacing="5">
												<tr>
													<td>
														<table width="100%" height="100%" cellpadding="0"
															cellspacing="0" align="center">
															<tr height="1">
																<td width="100%" height="12" nowrap align="center">

																	<table border="0" width="100%" cellpadding="3"
																		cellspacing="0" align="center">
																		<tr>
																			<td class="wpsPortletBorderTitle" width="100%" nowrap
																				align="center" valign="middle">
																				<a href="#skipportlet7_2_15M"><img border="0"
																						src='/CDUG/image/dot.gif' alt='Skip portlet'
																						title='Skip portlet'> </a>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr height="100%">
																<td width="100%" valign="top" class="wpsPortletBorder"
																	style="padding: 5px;" dir="ltr">
																	<table width="100%" cellpadding="0" cellspacing="0"
																		border="0">
																		<tr>
																			<td valign="top">
																				<table>
																					<tr>
																						<td WIDTH="625">
																							<hr>
																						</td>
																					</tr>

																					<tr>
																						<td width="100%"
																							style="background-color: rgb(51, 51, 153);">
																							<span class="title"
																								style="color: rgb(255, 255, 255);">用户评论管理</span>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<hr><br>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<a name="middle_beg"></a>

																							<form name="SQLForm" method="post"
																								action="">
																								<p class=text>
																									请输入需要管理的用户名：
																								</p>
																								<p>
																									<input name="CommentsQuery" dir="ltr"
																										type="text" size="25" value="">
																								</p>
																								<p>
																									<input class="wpsButtonText" style="cursor: hand; width: 95" type="submit"
																										name="View" value="查看此人所有评论">
																									<input class="wpsButtonText" style="cursor: hand; width: 95" type="button" onclick="javascrip:document.SQLForm.CommentsQuery.value='%';document.SQLForm.submit();"
																										name="View_all" value="查看所有评论">
																								</p>
																							</form>
																							<br>
																							<form
																								action="/CDUG/servlet/DeleteCommentsServlet"
																								name="editForm" method="POST"
																								onsubmit="return Delete()">
																								<table border=1>
																								<%
																								int n=1;
																								int flag = 0;
																								String username = new String();
																								username = request.getParameter("CommentsQuery");
																								if(username!=null){
																								%>
																								<tr>
																								<td>
																								&nbsp;
																								</td>
																								<td>
																								用户名
																								</td>
																								<td>
																								新闻标题
																								</td>
																								<td>
																								评论内容
																								</td>
																								</tr>
																							<%}
																								
																								DAO dbctrl = new DAO();
																								java.sql.ResultSet rs = dbctrl.getResultSet("select * from cdug_release_comments where username ='" +username+"' order by newsid");
																								while(rs.next()){
																							%>
																								<tr>
																								<td>
																								<input type="checkbox" name="check" id="<%=n%>" value="<%=rs.getString("id")%>">
																								<%
																									++n;
																									flag = 1;
																								%>
																								</td>
																								<td>
																								<%=rs.getString("username")%>
																								</td>
																								<td>
																								<%
																								int nid = rs.getInt("newsid");
																								java.sql.ResultSet rs1 = dbctrl.getResultSet("select * from cdug_release_all where id =" +nid);
																								if(rs1.next()){
																								%>
																								<%=rs1.getString("title")%>
																								<%
																								}
																								%>
																								</td>
																								<td>
																								<%=rs.getString("text")%>
																								</td>
																								</tr>
																								<%
																								}
																								%>
																								</table>
																								<%
																								if(flag!=0){
																								%>
																								<br><br>
																								<input type="hidden" name="useraccess"
																									id="useraccess"
																									value="<%=admin_session.getUser_access()%>">
																								<input type="hidden" name="tag" id="tag"
																									value="events">
																								<input type="submit" class="wpsButtonText" style="cursor: hand; width: 95"
																								 name="delete" value="删除选中">
																								<input type="button" class="wpsButtonText"
																												style="width: 95px;" name="selectall"
																												id="selectall" value="全部选择"
																												onClick="return SelectAll()">
																								<input type="button" class="wpsButtonText"
																												style="width: 95px;" name="reset" id="reset"
																												value="取消所选"
																												onClick="return 	CancleSelect()">
																								<%
																								}
																								%>
																							</form>
																							
																							<a name="middle_end"></a>
																						</td>
																					</tr>
																				</table>

																			</td>
																		</tr>
																	</table>
																</td>
															</tr>

														</table>
													</td>
												</tr>
											</table>
											<a name="skipportlet7_2_15M"></a>
										</td>
									</tr>

								</table>


							</td>
							<td valign="top">
								<table border="0" width="100%" cellpadding="0" cellspacing="0"
									align="center">
									<tr>
										<td width="100%" valign="top">

											<a name="right_beg"></a>
											<%@include file="/../jsp/right.jsp"%>
											<a name="right_end"></a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>

					<a name="foot_beg"></a>
					<%@include file="/../jsp/foot.jsp"%>
					<a name="foot_end"></a>
		</table>
	</body>
	<%
		}
	%>
</html>
