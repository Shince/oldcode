<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="DAO.DAO" />
<jsp:directive.page import="utility.*" />
<SCRIPT language="JavaScript" type="text/javascript">
			function validateForm(theForm) {
				if((theForm.userid.value == "")||	
				(theForm.password.value == ""))
				{
				alert("用户名和密码不能为空！");
				return false;
				}
				else{
				return true;
				}
			}
</SCRIPT>
<SCRIPT language=JavaScript src="/CDUG/javascript/nowtime.js"></SCRIPT>
<body onload=startclock()>
<%
	DAO dbctr = new DAO();
%>
<a name="left_1_beg"></a>

<table border="0" width="100%" height="100%" cellpadding="0"
	cellspacing="5">
	<tr>
		<td>
			<table border="0" width="100%" height="100%" cellpadding="0"
				cellspacing="0">
				<tr height="1">
					<td width="100%" height="12" nowrap>
						<table border="0" width="100%" cellpadding="3" cellspacing="0">
							<tr>
								<td class="wpsPortletBorderTitle" width="100%" nowrap
									align="left" valign="middle">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr height="100%">
					<td width="100%" valign="top" class="wpsPortletBorder"
						style="padding: 5px;" dir="ltr">
						<!--for fun!  -->
						<form name=clock >
						<input name=thetime style="font-size: 9pt;color:green;border:0;" size=20 readonly>
						</form>
						<!--for fun!  -->
						<form method="post" action="/CDUG/servlet/login" name="LoginForm"
							onsubmit="return validateForm(document.LoginForm)">
							<table width="100%" cellspacing="0" cellpadding="0" align="left"
								border="0">
								<tr>
									<td nowrap="nowrap" class="summary">
										论坛会员通道
										<br>
										<br>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" class="wpsInlineHelpText">
										&nbsp;
									</td>
								</tr>
								<jsp:useBean class="Bean.User" id="user_session" scope="session" />
								<%
									if (!SessionListener.isOnline(session)) {
										user_session.setUid(0);
										user_session.setUser_access(-1);
										user_session.setUser_id("");
										user_session.setPassword("");
									}
								%>
								<%
									if (user_session.getUser_id().equals("")) {
								%>
								<tr>
									<td nowrap="nowrap" class=text>
										忘记密码？ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href='/forum/member.php?action=lostpasswd' target='_bank'>点此找回！</a>

									</td>

								</tr>
								<tr>
									<td>
										<br>
										<br>
									</td>
								</tr>



								<tr>
									<td class="wpsEditText" align="left">
										<label for="userID" class=text>
											会员ID:
										</label>
										<br>
										<br>
									</td>
								</tr>
								<tr>
									<td class="wpsFieldText" align="left">
										<input dir="ltr" type="text" size="25" id="userid"
											name="userid" value='' />
										<br>
										<br>
									</td>
								</tr>
								<tr>
									<td class="wpsEditText" align="left">
										<label for="password" class=text>
											密码:
										</label>
										<br>
										<br>
									</td>
								</tr>
								<tr>
									<td class="wpsFieldText" align="left">
										<input dir="ltr" type="password" size="25" id="password"
											name="password" />
									</td>
								</tr>
								<tr>
									<td>
										<br>
										<br>
										<input class="wpsButtonText" style="cursor: hand; width: 75"
											type="submit" name="login" value='登入' />
										<input class="wpsButtonText" style="cursor: hand; width: 75"
											type="button" name="register" onclick="window.open('/forum/register.php')" value='注册' />
									</td>
								</tr>
								<%
									} else {
								%>
								<tr>
									<td nowrap="nowrap">
									<%
										DAO dbctrl = new DAO();
											int uid = 0;
											//String newflag = new String();
											uid = user_session.getUid();
									%>
										欢 迎 您: 
										<label class=fecha onclick="javascript:window.open('/forum/space.php?action=viewpro&uid=<%=uid%>');" onMouseOver="this.style.cursor='hand',this.style.color='black'"
										onMouseOut="this.style.color='#ff6600'"><%=user_session.getUser_id()%></label>
									</td>
								</tr>
								<%
									if (user_session.getUser_access() == 1) {
								%>
								<tr>
									<td nowrap="nowrap">
										<br>
										<p class="title2">新闻发布区</p>
										<p>
											<a href='/CDUG/jsp/backRelease/newsbackRelease.jsp'>发布DB2新闻</a>
										</p>
										<p>
											<a href='/CDUG/jsp/backRelease/eventsnewsbackRelease.jsp'>发布CDUG事件簿</a>
										</p>
									</td>
								</tr>
								<%
									} else if (user_session.getUser_access() == 2) {
								%>
								<tr>
									<td nowrap="nowrap">
										<br>
										<p class="title2">后台管理区</p>
										<p>
											<a href='/CDUG/jsp/AdminManagement' target="_blank">后台管理</a>
										</p>
										<p class="title2">新闻发布区</p>
										<p>
											<a href='/CDUG/jsp/backRelease/newsbackRelease.jsp'>发布DB2新闻</a>
										</p>
										<p>
											<a href='/CDUG/jsp/backRelease/eventsnewsbackRelease.jsp'>发布CDUG事件簿</a>
										</p>
									</td>
								</tr>
								<%
									} else {
								%>

								<%
									}
								%>
								<tr>
									<td nowrap="nowrap">
										<br>
										<p class="title2">个人管理区</p>
										<p>
											<a href='/forum/memcp.php?action=profile&typeid=1'
												target='_blank'>修改密码</a>
										</p>
										<p>
											<a href='/forum/memcp.php?action=profile' target='_blank'>编辑个人资料</a>
										</p>
										<p class="title2">论坛消息区</p>
										<p>
										<%
											java.sql.ResultSet rs_pms = dbctrl
														.getResultSet("SELECT * FROM cdug_pms where msgtoid="
																+ uid + " and delstatus = 0;");
												rs_pms.last();
												int rowCount = 0;
												rowCount = rs_pms.getRow();
										%>
										您的<a href='/forum/pm.php' target='_blank'>收件箱</a>中共有<%=rowCount%>条论坛短消息。
										</p>
										
										<%
																					java.sql.ResultSet rs_new_pms = dbctrl
																								.getResultSet("SELECT * FROM cdug_pms where msgtoid="
																										+ uid + " and new = 1;");
																						if (rs_new_pms.next()) {
																				%>
										<p>
											<a href='/forum/pm.php' target='_blank' id="blink">你有新的论坛短消息！</a>
										</p>
										<script language="javascript"> 
										function changeColor(){ 
										var color="#000|#fff"; 
										color=color.split("|"); 
										document.getElementById("blink").style.color=color[parseInt(Math.random() * color.length)]; 
										} 
										setInterval("changeColor()",200); 
										</script>
										<%
											}
										%>
										<%
											dbctrl.close();
										%>
										<hr>
									</td>
								</tr>
								<tr>
									<td>
										<br>
										<input onMouseOver="this.style.cursor='hand'"
											onclick="javascript:if(confirm('确定注销？')){parent.location = '/CDUG/servlet/logout'}else{return false;}"
											class="wpsButtonText" style="cursor: hand; width: 95"
											type="button" name="logout" value='注销' />

									</td>
								</tr>
								<%
									}
								%>
								<tr>
									<td>
										&nbsp;
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

