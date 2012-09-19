<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
			function Submit(theForm) 
			{
				if((theForm.newfilename.value == "")&&
				(theForm.newfiledes.value == "")&&(theForm.newfiletag.value == ""))
				{
					alert("您什么都没有修改");
					return false;
				}
				else if(confirm("确定修改?"))
				{
					return true;
				}
				else
				{
					return false;
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
																								style="color: rgb(255, 255, 255);">资源信息修改</span>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<hr>
																							<br>
																						</td>
																					</tr>
																					<tr>
																						<td class="Text" align="left">
																							<a name="middle_beg"></a>

																							<form name="theForm"
																								action="/CDUG/servlet/updateFileInfo"
																								method="POST"
																								onSubmit="return Submit(document.theForm)">
																								您选择的文件是:&nbsp;&nbsp;
																								<%
																								//DesEncrypt des = new DesEncrypt();
																								//des.getKey("shince");
																								String f_name = request.getParameter("filename");
																								String flag = request.getParameter("flag");
																								%>
																								<input type="text" id="oldfilename" class="Text" size="80" style="border: 0;" readonly
																									name="oldfilename" value="<%=f_name%>">
																								<br>
																								<%
																								if(flag.equals("1")){
																								%>
																								请输入新文件名:&nbsp;&nbsp;
																								<input type="text" id="newfilename" class="wpsFieldText" size="45"
																									name="newfilename" value=""> <font color="#ff0000">注意</font>：此处修改为全名修改，请注意文件的扩展名。
																								<%
																								}
																								else{
																								%>
																								<input type="hidden" id="newfilename" class="wpsFieldText" size="45"
																									name="newfilename" value="">
																								<%
																								}
																								%>
																								请输入新的描述:&nbsp;&nbsp;
																								<input type="text" id="newfiledes" class="wpsFieldText" size="45"
																									name="newfiledes" value="">
																								<br>
																								请输入新的标签:&nbsp;&nbsp;
																								<input type="text" id="newfiletag" class="wpsFieldText" size="45"
																									name="newfiletag" value="">
																								<br><br>	
																								<input type="hidden" id="useraccess" class="wpsFieldText" size="45"
																									name="useraccess"
																									value="<%=admin_session.getUser_access()%>"> 
																								<font color="#ff0000">注意</font>：留空代表不做修改 
																								<br><br>
																								<input type=hidden name="tag" value="manage">
																								<input type="submit" id="submit" name="submit" class="wpsButtonText" style="cursor: hand; width: 95"
																									value="修改" />
																								<input type="reset" class="wpsButtonText" style="cursor: hand; width: 95"/>
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