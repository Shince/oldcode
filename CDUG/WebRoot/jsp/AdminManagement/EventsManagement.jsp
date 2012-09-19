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
	</head>
	<jsp:useBean class="Bean.User" id="admin_session" scope="session" />
	<%
		if (admin_session.getUser_access() != 2) {
	%>
	<body onload="javascript:parent.location='/CDUG/index.jsp';">
		<br>
	</body>
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
																								style="color: rgb(255, 255, 255);">CDUG事件批量管理</span>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<hr>
																							<br>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<a name="middle_beg"></a>

																							<SCRIPT language="JavaScript">
  			function Delete(){

				if(confirm("确定删除这些事件？")){
				return true;
				}
				else{
				return false;
				}
			}
			
 
      function   check_all(){   
        arr   =   document.getElementsByName('chkId');   
        for(i=0;i<arr.length;i++){   
              arr[i].checked   =   true;   
        }   
      }   
      function uncheck_all(){   
        arr   =   document.getElementsByName('chkId');   
        for(i=0;i<arr.length;i++){   
              arr[i].checked   =   false;   
        }   
      }   

			
</SCRIPT>


																							<form action="/CDUG/servlet/DeleteNewsServlet"
																								name="editForm" method="POST"
																								onsubmit="return Delete()">
																								<%
																									if (admin_session.getUser_access() == 2) {

																											DAO dbctr = new DAO();
																											java.sql.ResultSet rs = dbctr
																													.getResultSet("select * from cdug_release_all where tag = 'events' order by id desc");
																											while (rs.next()) {
																												String title = rs.getString("title");
																												String date = rs.getString("date");
																												int id = rs.getInt("id");
																												//String username = rs.getString("user"C:/Documents and Settings/All Users/「开始」菜单/程序/Windows Live/Windows Live Messenger.lnk"name");
																								%>
																								<INPUT TYPE="checkbox" NAME="chkId"
																									value=<%=id%>>
																								<FONT class=fecha>发布时间:<%=date%></FONT> &nbsp;
																								<SPAN class=title1> <a
																									HREF="../CDUGEvent/news.jsp?id=<%=id%>"><%=title%></A>
																								</span> &nbsp;
																								<a HREF="../CDUGEvent/news.jsp?id=<%=id%>"
																									target="_blank"> [查看]</a>
																								<a
																									HREF="../backRelease/newsEdit.jsp?id=<%=id%>&tag=events"
																									target="_blank"> [编辑]</a>
																								<br>
																								<br>
																								<%
																									}
																								%>
																								<br>
																								<input type="hidden" name="useraccess"
																									id="useraccess"
																									value="<%=admin_session.getUser_access()%>">
																								<input type="hidden" name="tag" id="tag"
																									value="events">
																								<input type='button' class="wpsButtonText"
																									style="width: 95px;" value='全部选中'
																									onclick='check_all();'>
																								<input type='button' class="wpsButtonText"
																									style="width: 95px;" value='全部取消'
																									onclick='uncheck_all()'>
																								<input type="submit" class="wpsButtonText"
																									style="width: 95px;" name="delete" value="删除选中">
																							</form>
																							<%
																								dbctr.close();
																									}
																							%>


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
