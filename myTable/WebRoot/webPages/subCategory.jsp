<%@ page language="java" pageEncoding="GB2312" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<logic:present name="subCategory">
<h3>�ӷ���</h3>
<select id="subCate" name="subCate" size="6">
	<logic:iterate id="c" name="subCategory">
		<option value="${ c.key }">${ c.value }</option>
	</logic:iterate>
</select>
<br />
<a href="javascript:void(0);" onclick="addSubCategory();">���</a> <a href="javascript:void(0);" onclick="delSubCategory();">ɾ��</a> <a href="javascript:void(0);" onclick="updateSubCategory();">�޸�</a> <br />
</logic:present>
