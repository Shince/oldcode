<!-- code by chenxin-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="DAO.DAO" />
<jsp:directive.page import="utility.*" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<!--IBM WebSphere Portal-->

		<title>CDUG: China DB2 Users Group / 中国DB2用户组</title>

		<META http-equiv="Content-Type" content="text/html; charset=utf-8">
		<META name="GENERATOR" content="IBM WebSphere Studio">
		<META http-equiv="Content-Style-Type" content="text/css">

		<link href='/CDUG/css/Portal.png' rel="shortcut icon">
		<link href='/CDUG/css/LWP_Styles.css' rel="styleSheet" type="text/css">
		<link href='/CDUG/css/Styles.css' rel="styleSheet" type="text/css">
		<link href='/CDUG/css/HelpStyles.css' rel="styleSheet" type="text/css">
		<link href="/CDUG/css/idug_style_11.css" rel="styleSheet"
			type="text/css">
		<SCRIPT language="JavaScript">
		function PicUpload(){
			if(document.picUploadForm.pic.value == "")
			{
				alert("请选择上传文件路径！");
				return false;
			}
			else{
				var oriname=document.picUploadForm.oriname.value;
				var fname = document.picUploadForm.pic.value.toUpperCase();
				var username = document.picUploadForm.username.value;
				var useraccess = document.picUploadForm.useraccess.value;
				var old_date = document.picUploadForm.old_date.value;
				document.picUploadForm.action='/CDUG/servlet/ReplaceUploadServlet?fname='+fname+'&username='+username+'&useraccess='+useraccess+'&oriname='+oriname+'&old_date='+old_date;
				return true;
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
																								style="color: rgb(255, 255, 255);">新闻附件替换</span>
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

																							<jsp:useBean class="Bean.User" id="user_session"
																								scope="session" />
																							<%
																								if (!(user_session.getUser_access() == 1 || user_session
																											.getUser_access() == 2)) {
																							%>
																							<script type="text/javascript">
																							javascript:parent.location='/CDUG/index.jsp';
																							</script>
																							<%
																								} else {
																										String origin_filename = request.getParameter("filename");
																										String date = request.getParameter("date");
																							%>

																							<form name="picUploadForm"
																								action=""
																								method="POST" enctype="multipart/form-data"
																								onsubmit="return PicUpload()">
																								<label class=text>将被替换的文件为：<%=origin_filename%>
																								<br>
																								<br>
																								请选择替换成的文件:</label>
																								<br>
																								<br>
																								<input type="file" name="pic" id="pic">
																								<br>
																								<br><br>
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type=submit
																									name=picsubmit id=picsubmit value="替换" />
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type="reset" />
																								<input type="hidden" id="oriname" name="oriname"
																									value="<%=origin_filename%>">
																								<input type="hidden" id="old_date" name="old_date"
																									value="<%=date%>">
																								<input type="hidden" id="username"
																									name="username"
																									value="<%=user_session.getUser_id()%>">
																								<input type="hidden" id="useraccess"
																									name="useraccess"
																									value="<%=user_session.getUser_access()%>">
																								<br>
																							</form>



																							<a name="skipportlet7_2_15M"></a>
																							<%
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