<a name="left_1_end"></a>

<a name="left_4_beg"></a>

<table border="0" width="100%" height="100%" cellpadding="0"
	cellspacing="5">
	<tr>
		<td>
			<table border="0" width="100%" height="100%" cellpadding="0"
				cellspacing="0">
				<tr height="1">
					<td width="100%" height="12" nowrap>

						<table border="0" width="100%" cellpadding="3" cellspacing="0">
							<tr>
								<td class="wpsPortletBorderTitle" width="100%" nowrap
									align="left" valign="middle">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="100%">
					<td width="100%" valign="top" class="wpsPortletBorder"
						style="padding: 5px;" dir="ltr">
						<table width="100%" cellspacing="0" cellpadding="0" align="left"
							border="0">
							<tr height="100%">
								<td width="100%" valign="top" style="padding: 5px;" dir="ltr">
									<table>
										<tr>
											<td class="title1">
												最新资源
											</td>
										</tr>
									</table>
									<br><br>
									<div style="width: 100%; overflow: auto;">
											<table>
												<%
													java.sql.ResultSet rs4 = dbctr
															.getResultSet("SELECT * FROM cdug_upload_file order by uid desc limit 0,5");
													while (rs4.next()) {
														String filename = rs4.getString("filename");
														String filedes = rs4.getString("filedes");
												%>
												
												<tr>
													<td>
													<form action="/CDUG/jsp/DB2Resource/DB2Resource.jsp" method="post">
														<input type="hidden" name="searchfile" id="searchfile"
															value="<%=filename%>">
														<FONT class="fecha"><label style="cursor: hand;" 
															onMouseOver="this.style.color='blue'"
															onMouseOut="this.style.color='#ff6600'"
															onclick="javascrpt:submit();"><%=filename%></label> </FONT>
													</form>
													</td>
													<!--
													<td><form><label class=text3><%=filedes%></label></form></td>
													-->
												</tr>
												
												<%
													}
												%>
											</table>
										</div>
								</td>
							</tr>
						</table>

					</td>
				</tr>

			</table>
		</td>
	</tr>
