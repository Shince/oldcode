<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<form name="createCustomerForm" action="/myTable/customer.do"
	method="GET">
	<input type="hidden" name="method" value="create" />

	�ͻ����ƣ�
	<input type="text" name="custName" size="20" maxlength="30"
		value="${ custName }" />

	<br />
	<br />



	�������ݿ��е� CustomerID:<br/>
	<select size="1" name="CustSelector" id="CustSelector">
		<logic:present name="custIDList">
			<logic:iterate id="custID" name="custIDList">
				<option value="${ custID }">
					${custID}
				</option>
			</logic:iterate>
		</logic:present>
	</select>
	<a href="javascript:void(0);" onclick="addCustID();">���</a>
	<br />
	<br />

	������ CustomerID:<br />
	<select size="6" name="CustSelected" id="CustSelected" style="width: 100px; height: 200px;">
		<logic:present name="myIDList">
			<logic:iterate id="custID" name="myIDList">
				<option value="${custID}">
					${custID}
				</option>
			</logic:iterate>
		</logic:present>
	</select>
	<br/>
	<a href="javascript:void(0);" onclick="delCustID();">ɾ��ѡ��ID</a>
	<br />
	<br />

	��ʼ����(y-m-d)��
	<input type="text" name="d_s" size="20" value="${ d_s }"
		id="begin_date_b">
	<input type="reset" name="selector" value="ѡ��"
		onclick="return showCalendar('begin_date_b', 'y-m-d');">
	<br />

	��ֹ����(y-m-d)��
	<input type="text" name="d_e" size="20" value="${ d_e }" id="end_date_b">
	<input type="reset" name="selector" value="ѡ��"
		onclick="return showCalendar('end_date_b', 'y-m-d');" id="canlendar1">
		
	<br />

	<input type="button" name="saveCust" value="����" onclick="retrieveURL('/myTable/customer.do','createCustomerForm','saving..',processStatusAndContentStateChange);" />
	
</form>

