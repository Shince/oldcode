<%@ page language="java" pageEncoding="GB2312"%>

<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<logic:present name="workerList">
	<h3>������</h3>
	<select id="workerList" size="10" onchange="wokerListChange();">
		<logic:iterate id="worker" name="workerList">
			<option value="${ worker.id }">${ worker.name }</option>
		</logic:iterate>
	</select>
	<br />
	<a href="javascript:void(0);" onclick="addWorker();">���</a>
	<a href="javascript:void(0);" onclick="delWorker();">ɾ��</a>
</logic:present>