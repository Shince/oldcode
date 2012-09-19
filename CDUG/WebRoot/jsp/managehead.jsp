<%@ page language="java" pageEncoding="UTF-8"%>
<noscript>
	请调整IE安全设置启用脚本
</noscript>
<tr class="linkmenuup">
	<td width="100%" height="30" class="linkmenuup">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr class="linkmenuup">
				<td width="600" height="30" class="linkmenuup">
					<p style="margin-left: 1em;">
						<a href="/CDUG/jsp/about/about.jsp">关于我们</a> |
						<a href='/forum/member.php?action=lostpasswd' target='_bank'>忘记密码？</a>
						|
						<a href='/forum/register.php' target='_bank'>注册！</a> |
					</p>
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<TD colSpan=3>
		<img src='/CDUG/image/header.gif' width="1000px" height="150px">
	</TD>
</tr>
<tr>
	<td height="20" align="center" valign="middle" bgcolor="#FFFFFF">
		<!-- one one one row, one cell table to span the page-->
		<jsp:useBean class="Bean.User" id="admin_session" scope="session" />
		<%
			if (!(admin_session.getUser_access() == 2)) {
		%>
								<script type="text/javascript">
								javascript:parent.location='/CDUG/index.jsp'
								</script>
		<%
			} else {
		%>
		<table height="29" border="0" cellpadding="0" cellspacing="0"
			width="100%">
			<tr>
				<!-- Navigation -->
				<td align="left" valign="bottom" nowrap>
					<table border="0" cellpadding="0" cellspacing="1" height="29"
						background='image/dot.gif'>
						<TBODY>
							<tr>
								<td class="wpsPlaceBar3dShadow" valign="middle">
									<img width="30" height="29" border="0"
										src='/CDUG/image/dot.gif' alt="">
								</td>
								<td height="29">
									<a class="active-alone"
										href='/CDUG/jsp/AdminManagement/main.jsp'>
										&nbsp;管理后台首页&nbsp; </a>
									<!-- display show tools buttons -->

								</td>
								<td height="29">
									<a class="linkbotoneraup"
										href='/CDUG/jsp/AdminManagement/accessmanage.jsp'> <b>&nbsp;用户权限管理&nbsp;</b>
									</a>
								</td>
								<td height="29">
									<a class="linkbotoneraup"
										href='/CDUG/jsp/AdminManagement/db2resource.jsp'> <b>&nbsp;DB2资源管理&nbsp;</b>
									</a>
								</td>
								<td height="29">
									<a class="linkbotoneraup"
										href='/CDUG/jsp/AdminManagement/UploadManagement.jsp'> <b>&nbsp;新闻附件管理&nbsp;</b>
									</a>
								</td>
								<td height="29">
									<a class="linkbotoneraup"
										href='/CDUG/jsp/AdminManagement/NewsManagement.jsp'> <b>&nbsp;DB2新闻管理&nbsp;</b>
									</a>
								</td>
								<td height="29">
									<a class="linkbotoneraup"
										href='/CDUG/jsp/AdminManagement/EventsManagement.jsp'> <b>&nbsp;CDUG事件管理&nbsp;</b>
									</a>
								</td>
								<td height="29">
									<a class="linkbotoneraup"
										href='/CDUG/jsp/AdminManagement/CommentsManagement.jsp'> <b>&nbsp;评论管理&nbsp;</b>
									</a>
								</td>
								<!--  
								<td height="29">
									<a class="linkbotoneraup"
										href='/CDUG/jsp/AdminManagement/SQLQuery.jsp'> <b>&nbsp;SQL查询通道&nbsp;</b>
									</a>
								</td>
								<td height="29">
									<a class="linkbotoneraup"
										href='/CDUG/jsp/AdminManagement/SQLcontrol.jsp'> <b>&nbsp;SQL修改通道&nbsp;</b>
									</a>
								</td>
								-->
							</tr>
						</TBODY>
					</table>
				</td>
			</tr>
		</table>
		<%
			}
		%>
	</td>
</tr>
<tr bgcolor="#FFFFFF">
	<td>
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" valign="top">
				</td>
			</tr>
		</table>
	</td>
</tr>