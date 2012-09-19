<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	Date ndate = new Date();
	SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String time = s.format(ndate);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>无标题文档</title>
</head>

<script>
function gotoPage(option){
	switch(option){
		case 1:
			eval("parent.mainFrame.location='inputMain.jsp'");
			break;
		default:break;
	}
}
</script>

<body topmargin="0" leftmargin="0" rightmargin="0">
<form name="myForm" method="post" action="">
<table width='100%' height='79' border='0' cellpadding='0' cellspacing='0' align=center>
  <tr>
    <td  bgcolor='F9A859' valign='top'>
        <table width='100%' height='50' border='0' align='center' cellpadding='0' cellspacing='0' bgcolor='FBEAD0'>
          <tr
          onMouseOver="this.style.cursor='hand',this.style.color='red'"
		onMouseOut="this.style.color='#000000'" onClick="gotoPage(1)">
            <td align='center' style="font-size:22px;"><strong>在线学生课程管理系统</strong></td>
          </tr>
         </table>
     </td>
  </tr>
  <tr>
     <td  bgcolor='F9A859' valign='top'>
      	 <table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'>
          <tr>
            <td align='center' style='font-size:13px' valign='middle'><%=time%><br>
            </td>
          </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td align='center'><img src="image/bottom.gif" width="100%" height="2"></td>
  </tr>
</table>
</form>
</body>
</html>