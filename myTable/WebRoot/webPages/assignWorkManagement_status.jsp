<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<logic:present name="pmrPerPerson">
	<h3>平均状态</h3>
	Pmr总数：${ totalPmr }<br />
	参与人数: ${ totalPerson }<br />
	人均Pmr: ${ pmrPerPerson }<br />
</logic:present>
