<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>


<div id="custIDList">
	<jsp:include page="CustomerName_custList.jsp"></jsp:include>
</div>

<br />
<br />
<div id="href">
	<a href="javascript:void(0);"
		onclick="sendAjax('/myTable/customer.do?method=showCreatePage&custName=${ name }', processConent2StateChange);">创建新的客户查询条件</a>
	<br />
	<a href="javascript:void(0);"
		onclick="loadCategoryManagement();">分类管理</a>
	<br /><br />
	<a href="javascript:void(0);"
		onclick="loadAssignWork();">分配工作</a>
</div>
