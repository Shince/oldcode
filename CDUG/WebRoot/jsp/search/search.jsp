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
		<SCRIPT language="JavaScript" type="text/javascript">
		function SearchPage() {
			if(document.SearchForm.forsearch.value==""){
				alert("搜索条件不能为空！");
				return false;
			}else{
				document.SearchForm.action="/CDUG/jsp/search/search.jsp";
				document.SearchForm.target="";
				return true;
			}
			}
		function Baidu() {
			if(document.SearchForm.forsearch.value==""){
				alert("搜索条件不能为空！");
				return false;
			}else{
				var word = document.SearchForm.forsearch.value;
				document.SearchForm.action="http://www.baidu.com/baidu";
				document.SearchForm.target="_blank";
				document.SearchForm.submit();
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
				<td>
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center" valign="top">
								<!--Nav bar-->
								<!--Main Body-->
								<!--Left Column-->
							</td>
						</tr>
					</table>
				</td>
			</tr>
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
																								style="color: rgb(255, 255, 255);">新闻事件搜索</span>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<hr>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<a name="middle_beg"></a>

																							<form action="/CDUG/jsp/search/search.jsp"
																								method=post name=SearchForm
																								onsubmit="return SearchPage();">
																								<input type=text name=forsearch id=forsearch2
																									size="25">
																								&nbsp;&nbsp;
																								<input type=hidden name=aflag value="title">
																								<input type=submit name=titlesearch
																									id=titlesearch value="按标题搜索"
																									class="wpsButtonText"
																									style="cursor: hand; width: 95">
																								<input type=button name=textsearch id=textsearch
																									value="按内容搜索" class="wpsButtonText"
																									style="cursor: hand; width: 95"
																									onclick="javascript:document.SearchForm.aflag.value='text';document.SearchForm.submit();">
																								<!--
																								<input type=hidden name=word><input name=tn type=hidden value=baidu>
																								<input type="button" value="去百度搜索" class="wpsButtonText" style="cursor: hand; width: 95" 
																									onclick="return Baidu();">
																								 -->
																							</form>
																							<label class=title>
																								搜索结果：
																							</label>
																							<hr>
																							<%
																								response.setContentType("text/html;charset=UTF-8");
																								request.setCharacterEncoding("UTF-8");
																								String forsearch = new String();
																								if (request.getParameter("forsearch") == null) {
																							%>
																							<p align="center">
																								<font size="5"><strong>没有找到任何符合条件的新闻事件！</strong>
																								</font>
																							</p>
																							<HR>
																							<%
																								} else {
																									forsearch = request.getParameter("forsearch");
																									String aflag = request.getParameter("aflag");
																									if (aflag == null) {
																										aflag = "title";
																									}
																									//System.out.println(aflag);
																									StringTranslator stringtrans = new StringTranslator();
																									StringCut newString = new StringCut();
																									String searchfile = new String();
																									searchfile = stringtrans.convertToSqlString(forsearch);
																									searchfile = stringtrans.replaceString(searchfile, " ", "%");
																									searchfile = stringtrans.replaceString(searchfile, "\t", "%");
																									searchfile = stringtrans.replaceString(searchfile, "\r", "%");
																									searchfile = stringtrans.replaceString(searchfile, "\n", "%");
																									DAO dbctr = new DAO();
																									int cpage;
																									int maxLine = 10;
																									int pageRowCount;
																									int pageCount;
																									String colname = new String();
																									if (aflag.equals("text")) {
																										colname = "text_text";
																									} else {
																										colname = "title_text";
																									}
																									java.sql.ResultSet rs1 = dbctr
																											.getResultSet("select * from cdug_release_all where "
																													+ colname + " like '%" + searchfile + "%';");
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
																											.getResultSet("select * from cdug_release_all where "
																													+ colname + " like '%" + searchfile
																													+ "%' limit " + (cpage - 1) * maxLine + ","
																													+ maxLine);
																									//System.out.println(searchfile);
																									if (pageRowCount > 0) {
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
																											String tag = rs.getString("tag");
																											if (aflag.equals("text")) {
																												text = newString.RedColorKeyTitle(text, forsearch);
																											} else {
																												title = newString
																														.RedColorKeyTitle(title, forsearch);
																											}
																											String flag = new String();
																											if (tag.equals("news")) {
																												flag = "DB2新闻";
																											} else if (tag.equals("events")) {
																												flag = "CDUG事件";
																											}
																											String date = rs.getString("date");
																											int id = rs.getInt("id");
																							%>

																							<P class=text>
																								<FONT class=fecha><font color="#800080">[<%=flag%>]</font>发布时间:<%=date%><br>
																								</FONT>
																								<SPAN class=title1> <%
 	if (tag.equals("news")) {
 %> <A
																									HREF="/CDUG/jsp/DB2news/news.jsp?id=<%=id%>"><%=title%></A>
																									<%
																										} else if (tag.equals("events")) {
																									%> <A
																									HREF="/CDUG/jsp/CDUGEvent/news.jsp?id=<%=id%>"><%=title%></A>
																									<%
																										}
																									%> </span>
																								<br>
																								<%=text%>
																								<%
																									if (tag.equals("news")) {
																								%>
																								<A HREF="/CDUG/jsp/DB2news/news.jsp?id=<%=id%>">
																									[查看全文]</A>
																								<%
																									} else if (tag.equals("events")) {
																								%>
																								<A
																									HREF="/CDUG/jsp/CDUGEvent/news.jsp?id=<%=id%>">
																									[查看全文]</A>
																								<%
																									}
																								%>
																								<br>
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
																								href="search.jsp?forsearch=<%=forsearch%>&page=<%=cpage - 1%>">上一页</a>
																							<%
																								}
																							%>
																							<%
																								if (cpage < pageCount) {
																							%><a
																								href="search.jsp?forsearch=<%=forsearch%>&page=<%=cpage + 1%>">下一页</a>
																							<%
																								}
																							%>
																							页次：<%=cpage%>/<%=pageCount%>页
																							<%=maxLine%>条/页&nbsp; 共<%=pageRowCount%>条记录
																							<br>
																							<%
																								} else {
																							%>
																							<p align="center">
																								<font size="5"><strong>没有找到任何符合条件的新闻事件！</strong>
																								</font>
																							</p>
																							<HR>
																							<%
																								}
																								}
																							%>
																							<!--  
																							<form action="http://www.baidu.com/baidu"
																								target="_blank">
																								<table bgcolor="#FFFFFF" align="center">
																									<tr>
																										<td>
																											<input name=tn type=hidden value=baidu>
																											<a href="http://www.baidu.com/"><img
																													src="http://img.baidu.com/img/logo-80px.gif"
																													alt="Baidu" align="bottom" border="0"></a>
																											<input type=text name=word size=30>
																											<input type="submit" class="wpsButtonText" style="cursor: hand; width: 95" value="去百度搜索">
																										</td>
																									</tr>
																								</table>
																							</form>
																							-->
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
																								style="color: rgb(255, 255, 255);">百度搜索</span>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<hr>
																						</td>
																					</tr>
																					<tr>
																						<td>
																						<form action="http://www.baidu.com/baidu"
																								target="_blank">
																								<table bgcolor="#FFFFFF" align="center">
																									<tr>
																										<td>
																											<input name=tn type=hidden value=baidu>
																											<a href="http://www.baidu.com/"><img
																													src="/CDUG/image/logo-80px.gif"
																													alt="Baidu" align="bottom" border="0"></a>
																											&nbsp;&nbsp;
																											<input type=text name=word size=30 value="<%=forsearch%>">&nbsp;&nbsp;
																											<input type="submit" class="wpsButtonText" style="cursor: hand; width: 95" value="去百度搜索">
																										</td>
																									</tr>
																								</table>
																							</form>

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
											<%@include file="../right.jsp"%>
											<a name="right_end"></a>

										</td>
									</tr>
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