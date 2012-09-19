<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="DAO.DAO" />
<jsp:directive.page import="java.math.*" />
<jsp:directive.page import="MD5.MD5" />
<jsp:directive.page import="utility.*" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

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
		<SCRIPT language=JavaScript src="/CDUG/javascript/photo.js"></SCRIPT>
		<SCRIPT language="JavaScript">
  			function Delete(){

				if(confirm("确定删除这些资源？")){
				return true;
				}
				else{
				return false;
				}
			}
			
 
      function   check_all(){   
        arr   =   document.getElementsByName('chkId');   
        for(i=0;i<arr.length;i++){   
              arr[i].checked   =   true;   
        }   
      }   
      function uncheck_all(){   
        arr   =   document.getElementsByName('chkId');   
        for(i=0;i<arr.length;i++){   
              arr[i].checked   =   false;   
        }   
      }   

			
</SCRIPT>
	</head>
	<jsp:useBean class="Bean.User" id="admin_session" scope="session" />
	<%
		if (admin_session.getUser_access() != 2) {
	%>
	<body onload="javascript:parent.location='/CDUG/index.jsp';"></body>
	<%
		} else {
	%>
	<body>
		<table width="1000" border="0" cellpadding="0" cellspacing="0"
			align="center">

			<a name="head_beg"></a>
			<jsp:include page="../managehead.jsp" flush="true"></jsp:include>
			<a name="head_end"></a>

			<tr bgcolor="#FFFFFF">
				<td height="15">
					<table border="0" width="100%" cellpadding="0" cellspacing="0"
						align="center">
						<tr height="100%">
							<td valign="top">
								<table border="0" width="192px" cellpadding="0" cellspacing="0"
									align="center">
									<tr>
										<td width="100%" valign="top">
											<a name="left_beg"></a>
											<jsp:include page="../manageleft.jsp" flush="true"></jsp:include>
											<a name="left_end"></a>
										</td>
									</tr>
								</table>
							</td>
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
																								style="color: rgb(255, 255, 255);">DB2资源管理</span>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<hr>
																							<br>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<a name="middle_beg"></a>

																							<form name="deleteform"
																								action="/CDUG/servlet/DeleteUploadManage" method="post"
																								onSubmit="return Delete(document.deleteform)">
																								<%
																									DAO dbctr = new DAO();
																										int cpage;
																										int maxLine = 10;
																										int pageRowCount;
																										int pageCount;
																										java.sql.ResultSet rs1 = dbctr
																												.getResultSet("select * from cdug_upload_file");
																										rs1.last();
																										pageRowCount = rs1.getRow();
																										pageCount = (int) Math.ceil(pageRowCount / maxLine) + 1;
																										String strPageNum = request.getParameter("page");//取得<href>提交的页码 
																										if (strPageNum == null) {
																											//表明在QueryString中没有page这一个参数，此时显示第一页数据 
																											cpage = 1;
																										} else {
																											cpage = java.lang.Integer.parseInt(strPageNum);//将字符串转换成整型 
																											if (cpage < 1)
																												cpage = 1;
																										}

																										if (cpage > pageCount)
																											cpage = pageCount;//调整待显示的页码 
																										java.sql.ResultSet rs = dbctr
																												.getResultSet("select * from cdug_upload_file order by uid desc limit "
																														+ (cpage - 1) * maxLine + "," + maxLine);
																										while (rs.next()) {
																											String filename = rs.getString("filename");
																											String filedes = rs.getString("filedes");
																											String username = rs.getString("username");
																											String tag = rs.getString("tag");
																											String date = rs.getString("date");
																											String uid = rs.getString("uid");
																											String url = new String();
																											url = rs.getString("url");
																											int flag = 0;
																											if(url.equals("")){
																												flag = 1;
																											}
																											//String username = rs.getString("username");
																											int n = 1;
																											if (admin_session.getUser_access() == 2) {
																												++n;
																											}
																								%>
																								<input type="checkbox" name="checkfile"
																									id="<%=n - 1%>" value="<%=uid%>">
																								<%
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
																								%>
																									<%
																									//DesEncrypt des = new DesEncrypt();
																									//des.getKey("shince");
																									%>
																									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																								<a
																									href="/CDUG/jsp/AdminManagement/updateFileInfo.jsp?filename=<%=filename%>&flag=<%=flag%>">
																									<b>修改文件信息</b></a>
																									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																								<%
																								if(url.equals("")){
																								%>
																								<a
																									href="/CDUG/jsp/AdminManagement/ReplaceFile.jsp?filename=<%=filename%>&date=<%=date%>">
																									<b>替换资源文件</b></a>
																								<%
																								}
																								%>
																								<br>
																								<br>
																								&nbsp;&nbsp;&nbsp;&nbsp;
																								<strong><label class=text><%=filedes%></label></strong>
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
																										if (admin_session.getUser_access() == 2) {
																								%>

																								<input type="hidden" id="useraccess"
																									name="useraccess"
																									value="<%=admin_session.getUser_access()%>">
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

																							<%
																								dbctr.close();
																							%>

																							<a name="middle_end"></a>
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
											<%@include file="/../jsp/right.jsp"%>
											<a name="right_end"></a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>

					<a name="foot_beg"></a>
					<%@include file="/../jsp/foot.jsp"%>
					<a name="foot_end"></a>
		</table>
	</body>
	<%
		}
	%>
</html>
