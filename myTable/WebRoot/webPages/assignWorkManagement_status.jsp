<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<logic:present name="pmrPerPerson">
	<h3>ƽ��״̬</h3>
	Pmr������${ totalPmr }<br />
	��������: ${ totalPerson }<br />
	�˾�Pmr: ${ pmrPerPerson }<br />
</logic:present>
