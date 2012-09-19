<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="DAO.DAO" />
<jsp:directive.page import="java.math.*" />
<jsp:directive.page import="MD5.MD5" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<!--IBM WebSphere Portal-->

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
		<SCRIPT language="JavaScript">
      		 function SelectAll(form){
      		 	var objs = form.getElementsByTagName("input");
				  for(var i=0; i<objs.length; i++) {
				    if(objs[i].type.toLowerCase() == "checkbox" )
				      objs[i].checked = true;
				  }
      		 }
      		 function CancleSelect(form){
      		 	var objs = form.getElementsByTagName("input");
				  for(var i=0; i<objs.length; i++) {
				    if(objs[i].type.toLowerCase() == "checkbox" )
				      objs[i].checked = false;
				  }
      		 }
			function Fileinfo(){
				alert(document.deleteform.checkfile.value);
				return false;
			}
			function Delete(){

				if(confirm("确定删除这些附件？")){
				return true;
				}
				else{
				return false;
				}
			}     		 
		</SCRIPT>

	</head>
	<jsp:useBean class="Bean.User" id="admin_session" scope="session" />
	<%
		if (admin_session.getUser_access() != 2) {
	%>
	<body onload="javascript:parent.location='/CDUG/index.jsp';"><br></body>
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
																								style="color: rgb(255, 255, 255);">新闻附件管理</span>
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
																							<form name="deleteform"
																								action="/CDUG/servlet/DeleteUploadServlet"
																								method="post"
																								onSubmit="return Delete(document.deleteform)">
																								<%
																									DAO dbctr = new DAO();
																										int cpage;
																										int maxLine = 10;
																										int pageRowCount;
																										int pageCount;
																										java.sql.ResultSet rs1 = dbctr
																												.getResultSet("select * from cdug_upload_pic");
																										rs1.last();
																										pageRowCount = rs1.getRow();
																										pageCount = (int) Math.ceil(pageRowCount / maxLine) + 1;
																										String strPageNum = request.getParameter("page");//取得<href>提交的页码 
																										if (strPageNum == null) {
																											//表明在QueryString中没有page这一个参数，此时显示第一页数据 
																											cpage = 1;
																										} else {
																											cpage = java.lang.Integer.parseInt(strPageNum);//将字符串转换成整型 
																											if (cpage < 1)
																												cpage = 1;
																										}

																										if (cpage > pageCount)
																											cpage = pageCount;//调整待显示的页码 
																										java.sql.ResultSet rs = dbctr
																												.getResultSet("select * from cdug_upload_pic order by id desc limit "
																														+ (cpage - 1) * maxLine + "," + maxLine);
																										while (rs.next()) {
																											String filename = rs.getString("picname");
																											String date = rs.getString("date");
																											//String username = rs.getString("username");
																											int n = 1;
																											if (admin_session.getUser_access() == 2) {
																												++n;
																											}
																								%>
																								<input type="checkbox" name="checkfile"
																									id="<%=n - 1%>" value="<%=filename%>">
																									&nbsp;
																								<a
																									href="/CDUG/source/Release/<%=date%>/<%=filename%>"
																									target="_blank"><%=filename%></a>&nbsp;&nbsp;
																								<%=date%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/CDUG/jsp/AdminManagement/ReplaceUpload.jsp?filename=<%=filename%>&date=<%=date%>">替换附件</a>
																								<br>
																								<br>
																								<%
																									}
																										if (admin_session.getUser_access() == 2) {
																								%>
																								<br>
																								<input type="hidden" id="useraccess"
																									name="useraccess"
																									value="<%=admin_session.getUser_access()%>">
																								<input type="submit" class="wpsButtonText"
																									style="width: 95px;" name="delete" value="删除所选">
																								<input type="button" class="wpsButtonText"
																									style="width: 95px;" name="selectall"
																									id="selectall" value="全部选择"
																									onClick="SelectAll(this.form)">
																								<input type="button" class="wpsButtonText"
																									style="width: 95px;" name="reset" id="reset"
																									value="取消所选" onClick="CancleSelect(this.form)">
																								<%
																									}
																								%>
																								<br>
																								<br>
																								<%
																									if (cpage > 1) {
																								%>
																								<a href="UploadManagement.jsp?page=<%=cpage - 1%>">上一页</a>
																								<%
																									}
																								%>
																								<%
																									if (cpage < pageCount) {
																								%>
																								<a href="UploadManagement.jsp?page=<%=cpage + 1%>">下一页</a>
																								<%
																									}
																								%>

																								页次：<%=cpage%>/<%=pageCount%>页
																								<%=maxLine%>条/页&nbsp; 共<%=pageRowCount%>条记录
																							</form>

																							<%
																								dbctr.close();
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