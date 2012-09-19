<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="DAO.DAO" />
<jsp:directive.page import="utility.*" />
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
			function validateForm(theForm) {
				if(theForm.userid.value == "")
				{
				alert("用户ID不能为空！");
				return false;
				}
				else{
				if(confirm("确定修改?")){
					return true;
				}
				else{
					return false;
				}			
				}
			}
		</SCRIPT>

	</head>
	<body>
		<table width="1000" border="0" cellpadding="0" cellspacing="0"
			align="center">

			<a name="head_beg"></a>
			<jsp:include page="../head.jsp" flush="true"></jsp:include>
			<a name="head_end"></a>

			<tr bgcolor="#FFFFFF">
				<td height="15">
					<table border="0" width=100% cellpadding="0" cellspacing="0"
						align="center">
						<tr height="100%">
							<td valign="top">
								<table border="0" width=192px cellpadding="0" cellspacing="0"
									align="center">
									<tr>
										<td width="100%" valign="top">
										
											<a name="left_beg"></a>
											<jsp:include page="../left.jsp" flush="true"></jsp:include>
											<a name="left_end"></a>



										</td>
									</tr>









								</table>
							<td width="100%" valign="top">











								<table border="0" width="100%" cellpadding="0" cellspacing="0"
									align="center">





									<tr>
										<td width="100%" valign="top">













											<a name="7_2_377"></a>
											<table border="0" height="100%" cellpadding="0"
												cellspacing="5">
												<tr>
													<td>
														<table border="0" width="100%" height="100%"
															cellpadding="0" cellspacing="0">
															<tr height="1">
																<td width="100%" height="12" nowrap>
																	<table border="0" width=100% cellpadding="0"
																		cellspacing="0" style="height: 23px;" height="23">
																		<tr>
																			<td class="wpsPortletBorderTitle" width="100%" nowrap
																				align="left" valign="middle">
																				<a href="#skipportlet7_2_15M"><img border="0"
																						src='/CDUG/image/dot.gif' alt='Skip portlet'
																						title='Skip portlet'>
																				</a>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<jsp:useBean class="Bean.User" id="user_session"
																				scope="session" />
															<tr height="100%">
																<td width="100%" valign="top" class="wpsPortletBorder"
																	style="padding: 5px;" dir="ltr">
																	<%
																		if (user_session.getUser_access() == 2) {
																	%>
																	<form method="post" action="/CDUG/servlet/Changeaccess"
																		name="AccessForm"
																		onsubmit="return validateForm(document.AccessForm)">
																		<table border="0" width="100%" height="100%"
																			cellpadding="0" cellspacing="5">
																			<tr>
																				<td>
																			<tr>
																				<td>
																					<table border="0" width="100%" height="100%"
																						cellpadding="0" cellspacing="0">
																						<tr>
																							<td class="wpsEditText" align="left">
																								<font size="2"><label for="userID">
																										请输入需要管理的会员ID:
																									</label>
																								</font>
																								<br>
																								<br>
																							</td>
																						</tr>
																						<tr>
																							<td class="wpsFieldText" align="left">
																								<input dir="ltr" type="text" size="25"
																									id="userid" name="userid" value='' />
																							</td>
																						</tr>
																						<tr>
																							<td class="wpsEditText" align="left">
																								<br>
																								<font size="2"><label for="userID">
																										请选择将此会员的权限变更为:
																									</label>
																								</font>
																								<br>
																								<br>
																							</td>
																						</tr>
																						<tr>
																							<td class="wpsPortletBorderTitle" width="100%"
																								nowrap align="left" valign="middle">
																								<input type="hidden" id="useraccess"
																									name="useraccess"
																									value="<%=user_session.getUser_access()%>">
																							</td>
																						</tr>
																						<tr>
																							<td width="100%" valign="top"
																								class="wpsPortletBorder" style="padding: 5px;"
																								dir="ltr">
																								<font size="2">普通权限<input type="radio"
																										name="access" value="0" checked="checked">
																								</font> &nbsp;&nbsp;&nbsp;&nbsp;
																								<font size="2">发布权限</font>
																								<input type="radio" name="access" value=1>
																								&nbsp;&nbsp;&nbsp;&nbsp;
																								<font size="2">管理权限</font>
																								<input type="radio" name="access" value=2>
																							</td>
																						</tr>

																						<tr>
																							<td align="center">
																								<br>
																								<br>
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type="submit"
																									name="login" value='确定' />
																								&nbsp;
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type="reset"
																									name="gotoindex" />
																								<br>
																								<br>
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																		</table>
																	</form>
																	<%
																		} else {
																	%>
																	<script type="text/javascript">
javascript:parent.location='/CDUG/index.jsp'
</script>
																	<%
																		}
																	%>

																</td>
															</tr>

														</table>
											</table>

											<a name="skipportlet7_2_377"></a>


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
											<%@include file="../right.jsp"%>
											<a name="right_end"></a>
								</table>


							</td>

						</tr>
					</table>
					<a name="foot_beg"></a>
					<%@include file="../foot.jsp"%>
					<a name="foot_end"></a>

		</table>
		<!-- Google Analytics code -->

	</body>
</html>
