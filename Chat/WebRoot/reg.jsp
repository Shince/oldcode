<%@ page contentType="text/html;charset=GBK" errorPage="error.jsp"%>

<table width="540" border="1" align="center" bgcolor="#dddddd">
<tr>
<td align = "center">
<FORM id="regForm" METHOD=POST ACTION="reg.do">
<font color="red">
${requestScope.tip}
</font>
<hr>
<TABLE>
<TR>
	<TD colspan="2" align="center">
		�������û������������ע��
	</TD>
</TR>
<TR height="10">
	<TD>
	</TD>
</TR>
<TR>
	<TD>�û�����</TD>
	<TD><INPUT id="name" TYPE="text" NAME="name"></TD>
</TR>
<TR>
	<TD>��&nbsp;&nbsp;�룺</TD>
	<TD><INPUT id="pass" TYPE="password" NAME="pass"></TD>
</TR>
<TR>
	<TD colspan="2" align="center">
		<INPUT TYPE="submit" value="�ύ">
		<INPUT TYPE="reset" value="����">
	</TD>
</TR>
</TABLE>
<br>
<div align="center">
<a href="index.jsp">��½</a>
</div>
</FORM>
</td>
</tr>
</table>
<script>
	function check()
	{
		var name = document.getElementById("name");
		var pass = document.getElementById("pass");
		var errStr = "";
		if (name.value == "" || name.value == null)
		{
			errStr += "�û�������Ϊ��\n";
		}
		if (pass.value == "" || pass.value == null)
		{
			errStr += "���벻��Ϊ��\n";
		}
		if (errStr == "" || errStr == null)
		{
			return true;
		}
		alert(errStr);
		return false;
	}
	document.getElementById("regForm").onsubmit = check;

</script>