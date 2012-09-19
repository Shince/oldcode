<%@ page language="java" pageEncoding="UTF-8"%>
<script src="http://www.google-analytics.com/urchin.js"
	type="text/javascript">
</script>
<SCRIPT language="JavaScript" type="text/javascript">
			function Search() {
			if(document.getElementById("forsearch").value==""){
				alert("搜索条件不能为空！");
			}else{
				var forsearch = document.getElementById("forsearch").value;
				window.location = '/CDUG/jsp/search/search.jsp?forsearch='+forsearch;
			}
			}
</SCRIPT>
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
									<a class="active-alone" href='/CDUG'> &nbsp;首页&nbsp; </a>
									<!-- display show tools buttons -->

								</td>
								<td height="29">
									<a class="linkbotoneraup" href='/CDUG/jsp/DB2news/DB2news.jsp'>
										<b>&nbsp;DB2新闻&nbsp;</b> </a>
								</td>
								<td height="29">
									<a class="linkbotoneraup" href='/wiki' target='_blank'> <b>&nbsp;DB2在中国&nbsp;</b>
									</a>
								</td>
								<td height="29">
									<a class="linkbotoneraup"
										href='/CDUG/jsp/CDUGEvent/CDUGEvent.jsp'> <b>&nbsp;CDUG事件簿&nbsp;</b>
									</a>
								</td>
								<td height="29">
									<a class="linkbotoneraup"
										href='/CDUG/jsp/DB2Resource/DB2Resource.jsp'> <b>&nbsp;DB2资源&nbsp;</b>
									</a>
								</td>
								<td height="29">
									<a class="linkbotoneraup" href='/forum' target='_bank'> <b>&nbsp;CDUG论坛&nbsp;</b>
									</a>
								</td>
								<td height="29">
									<a class="linkbotoneraup" href='/CDUG/jsp/about/about.jsp'>
										<b>&nbsp;关于我们&nbsp;</b> </a>
								</td>
								<!--
								<td height="29">
									<a class="linkbotoneraup" href='/CDUG/jsp/search/search.jsp'>
										<b>&nbsp;站内搜索&nbsp;</b> </a>
								</td>
								-->
								<jsp:useBean class="Bean.User" id="user_session" scope="session" />
								<%
									if (user_session.getUser_access() == 2) {
								%>
								<td height="29">
									<a class="linkbotoneraup" href='/CDUG/jsp/AdminManagement'
										target="_blank"> <b>&nbsp;后台管理&nbsp;</b> </a>
								</td>
								<td width="120px">
								</td>
								<%
									}
									else{
								%>
								<td width="180px">
								</td>
								<%
								}
								%>
								<td valign="middle" nowrap class=text> 
									<strong>站内搜索:</strong>
									&nbsp;
								</td>
								<td valign="middle">
									<input type="text" class="wpsEditField" name="forsearch"
										id="forsearch" size=35 value="">
										&nbsp;
								</td>
								<td valign="middle">
									<input alt='搜索' src="/CDUG/image/Search.gif" type="image" onclick="return Search();">
								</td>
							</tr>
						</TBODY>
					</table>
				</td>
			</tr>
		</table>
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