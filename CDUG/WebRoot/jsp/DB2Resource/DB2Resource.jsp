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

		<META http-equiv="Content-Type" content="text/html; charset=utf-8">
		<META name="GENERATOR" content="IBM WebSphere Studio">
		<META http-equiv="Content-Style-Type" content="text/css">

		<link href='/CDUG/css/Portal.png' rel="shortcut icon">
		<link href='/CDUG/css/LWP_Styles.css' rel="styleSheet" type="text/css">
		<link href='/CDUG/css/Styles.css' rel="styleSheet" type="text/css">
		<link href='/CDUG/css/HelpStyles.css' rel="styleSheet" type="text/css">
		<link href="/CDUG/css/idug_style_11.css" rel="styleSheet"
			type="text/css">
		<SCRIPT language="JavaScript">
			function validateForm(theForm) {
				if((theForm.userid.value == "")||	
				(theForm.password.value == ""))
				{
				alert("用户名和密码不能为空！");
				return false;
				}
			return true;
			}
			function Submit(theForm){
			if(theForm.fileintro.value == "" || theForm.file.value == "" || theForm.tag.value == "")
			{
				alert("上传文件地址、文件简述以及标签不能为空！");
				return false;
			}
			else{
				var fileDes = theForm.fileintro.value;
				var username = theForm.username.value;
				var useraccess = theForm.useraccess.value;
				var fname = theForm.file.value.toUpperCase();
				var tag = theForm.tag.value;
				if(confirm("确定上传该文件?")){
				upform.action = "/CDUG/servlet/Upload?fileDes="+fileDes+"&username="+username+"&useraccess="+useraccess+"&fname="+fname+"&tag="+tag;
				return true;
				}
				else{
				return false;
				}
			}
			}
			function Delete(form){
				if(confirm("确定删除所选文件?（被删除文件不可恢复）")){
				return true;
				}
				else{
				return false;
				}
      		 }
      		 function SelectAll(form){
      		 	var objs = form.getElementsByTagName("input");
				  for(var i=0; i<objs.length; i++) {
				    if(objs[i].type.toLowerCase() == "checkbox" )
				      objs[i].checked = true;
				  }
      		 }
      		 function CancleSelect(form){
      		 	var objs = form.getElementsByTagName("input");
				  for(var i=0; i<objs.length; i++) {
				    if(objs[i].type.toLowerCase() == "checkbox" )
				      objs[i].checked = false;
				  }
      		 }
			function Fileinfo(){
				alert(document.deleteform.checkfile.value);
				return false;
			}
			function Searchfile(){
			if(document.SearchFile.searchfile.value == ""){
			alert("请填写搜索内容！");
			return false;
			}
			else{
			return true;
			}
			}
			function All(){
				document.SearchFile.action="/CDUG/jsp/DB2Resource/DB2Resource.jsp";
				document.SearchFile.submit();
			}
			function Tag_search(){
				alert("!!!");
			}
			function Url(){
			if(document.urlform.url.value=="" || document.urlform.fileintro.value == "" || document.urlform.tag.value == "")
			{
				alert("文件地址链接、文件简述以及标签不能为空！");
				return false;
			}
			else{
			if(confirm("确定提交?")){
				return true;
			}
			else{
			return false;
			}
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
																						title='Skip portlet'> </a>
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
																								style="color: rgb(255, 255, 255);">DB2资源</span>
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
																						if (user_session.getUser_id().equals("")) {
																					%>
																					<tr>
																						<td>
																							<br>
																							<br>
																							<br>
																							<br>
																							<div align="center">
																								<font size="3"> <strong>本栏目只对论坛注册用户开放!</strong>
																								</font>
																								<br>
																							</div>
																							<br>
																							<br>
																							<div align="center"><label class=title1><a href="/forum/register.php" target="_bank">点此注册成为会员！</a></label> 
																							<br></div>
																							<br><br>
																						</td>
																					</tr>
																					<%
																						} else {
																							if (user_session.getUser_access() == 1
																									|| user_session.getUser_access() == 2) {
																					%>
																					<tr>
																						<td class="wpsFieldText" align="left">
																							<form name="upform" action="/CDUG/servlet/Upload"
																								method="POST" enctype="multipart/form-data"
																								onsubmit="return Submit(document.upform)">
																								注意：带（<font color="#ff0000">*</font>）为必须填项！
																								<p class=title>
																									本地上传:
																								</p>
																								请选择您要上传的文件位置（<font color="#ff0000">*</font>）:
																								<br>
																								<font color="#ff0000">注意:上传文件请不要超过100M!</font>
																								<br>
																								<br>
																								<input type="file" name="file" id="file1" />
																								<br>
																								<br>
																								请填写上传资源标签（<font color="#ff0000">*</font>）：
																								<br><br>
																								<input type=text name="tag" id="tag"
																									maxlength="30" title="请认真填写以便于用户查找" />
																								（多个关键字或tag请用<font color="#ff0000">空格</font>分开，最多收录5个tag）
																								<br>
																								<br>
																								文件简述(40字符以内)（<font color="#ff0000">*</font>）:
																								<br>
																								<br>
																								<input dir="ltr" type="text" size="19"
																									id="fileintro" name="fileintro" maxlength="40" />
																								<br>
																								<br>
																								<br>
																								<input type="hidden" id="username"
																									name="username"
																									value="<%=user_session.getUser_id()%>">
																								<input type="hidden" id="useraccess"
																									name="useraccess"
																									value="<%=user_session.getUser_access()%>">
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type="submit"
																									id="submit" name="submit" value="上传" />
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type="reset" />
																							</form>
																							<hr>
																							<form name="urlform" action="/CDUG/servlet/UrlFile"
																								method="POST" onsubmit="return Url()">
																								<p class=title>
																									外部链接:
																								</p>
																								请填写资源链接（<font color="#ff0000">*</font>）：
																								<br>
																								<input type=text name="url" id="url" size=80
																									maxlength="100"/>
																								（请填写完整URL地址）
																								<br>
																								<br>
																								请填写上传资源标签（<font color="#ff0000">*</font>）：
																								<br><br>
																								<input type=text name="tag" id="tag"
																									maxlength="30" title="请认真填写以便于用户查找" />
																								（多个关键字或tag请用<font color="#ff0000">空格</font>分开，最多收录5个tag）
																								<br>
																								<br>
																								文件简述(40字符以内)（<font color="#ff0000">*</font>）:
																								<br>
																								<br>
																								<input dir="ltr" type="text" size="19"
																									id="fileintro" name="fileintro" maxlength="40" />
																								<br><br><br>
																								<input type="hidden" id="username"
																									name="username"
																									value="<%=user_session.getUser_id()%>">
																								<input type="hidden" id="useraccess"
																									name="useraccess"
																									value="<%=user_session.getUser_access()%>">
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type="submit"
																									id="submit" name="submit" value="上传" />
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 95" type="reset" />
																							</form>
																							<hr>
																							<br>
																						</td>
																					</tr>
																					<%
																						}
																					%>
																					<tr><td>
																							<table border="0" width="100%" height="100%"
																								align="center" cellpadding="0" cellspacing="5">
																								<tr>
																									<td>
																										<table width="100%" height="100%"
																											cellpadding="0" cellspacing="0"
																											align="center">
																											<tr height="1">
																												<td width="100%" height="12" nowrap
																													align="center">

																													<table border="0" width="100%"
																														cellpadding="3" cellspacing="0"
																														align="center">
																														<tr>
																															<td class="wpsPortletBorderTitle"
																																width="100%" nowrap align="center"
																																valign="middle">
																																<a href="#skipportlet7_2_15M"><img
																																		border="0" src='/CDUG/image/dot.gif'
																																		alt='Skip portlet'
																																		title='Skip portlet'> </a>
																															</td>
																														</tr>
																													</table>
																												</td>
																											</tr>
																											<tr height="100%">
																												<td width="100%" valign="top"
																													class="wpsPortletBorder"
																													style="padding: 5px;" dir="ltr">
																													<table width="100%" cellpadding="0"
																														cellspacing="0" border="0">
																														<tr>
																															<td valign="top">
																																<p class=title1>
																																	热门标签:
																																</p>
																																<table width="100%" align="center" class=text>
																																<tr>
																																<%
																																TagTool t_tool = new TagTool();
																																String result =  t_tool.TagSum("select * from cdug_upload_file","tag");
																																int tag_count = 1;
																																Iterator it=t_tool.TagForSortCount(result).entrySet().iterator();
																																while(it.hasNext() && tag_count != 6)
																																   {
																																	   Map.Entry entry=(Map.Entry)it.next();
																																	   int key=(Integer)entry.getKey();
																																	   String value=(String)entry.getValue();
																																%>
																																<td width="20%" style="padding: 10px;" dir="ltr" align="center">
																																<form action="/CDUG/jsp/DB2Resource/DB2Resource.jsp" method=POST>
																																<input type=hidden value=<%=value%> name="searchfile"/>
																																<a onMouseOver="this.style.cursor='hand'" onclick="submit();" class="fecha" ><font size="2"><%=value%></font></a>
																																</form>
																																</td>
																																<%
																																++tag_count;
																																}
																																%>
																																</tr>
																																<tr><td>
																																</td></tr>
																																<tr>
																																<%
																																while(it.hasNext() && tag_count != 11)
																																   {
																																	   Map.Entry entry=(Map.Entry)it.next();
																																	   int key=(Integer)entry.getKey();
																																	   String value=(String)entry.getValue();
																																%>
																																<td width="20%" style="padding: 10px;" dir="ltr" align="center">
																																<form action="/CDUG/jsp/DB2Resource/DB2Resource.jsp" method=POST>
																																<input type=hidden value=<%=value%> name="searchfile"/>
																																<a onMouseOver="this.style.cursor='hand'" onclick="submit();" class="fecha" ><font size="2"><%=value%></font></a>
																																</form>
																																</td>
																																<%
																																++tag_count;
																																}
																																%>
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
																							<hr>
																						</td></tr>
																					<tr>
																						<td nowrap="nowrap" class="summary">
																							<form action="/CDUG/jsp/DB2Resource/DB2Resource.jsp" method="post" name="SearchFile"
																								onsubmit="return Searchfile();">
																								<font color="#0080c0" size="2">搜索资源：</font>
																								<input type="text" name="searchfile"
																									id="searchfile">
																								&nbsp;
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 60" type=submit
																									value=搜索>
																								&nbsp;
																								<input class="wpsButtonText"
																									style="cursor: hand; width: 60" type=button
																									value=查看全部 onclick="return All();">
																								<br>
																							</form>
																						</td>
																					</tr>
																					<tr>
																						<td nowrap="nowrap" class="wpsInlineHelpText">
																							<%
																								response.setContentType("text/html;charset=UTF-8");
																								request.setCharacterEncoding("UTF-8");
																								DAO dbctr = new DAO();
																								String searchFile = new String();
																									StringTranslator stringtrans = new StringTranslator();
																									searchFile = request.getParameter("searchfile");
																									if (searchFile == null) {
																										searchFile = "%";
																									}
																									searchFile = stringtrans.replaceString(searchFile, " ", "%");
																									searchFile = stringtrans.convertToSqlString(searchFile);
																									int cpage;
																									int maxLine = 10;
																									int pageRowCount;
																									int pageCount;
																									java.sql.ResultSet rs1 = dbctr
																											.getResultSet("select * from cdug_upload_file where tag like '%"
																													+ searchFile + "%' or filename like '%"
																													+ searchFile + "%';");
																									rs1.last();
																									pageRowCount = rs1.getRow();
																									pageCount = (int) Math.ceil(pageRowCount / maxLine) + 1;
																									String strPageNum = new String();
																									strPageNum = request.getParameter("page");//取得<href>提交的页码 
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
																											.getResultSet("select * from cdug_upload_file where tag like '%"
																													+ searchFile + "%' or filename like '%"
																													+ searchFile + "%' order by uid desc limit "
																													+ (cpage - 1) * maxLine + "," + maxLine);
																									while (rs.next()) {
																										String filename = new String();
																										filename = rs.getString("filename");
																										String filedes = new String();
																										filedes = rs.getString("filedes");
																										String date = new String();
																										date = rs.getString("date");
																										String username = new String();
																										username = rs.getString("username");
																										String tag = new String();
																										tag = rs.getString("tag");
																										String url = new String();
																										url = rs.getString("url");
																										int flag = 0;
																										if(url.equals("")){
																											flag = 1;
																										}
																										int uid = rs.getInt("uid");
																										int n = 1;
																							%>
																							<form name="deleteform"
																								action="/CDUG/servlet/Deletefile" method="post"
																								onsubmit="return Delete(document.deleteform)">
																								<%
																									if (user_session.getUser_access() == 2) {
																								%>
																								<input type="checkbox" name="checkfile"
																									id="<%=n%>" value="<%=uid%>">
																								<%
																									++n;
																											}
																									if(url.equals("")){
																								%>
																								
																								<a
																									href="/CDUG/source/Upload/<%=date%>/<%=filename%>"
																									target="_blank" class=fecha><%=filename%></a>
																								
																								<%
																									}
																									else{
																								%>
																								<a
																									href="<%=url%>"
																									target="_blank" class=fecha><%=filename%></a>
																								<%
																									}
																									if (((user_session.getUser_access() == 2) || user_session.getUser_id().equals(username))) {
																								%>
																								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																								<a
																									href="/CDUG/jsp/DB2Resource/updateFileInfo.jsp?filename=<%=filename%>&flag=<%=flag%>">
																									<b>修改文件信息</b>
																								</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																								<%
																								if(url.equals("")){
																								%>
																								<a
																									href="/CDUG/jsp/DB2Resource/ReplaceFile.jsp?filename=<%=filename%>&date=<%=date%>">
																									<b>替换资源文件</b>
																								</a>
																								<%
																									}
																									}
																								%>
																								<br>
																								<br>
																								&nbsp;&nbsp;&nbsp;&nbsp;
																								<strong><label class=text><%=filedes%></label>
																								</strong>
																								<br>
																								<br>
																								<strong><font color="#008080">标签：</font>
																								</strong><%=tag%>&nbsp;&nbsp;&nbsp;
																								<strong><font color="#008080">用户：</font>
																								</strong><%=username%>&nbsp;&nbsp;&nbsp;
																								<strong><font color="#008080">发布日期：</font>
																								</strong><%=date%>
																								<br>
																								<hr>
																								<br>
																								<%
																									}
																										if (user_session.getUser_access() == 2) {
																								%>

																								<input type="hidden" id="useraccess"
																									name="useraccess"
																									value="<%=user_session.getUser_access()%>">
																								<input type="submit" class="wpsButtonText"
																									style="width: 95px;" name="delete" value="删除所选">
																								<input type="button" class="wpsButtonText"
																									style="width: 95px;" name="selectall"
																									id="selectall" value="全部选择"
																									onClick="SelectAll(this.form)">
																								<input type="button" class="wpsButtonText"
																									style="width: 95px;" name="reset" id="reset"
																									value="取消所选" onClick="CancleSelect(this.form)">

																								<br>
																								<br>
																								<%
																									}
																								%>
																								<%
																									if (cpage > 1) {
																								%><a href="DB2Resource.jsp?page=<%=cpage - 1%>">上一页</a>
																								<%
																									}
																								%>
																								<%
																									if (cpage < pageCount) {
																								%><a href="DB2Resource.jsp?page=<%=cpage + 1%>">下一页</a>
																								<%
																									}
																								%>

																								页次：<%=cpage%>/<%=pageCount%>页
																								<%=maxLine%>条/页&nbsp; 共<%=pageRowCount%>个资源
																							</form>
																						</td>
																					</tr>

																					<%
																						dbctr.close();
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
	</body>
</html>