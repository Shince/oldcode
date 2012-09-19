<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
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
		<link href="/CDUG/css/idug_style_11.css" rel="styleSheet" type="text/css">
		<SCRIPT language="JavaScript">
		function PicUpload(){
			if(document.picUploadForm.pic.value == "")
			{
				alert("请选择上传文件路径！");
				return false;
			}
			else{
				var fname = document.picUploadForm.pic.value.toUpperCase();
				var username = document.picUploadForm.username.value;
				var useraccess = document.picUploadForm.useraccess.value;
				document.picUploadForm.action='/CDUG/servlet/PicUpload?&fname='+fname+'&username='+username+'&useraccess='+useraccess;
				return true;
				}
			}
		</SCRIPT>
</head>
<body >
	<jsp:useBean class="Bean.User" id="user_session" scope="session" />
	<%
	if(!SessionListener.isOnline(session)){
		session.invalidate();
	}
	%>
	<%if(!(user_session.getUser_access()==1 || user_session.getUser_access()==2))
	{ %>
		<script type="text/javascript">
		javascript:parent.location='/CDUG/index.jsp';
		</script>
	<%} 
	else{
	%>
<table border="0" width="100%" height="100%" align="center" cellpadding="0" cellspacing="5">
  <tr bgcolor="#FFFFFF">
    <td>
      <table width="100%" height="100%" cellpadding="0" cellspacing="0" align="center">
        <tr height="100%">
			<td width="100%" valign="top" class="wpsPortletBorder" style="padding:5px;" dir="ltr" >          
  <table width=100% cellpadding=0 cellspacing=0 border=0 >
    <tr>
     <td valign="top"> 
      <table>
<tr><td WIDTH="625">
<hr>
</td></tr>
<tr><td width="100%" style="background-color: rgb(51, 51, 153);">
  <span class="title" style="color: rgb(255, 255, 255);">
	附件上传
  </span>
</td></tr>
<tr><td>
<hr>
</td></tr>
<tr><td>
	<form name="picUploadForm" action="/CDUG/servlet/PicUpload" method="POST" enctype="multipart/form-data" onsubmit="return PicUpload()">
	相关附件上传:<br><br>
	<input type="file" name="pic" id="pic"><br><br>
	<input class="wpsButtonText" style="cursor:hand; width: 95" type=submit name=picsubmit id=picsubmit value="上传"/>
	<input class="wpsButtonText" style="cursor:hand; width: 95" type="reset" />
	<input type="hidden" id="username" name="username" value="<%=user_session.getUser_id()%>">
	<input type="hidden" id="useraccess" name="useraccess" value="<%=user_session.getUser_access()%>">	
	<br>
	</form>
</td></tr>
<tr><td>
  <HR style="BACKGROUND-COLOR: #333399" color=#000099 noShade SIZE=2>
    <a href='javascript:window.close()'>
    <img src='/CDUG/backbtn.gif' border=0 align=right>
  </a>
</td></tr>
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