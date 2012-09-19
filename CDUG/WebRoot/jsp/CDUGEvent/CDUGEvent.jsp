<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="DAO.DAO" />
<jsp:directive.page import="java.math.*" />
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
																								style="color: rgb(255, 255, 255);">DB2事件簿</span>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<hr>



																							<table width="100%">
																								<tr>
																									<td align="left">
																										<a href="/CDUG/servlet/EventsRss"
																											target="_blank"><img
																												src="/CDUG/image/rss.gif"
																												alt="Open RSS Feed" border="0" height="14"
																												width="36"></a>
																										<a href="/CDUG/servlet/EventsRss"
																											target="_blank"><img
																												src="/CDUG/image/xml.gif"
																												alt="Open RSS Feed" border="0" height="14"
																												width="36">
																										</a>
																									</td>
																									<td align="right">

																									</td>
																								</tr>
																							</table>
																							<hr>
																						</td>
																					</tr>




																					<tr>
																						<td>
																							<%
																								DAO dbctr = new DAO();
																								int cpage;
																								int maxLine = 10;
																								int pageRowCount;
																								int pageCount;
																								java.sql.ResultSet rs1 = dbctr
																										.getResultSet("select * from cdug_release_all where tag = 'events'");
																								rs1.last();
																								pageRowCount = rs1.getRow();
																								pageCount = (int) Math.ceil(pageRowCount / maxLine) + 1;
																								String strPageNum = request.getParameter("page");//取得<href>提交的页码 
																								if (strPageNum == null) { //表明在QueryString中没有page这一个参数，此时显示第一页数据 
																									cpage = 1;
																								} else {
																									cpage = java.lang.Integer.parseInt(strPageNum);//将字符串转换成整型 
																									if (cpage < 1)
																										cpage = 1;
																								}

																								if (cpage > pageCount)
																									cpage = pageCount;//调整待显示的页码 
																								java.sql.ResultSet rs = dbctr
																										.getResultSet("select * from cdug_release_all where tag = 'events' order by id desc limit "
																												+ (cpage - 1) * maxLine + "," + maxLine);
																								while (rs.next()) {
																									String title = rs.getString("title");
																									String text = rs.getString("text");
																									if (text.length() > 200) {
																										if (text.indexOf("<img") <= 200
																												&& text.indexOf("<img") >= 100) {
																											text = text.substring(0, text.indexOf("<img"))
																													+ "...";
																										} else {
																											text = text.substring(0, 200) + "...";
																										}
																									}
																									String date = rs.getString("date");
																									int id = rs.getInt("id");
																									//String username = rs.getString("username");
																							%>

																							<P class=text>
																								<FONT class=fecha>发布时间:<%=date%><br>
																								</FONT>

																								<SPAN class=title1> <A
																									HREF="news.jsp?id=<%=id%>"><%=title%></A> </span>
																								<br>
																								<%=text%>
																								<A HREF="news.jsp?id=<%=id%>"> [查看全文]</A>
																							</p>

																							<%
																								}
																								dbctr.close();
																							%>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<HR style="BACKGROUND-COLOR: #333399"
																								color=#000099 noShade SIZE=2>
																							<%
																								if (cpage > 1) {
																							%><a
																								href="CDUGEvent.jsp?page=<%=cpage - 1%>">上一页</a>
																							<%
																								}
																							%>
																							<%
																								if (cpage < pageCount) {
																							%><a
																								href="CDUGEvent.jsp?page=<%=cpage + 1%>">下一页</a>
																							<%
																								}
																							%>
																							页次：<%=cpage%>/<%=pageCount%>页
																							<%=maxLine%>条/页&nbsp; 共<%=pageRowCount%>条记录
																							<br>
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

	</body>
</html>