</table>

<a name="left_4_end"></a>

<a name="left_2_beg"></a>

<table border="0" width="100%" height="100%" cellpadding="0"
	cellspacing="5">
	<tr>
		<td>
			<table border="0" width="100%" height="100%" cellpadding="0"
				cellspacing="0">
				<tr height="1">
					<td width="100%" height="12" nowrap>

						<table border="0" width="100%" cellpadding="3" cellspacing="0">
							<tr>
								<td class="wpsPortletBorderTitle" width="100%" nowrap
									align="left" valign="middle">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="100%">
					<td width="100%" valign="top" class="wpsPortletBorder"
						style="padding: 5px;" dir="ltr">
						<table width="100%" cellspacing="0" cellpadding="0" align="left"
							border="0">
							<tr height="100%">
								<td width="100%" valign="top" style="padding: 5px;" dir="ltr">
									<table>
										<tr>
											<td class="title1">
												本周五大新闻事件
											</td>
										</tr>
									</table>

									<div style="width: 100%; overflow: auto;">
										<table>
											<%
												java.sql.ResultSet rs = dbctr
														.getResultSet("SELECT * FROM cdug_release_all order by statistics desc limit 0,5");
												while (rs.next()) {
													String title = rs.getString("title_text");
													String tag = rs.getString("tag");
													int statistics = rs.getInt("statistics");
													int id = rs.getInt("id");
													String flag = new String();
													if (tag.equals("news")) {
														flag = "DB2新闻";
													} else if (tag.equals("events")) {
														flag = "CDUG事件";
													}
											%>
											<tr>
												<td>
													<%
														if (tag.equals("news")) {
													%>
													<FONT class="fecha"><font color="#800080">[<%=flag%>]</font><A HREF="/CDUG/jsp/DB2news/news.jsp?id=<%=id%>"><%=title%></A></FONT>
													<%
														} else if (tag.equals("events")) {
													%>
													<FONT class="fecha"><font color="#800080">[<%=flag%>]</font><A HREF="/CDUG/jsp/CDUGEvent/news.jsp?id=<%=id%>"><%=title%></A></FONT>
													<%
														}
													%>
												</td>
												<td class="text3"><%=statistics%></td>
											</tr>
											<%
												}
											%>
										</table>
									</div>
								</td>
							</tr>
						</table>

					</td>
				</tr>

			</table>
		</td>
	</tr>
</table>

<a name="left_2_end"></a>

<a name="left_3_beg"></a>

<table border="0" width="100%" height="100%" cellpadding="0"
	cellspacing="5">
	<tr>
		<td>
			<table border="0" width="100%" height="100%" cellpadding="0"
				cellspacing="0">
				<tr height="1">
					<td width="100%" height="12" nowrap>

						<table border="0" width="100%" cellpadding="3" cellspacing="0">
							<tr>
								<td class="wpsPortletBorderTitle" width="100%" nowrap
									align="left" valign="middle">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="100%">
					<td width="100%" valign="top" class="wpsPortletBorder"
						style="padding: 5px;" dir="ltr">
						<table width="100%" cellspacing="0" cellpadding="0" align="left"
							border="0">
							<tr height="100%">
								<td width="100%" valign="top" style="padding: 5px;" dir="ltr">
									<table>
										<tr>
											<td class="title1">
												论坛五大热帖
											</td>
										</tr>
									</table>

									<div style="width: 100%; overflow: auto;">
										<table>
											<%
												java.sql.ResultSet rs1 = dbctr
														.getResultSet("SELECT * FROM cdug_threads order by replies desc limit 0,5");
												while (rs1.next()) {
													String subject = rs1.getString("subject");
													int tid = rs1.getInt("tid");
													//int replies = rs1.getInt("replies");
											%>
											<tr>
												<td>
													<FONT class="fecha"><A HREF="/forum/viewthread.php?tid=<%=tid%>" target="_blank"><%=subject%></A></FONT>
												</td>
											</tr>
											<%
												}
											%>
										</table>
									</div>
								</td>
							</tr>
						</table>

					</td>
				</tr>

			</table>
		</td>
	</tr>
</table>

<a name="left_3_end"></a>
</body>