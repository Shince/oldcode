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
		<SCRIPT language="JavaScript">
			function Delete(){
				if(confirm("确定删除此事件？")){
				return true;
				}
				else{
				return false;
				}
			}
			function EditNews(){
				if(confirm("编辑此事件？")){
				document.editForm.action='/CDUG/jsp/backRelease/newsEdit.jsp';
				document.editForm.submit();
				}
				else{
				return false;
				}
			}
			function Comments(){
			if(document.commentsForm.text.value == "")
			{
				alert("评论内容不能为空！");
				return false;
			}
			else{
				if(confirm("确定发表？")){
				return true;
				}
				else{
				return false;
				}
			}
			}
			function DeleteComments(){
				if(confirm("确定删除？")){
				return true;
				}
				else{
				return false;
				}
			}
      		function SelectAll(){
      		 	var objs = document.getElementsByTagName("input");
				  for(var i=0; i<objs.length; i++) {
				    if(objs[i].type.toLowerCase() == "checkbox" )
				      objs[i].checked = true;
				  }
      		 }
      		function CancleSelect(){
      		 	var objs = document.getElementsByTagName("input");
				  for(var i=0; i<objs.length; i++) {
				    if(objs[i].type.toLowerCase() == "checkbox" )
				      objs[i].checked = false;
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
																								style="color: rgb(255, 255, 255);">CDUG事件簿</span>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<hr>
																							<br>




																						</td>
																					</tr>



																					<jsp:useBean class="Bean.User" id="user_session"
																				scope="session" />
																					<tr>
																						<td>
																							<form action="/CDUG/servlet/Deletenews"
																								name="editForm" method="POST"
																								onsubmit="return Delete()">
																								<%
																									DAO dbctr = new DAO();
																									String id = request.getParameter("id");
																									String title = new String();
																									String text = new String();
																									String date = new String();
																									String a_name = new String();
																									int statistics = 0;
																									java.sql.ResultSet rs = dbctr
																											.getResultSet("select * from cdug_release_all where id="
																													+ id);
																									if (rs.next()) {
																										title = rs.getString("title");
																										text = rs.getString("text");
																										date = rs.getString("date");
																										a_name = rs.getString("username");
																										statistics = rs.getInt("statistics");
																										statistics = statistics + 1;
																										//System.out.println(statistics);
																										dbctr.ResultUpdate("update cdug_release_all set statistics="+statistics+" where id="+id);
																								%>

																								<P class=text>
																									<FONT class=fecha>发布时间:<%=date%><br>
																									</FONT>

																									<SPAN class=title1> <%=title%> </span>
																									<br>
																								<p class=text><%=text%></p>
																								<br>
																								<p align="right">发布人:<%=a_name%></p>
																								<%
																									if (user_session.getUser_access() == 2 || user_session.getUser_id().equals(a_name)) {
																								%>
																								<input type="hidden" name="id" id="id"
																									value="<%=id%>">
																								<input type="hidden" name="useraccess"
																									id="useraccess"
																									value="<%=user_session.getUser_access()%>">
																								<input type="hidden" name="a_name"
																									id="a_name"
																									value="<%=user_session.getUser_id()%>">
																								<input type="hidden" name="tag" id="tag"
																									value="events">
																								<input type="submit" class="wpsButtonText"
																									style="width: 95px;" name="delect" value="删除事件">
																								<input type="button" class="wpsButtonText"
																									style="width: 95px;" name="selectall"
																									id="selectall" value="编辑事件"
																									onClick="return EditNews()">
																								<%
																									}
																								%>
																								<%
																									} else {
																								%>
																								<br>
																								<p class="summary" style="text-align: center;">
																									该事件不存在！
																								</p>
																								<br>
																								<%
																									}
																								%>
																							</form>

																							<a name=""></a>
																							<table width=100% cellpadding=0 cellspacing=0
																								border=0>
																								<%
																									java.sql.ResultSet rs2 = dbctr
																											.getResultSet("select * from cdug_release_comments where newsid = "
																													+ id);
																									rs2.last();
																									int sum = rs2.getRow();
																									int per = 10;
																								%>
																								<tr>
																									<td class=fecha>
																										相关评论(共<%=sum%>条评论)：
																										<br>
																										<br>
																									</td>
																								</tr>
																								<tr>
																									<td class=text>
																										<form name="deleteCommentsForm"
																											action="/CDUG/servlet/DeleteComments"
																											method="POST"
																											onSubmit="return DeleteComments();">
																											<%
																												String flag = request.getParameter("flag");
																												if (flag == null) {
																													flag = "part";
																												}
																												java.sql.ResultSet rs1;
																												if (flag.equals("part")) {
																													rs1 = dbctr
																															.getResultSet("select * from cdug_release_comments where newsid="
																																	+ id + " order by id desc limit 0," + per);
																												} else {
																													rs1 = dbctr
																															.getResultSet("select * from cdug_release_comments where newsid="
																																	+ id + " order by id desc");
																												}
																												while (rs1.next()) {
																													int n = 1;
																											%>
																											<p>
																												<%
																													if (user_session.getUser_access() == 2) {
																												%>
																												<input type="checkbox" name="check"
																													id="<%=n%>"
																													value="<%=rs1.getString("id")%>">
																												<%
																													++n;
																														}
																												%>
																												<strong><%=rs1.getString("username")%></strong>:<%=rs1.getString("text")%></p>
																											<%
																												}
																												if (flag.equals("part") && sum > per) {
																											%>
																											<p align="right">
																												<a href="news.jsp?id=<%=id%>&flag=all">查看所有评论</a>
																											</p>
																											<%
																												}
																												if (user_session.getUser_access() == 2) {
																											%>
																											<input type="hidden" name="newsid"
																												id="newsid" value="<%=id%>">
																											<input type="hidden" name="tag" id="tag"
																												value="events">
																											<input type="hidden" name="useraccess"
																												id="useraccess"
																												value="<%=user_session.getUser_access()%>">
																											<input type="submit" class="wpsButtonText"
																												style="width: 95px;" name="delete"
																												value="删除所选">
																											<input type="button" class="wpsButtonText"
																												style="width: 95px;" name="selectall"
																												id="selectall" value="全部选择"
																												onClick="return SelectAll()">
																											<input type="button" class="wpsButtonText"
																												style="width: 95px;" name="reset" id="reset"
																												value="取消所选"
																												onClick="return 	CancleSelect()">
																											<%
																												}
																											%>
																										</form>
																									</td>
																								</tr>
																								<%
																									if (user_session.getUser_access() == 1
																											|| user_session.getUser_access() == 2
																											|| user_session.getUser_access() == 0) {
																								%>
																								<tr>
																									<td>
																										<hr>
																										<br>
																									</td>
																								</tr>
																								<tr>
																									<td class=text>
																										<form action="/CDUG/servlet/NewsComments"
																											name="commentsForm" method="POST"
																											onsubmit="return Comments()">
																											<font color="#804040">我要评论:<br>
																											</font>
																											<textarea name="text" id="text" rows="10"
																												cols="60" wrap="hard"></textarea>
																											<br>
																											<br>
																											<input type="hidden" id="username"
																												name="username"
																												value="<%=user_session.getUser_id()%>">
																											<input type="hidden" id="useraccess"
																												name="useraccess"
																												value="<%=user_session.getUser_access()%>">
																											<input type="hidden" id="tag" name="tag"
																												value="events">
																											<input type="hidden" id="newsid"
																												name="newsid" value="<%=id%>">
																											<input class="wpsButtonText"
																												style="cursor: hand; width: 95"
																												type="submit" id="submit" name="submit"
																												value="发表评论" />
																											<input class="wpsButtonText"
																												style="cursor: hand; width: 95" type="reset" />
																										</form>
																									</td>
																								</tr>
																								<%
																									} else {
																								%>

																								<%
																									}
																									dbctr.close();
																								%>
																							</table>
																							<a name=""></a>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<HR style="BACKGROUND-COLOR: #333399"
																								color=#000099 noShade SIZE=2>
																							<a href='/CDUG/jsp/CDUGEvent/CDUGEvent.jsp'>
																								<img src='/CDUG/backbtn.gif' border=0
																									align=right> </a>
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
