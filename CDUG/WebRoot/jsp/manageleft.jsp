<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="DAO.DAO" />
<jsp:directive.page import="utility.*" />
<SCRIPT language=JavaScript src="/CDUG/javascript/nowtime.js"></SCRIPT>
<body onload=startclock()>
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
						<input name=thetime style="font-size: 9pt;color:green;border:0" size=20 readonly>
						</form>
						<!--for fun!  -->
						<form method="post" action="/CDUG/servlet/login" name="LoginForm"
							onsubmit="return validateForm(document.LoginForm)">
							<table width="100%" cellspacing="0" cellpadding="0" align="left"
								border="0">
								<tr>
									<td nowrap="nowrap" class="summary">
										系统后台管理通道
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
								<jsp:useBean class="Bean.User" id="admin_session" scope="session" />
								<%
									if (!(SessionListener.isOnline(session))) {
										user_session.setUid(0);
										user_session.setUser_access(-1);
										user_session.setUser_id("");
										user_session.setPassword("");
										admin_session.setUid(0);
										admin_session.setUser_access(-1);
										admin_session.setUser_id("");
										admin_session.setPassword("");
									}
									if (!(admin_session.getUser_access() == 2)) {
								%>
								<script type="text/javascript">
								javascript:parent.location='/CDUG/index.jsp'
								</script>
								<%
									}else{
								%>
								<tr>
									<td nowrap="nowrap">
										欢 迎 您:
										<label class=fecha
											onclick="javascript:window.open('/forum/space.php?action=viewpro&uid=<%=user_session.getUid()%>');"
											onMouseOver="this.style.cursor='hand',this.style.color='black'"
											onMouseOut="this.style.color='#ff6600'"><%=user_session.getUser_id()%></label>
									</td>
								</tr>

								<tr>
									<td nowrap="nowrap">
										<br>
										<p class="title2">
											用户管理区
										</p>
										<p>
											<a href="/CDUG/jsp/AdminManagement/accessmanage.jsp">用户权限管理</a>
										</p>
										<p></p>
										<p class="title2">
											文件管理区
										</p>
										<p>
											<a href="/CDUG/jsp/AdminManagement/db2resource.jsp">DB2资源管理</a>
										</p>
										<p>
											<a href="/CDUG/jsp/AdminManagement/UploadManagement.jsp">附件管理</a>
										</p>
										<p class="title2">
											新闻事件管理区
										</p>
										<p>
											<a href="/CDUG/jsp/AdminManagement/NewsManagement.jsp">新闻管理</a>
										</p>
										<p>
											<a href="/CDUG/jsp/AdminManagement/EventsManagement.jsp">事件管理</a>
										</p>
										<p>
											<a href="/CDUG/jsp/AdminManagement/CommentsManagement.jsp">评论管理</a>
										</p>
										<!--  开发中
										<p class="title2">
											数据库管理区
										</p>
										<p>
											<a href="/CDUG/jsp/AdminManagement/SQLQuery.jsp">SQL查询通道</a>
										</p>
										<p>
											<a href="/CDUG/jsp/AdminManagement/SQLcontrol.jsp">SQL修改通道</a>
										</p>
										-->
										<hr>
									</td>
								</tr>
								<tr>
									<td>
										<br>
										<input onMouseOver="this.style.cursor='hand'"
											onclick="javascript:if(confirm('确定退出？')){parent.location = '/CDUG/servlet/Adminlogout'}else{return false;}"
											class="wpsButtonText" style="cursor: hand; width: 95"
											type="button" name="logout" value='退出后台管理' />

									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								<%
								}
								%>
							</table>
						</form>

					</td>
				</tr>

			</table>
		</td>
	</tr>
</table>

<a name="left_1_end"></a>
</body>