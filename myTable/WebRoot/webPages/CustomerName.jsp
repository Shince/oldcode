<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>


<div id="custIDList">
	<jsp:include page="CustomerName_custList.jsp"></jsp:include>
</div>

<br />
<br />
<div id="href">
	<a href="javascript:void(0);"
		onclick="sendAjax('/myTable/customer.do?method=showCreatePage&custName=${ name }', processConent2StateChange);">�����µĿͻ���ѯ����</a>
	<br />
	<a href="javascript:void(0);"
		onclick="loadCategoryManagement();">�������</a>
	<br /><br />
	<a href="javascript:void(0);"
		onclick="loadAssignWork();">���乤��</a>
</div>
