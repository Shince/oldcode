<%@ page language="java" pageEncoding="GB2312" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<logic:present name="mainCategory">
<h3>主分类</h3>
<select id="mainCate" name="mainCate" size="6" onchange="onMainSelectChange();">
	<logic:iterate id="c" name="mainCategory">
		<option value="${ c.key }">${ c.value }</option>
	</logic:iterate>
</select>
<br />
<a href="javascript:void(0);" onclick="addCategory();">添加</a> <a href="javascript:void(0);" onclick="delCategory();">删除</a> <a href="javascript:void(0);" onclick="updateMainCategory();">修改</a><br />
</logic:present>