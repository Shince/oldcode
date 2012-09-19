<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="DAO.DAO" />
<jsp:directive.page import="java.util.Vector" />
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
		<script src="/CDUG/javascript/editor.js" type="text/javascript"></script>
		<SCRIPT language="JavaScript">
			function Submit(){
			if(document.newsForm.title.value == "" || document.newsForm.text.value == "")
			{
				alert("标题和内容不能为空！");
				return false;
			}
			else{
				if(confirm("确定发布？")){
				
				return true;
				}
				else{
				return false;
				}
			}
			}
			function Preview(){
			if(document.newsForm.title.value == "" || document.newsForm.text.value == "")
			{
				alert("标题和内容不能为空！");
				return false;
			}
			else{
			document.newsForm.action="/CDUG/jsp/backRelease/preview.jsp";
			document.newsForm.target="_blank";
			document.newsForm.submit();
			document.newsForm.action="/CDUG/servlet/News";
			document.newsForm.target="";
			}
			}
			function PicUpload(){
			if(document.picUploadForm.pic.value == "")
			{
				alert("请选择上传文件路径！");
				return false;
			}
			else{
				var fname = document.picUploadForm.pic.value.toUpperCase();
				var username = document.picUploadForm.username.value;
				var useraccess = document.picUploadForm.useraccess.value;
				document.picUploadForm.action='/CDUG/servlet/PicUpload?&fname='+fname+'&username='+username+'&useraccess='+useraccess;
				return true;
				}
			}
			function Example(){
				window.open('example.jsp','example','height=500,width=650,top=0,left=0,toolbar=no,menubar=no,resizable=no,location=no, status=no');
			}
			function Upload(){
				window.open('upload.jsp','upload','height=220,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
			}		 
		</SCRIPT>
	</head>
	<body onLoad="initEditor('text')">
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
																						title='Skip portlet'>
																				</a>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr height="100%">
																<td width="100%" valign="top" class="wpsPortletBorder"
																	style="padding: 5px;" dir="ltr">
																	<table width=100% cellpadding=0 cellspacing=0 border=0>
																		<tr>
																			<td valign="top">
																				<table width="100%" align="center">
																					<tr>
																						<td WIDTH="625">

																							<hr>
																						</td>
																					</tr>

																					<tr>
																						<td width="100%"
																							style="background-color: rgb(51, 51, 153);">
																							<span class="title"
																								style="color: rgb(255, 255, 255);">DB2新闻发布</span>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<hr>
																						</td>
																					</tr>
																					<jsp:useBean class="Bean.User" id="user_session"
																						scope="session" />
																					<%
																						if (!(user_session.getUser_access() == 1 || user_session
																								.getUser_access() == 2)) {
																					%>
																					<script type="text/javascript">
		javascript:parent.location='/CDUG/index.jsp'
		</script>
																					<%
																						} else {
																					%>
																					<tr>
																						<td class="wpsFieldText" align="left">
																							<p>
																								想上传附件？请点击
																								<a
																									style="text-decoration: underline; cursor: hand;"
																									onclick="return Upload();">这里</a>
																							</p>
																							<form name="newsForm" action="/CDUG/servlet/News"
																								method="POST" onsubmit="return Submit()">
																								请输入您要发布新闻的标题:
																								<br>
																								<br>
																								<input dir="ltr" type="text" size="60"
																									name="title" id="title" maxlength="65"/>
																								<br />
																								<br>
																								新闻内容: (发布代码示例点击
																								<a
																									style="text-decoration: underline; cursor: hand;"
																									onclick="return Example();">这里</a>)
																								<br>
																								<table width="29%" border="0">
																									<tr>
																										<td>
																											<img src="/CDUG/image/bb_bold.gif" width="21"
																												height="20" onClick="bold()">
																										</td>
																										<td>
																											<img src="/CDUG/image/bb_italic.gif"
																												width="21" height="20" onClick="italic()">
																										</td>
																										<td>
																											<img src="/CDUG/image/bb_underline.gif"
																												width="21" height="20" onClick="underline()">
																										</td>
																										<td>
																											<img src="/CDUG/image/bb_image.gif"
																												width="21" height="20" onClick="picture()">
																										</td>
																										<td>
																											<img src="/CDUG/image/bb_color.gif"
																												width="21" height="16" onClick="fontColor()">
																										</td>
																										<td>
																											<img src="/CDUG/image/bb_email.gif"
																												width="21" height="20" onClick="addEmail()">
																										</td>
																										<td>
																											<img src="/CDUG/image/bb_url.gif" width="21"
																												height="20" onClick="addURL()">
																										</td>
																										<td>
																											<img src="/CDUG/image/bb_center.gif"
																												width="21" height="20" onClick="center()">
																										</td>
																										<td>
																											<img src="/CDUG/image/bb_left.gif" width="21"
																												height="20" onClick="left()">
																										</td>
																										<td>
																											<img src="/CDUG/image/bb_right.gif"
																												width="21" height="20" onClick="right()">
																										</td>
																										<td colspan="2">
																											<select style="width: 50; height: 18"
																												onChange="fontname(this)"
																												name="selectFontName" size="1">
																												<option selected>
																													字体
																												</option>
																												<option value="宋体">
																													宋体
																												<option value="黑体">
																													黑体
																												<option value="楷体">
																													楷体
																												<option value="Arial">
																													Arial
																												<option value="Impact">
																													Impact
																												<option value="Times New Roman">
																													Times New Roman
																												<option value="Tahoma">
																													Tahoma
																											</select>
																										</td>
																										<td colspan="2">
																											<select style="width: 50; height: 18"
																												onChange="fontsize(this)"
																												name="selectFontSize" size="1">
																												<option selected>
																													字号
																												</option>
																												<option value="7">
																													一号
																												<option value="6">
																													二号
																												<option value="5">
																													三号
																												<option value="4">
																													四号
																												<option value="3">
																													五号
																												<option value="2">
																													六号
																												<option value="1">
																													七号
																												<option value=1>
																													1 pt
																												<option value=2>
																													2 pt
																												<option value=3>
																													3 pt
																												<option value=4>
																													4 pt
																												<option value=5>
																													5 pt
																												<option value=6>
																													6 pt
																												<option value=7>
																													7 pt
																												<option value=8>
																													8 pt
																												<option value=9>
																													9 pt
																												<option value=10>
																													10 pt
																												<option value=11>
																													11 pt
																												<option value=12>
																													12 pt
																												<option value=13>
																													13 pt
																												<option value=14>
																													14 pt
																												<option value=15>
																													15 pt
																												<option value=16>
																													16 pt
																												<option value=17>
																													17 pt
																												<option value=18>
																													18 pt
																												<option value=19>
																													19 pt
																												<option value=20>
																													20 pt
																												<option value=21>
																													21 pt
																												<option value=22>
																													22 pt
																												<option value=23>
																													23 pt
																												<option value=25>
																													25 pt
																												<option value=28>
																													28 pt
																												<option value=30>
																													30 pt
																												<option value=35>
																													35 pt
																												<option value=40>
																													40 pt
																												<option value=45>
																													45 pt
																												<option value=50>
																													50 pt
																												<option value=60>
																													60 pt
																												<option value=70>
																													70 pt
																												<option value=85>
																													85 pt
																												<option value=100>
																													100 pt
																												<option value=120>
																													120 pt
																												<option value=150>
																													150 pt
																												<option value=200>
																													200 pt
																												<option value=250>
																													250 pt
																												<option value=300>
																													300 pt
																												<option value=500>
																													500 pt
																												<option value=900>
																													900 pt
																												<option value=2000>
																													2000 pt
																											</select>
																										</td>
																									</tr>
																								</table>
																								<textarea name="text" id="text" rows="10"
																									cols="100" wrap="hard"></textarea>

																								<br>
																								<br>

																								<input type="hidden" id="username"
																									name="username"
																									value="<%=user_session.getUser_id()%>">
																								<input type="hidden" id="useraccess"
																									name="useraccess"
																									value="<%=user_session.getUser_access()%>">
																								<input type="hidden" id="tag"
																									name="tag"
																									value="news">
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type="submit"
																									id="release" name="release" value="发布" />
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type="button"
																									id="preview" name="preview" value="预览"
																									onclick="return Preview();" />
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type="reset" />
																							</form>
																						</td>
																					</tr>
																					<%
																						}
																					%>







																				</table>

																			</td>
																		</tr>
																	</table>





																</td>
															</tr>

														</table>
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