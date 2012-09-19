<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<logic:present name="custNameList">
	<h3>客户列表</h3>
	<select size="10" id="custNameList" onchange="custNameListChange();">
		<logic:iterate id="cust" name="custNameList">
			<option value="${ cust.name }">${ cust.name }</option>
		</logic:iterate>
	</select>
</logic:present>
