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
		<style>
		body {height:400px; width:650px;}
		</style>
	</head>
	<body>
		<jsp:useBean class="Bean.User" id="user_session" scope="session" />
		<%
			if (!SessionListener.isOnline(session)) {
				session.invalidate();
			}
		%>
		<%
			if (!(user_session.getUser_access() == 1 || user_session
					.getUser_access() == 2)) {
		%>
		<script type="text/javascript">
		javascript:parent.location='/CDUG/index.jsp';
		</script>
		<%
			} else {
		%>
		<%
			String date = new String();
				StringTranslator stringtrans = new StringTranslator();
				String title = request.getParameter("title");
				String text = request.getParameter("text");
				title = stringtrans.convertToHtmlString_Simple(title);
				text = stringtrans.convertToHtmlString(text);
				int year;
				int month;
				int day;
				GregorianCalendar calendar = new GregorianCalendar();
				year = calendar.get(calendar.YEAR);
				month = calendar.get(calendar.MONTH) + 1;
				day = calendar.get(calendar.DAY_OF_MONTH);
				date = year + "-" + month + "-" + day;
		%>
		<a name="7_2_15M"></a>




		<table border="0" width="100%" height="100%" align="center"
			cellpadding="0" cellspacing="5">
			<tr bgcolor="#FFFFFF">
				<td>
					<table width="100%" height="100%" cellpadding="0" cellspacing="0"
						align="center">
						<tr height="1">
							<td width="100%" height="12" nowrap align="center">

								<table border="0" width="100%" cellpadding="3" cellspacing="0"
									align="center">
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
											<table>
												<tr>
													<td WIDTH="625">

														<hr>
													</td>
												</tr>
												<tr>
													<td width="100%"
														style="background-color: rgb(51, 51, 153);">
														<span class="title" style="color: rgb(255, 255, 255);">
															<%
																String tag = request.getParameter("tag");
																	if (tag.equals("news")) {
															%> DB2新闻 <%
																} else {
															%> CDUG事件簿 <%
																}
															%> </span>
													</td>
												</tr>
												<tr>
													<td>
														<hr>



														<table width="100%">
														</table>
														<hr>
													</td>
												</tr>
												<tr>
													<td>
														<P class=text>
															<FONT class=fecha>发布时间:<%=date%><br>
															</FONT>

															<SPAN class=title1> <%=title%> </span>
															<br>
														<p class=text><%=text%></p>
														<br>
													</td>
												</tr>
												<tr>
													<td>
														<HR style="BACKGROUND-COLOR: #333399" color=#000099
															noShade SIZE=2>
														<a href='javascript:window.close()'> <img
																src='/CDUG/backbtn.gif' border=0 align=right> </a>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>





							</td>
						</tr>

					</table>
		</table>



		<a name="skipportlet7_2_15M"></a>
		<%
			}
		%>
	</body>

</html>