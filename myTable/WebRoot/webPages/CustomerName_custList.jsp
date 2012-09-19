<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>


请选择客户进行查询：
<br />
<logic:present name="custNameList">
	<ul>
		<logic:iterate id="cust" name="custNameList">
			<li>
				<a href="javascript:void(0);" onclick="sendAjax('/myTable/customer.do?method=view&custName=${ cust.name }', processConent2StateChangeWithClickable);">${ cust.name }</a>
				<a href="javascript:void(0);"
					onclick="sendAjax('/myTable/customer.do?method=edit&custName=${ cust.name }', processConent2StateChange);"><img border="0" src="../images/editicon.gif" alt="编辑">
				</a>
				<a href="javascript:void(0);"
					onclick="sendAjax('/myTable/customer.do?method=del&custName=${ cust.name }', processContentStateChange);"><img src="../images/delete.gif" border="0" alt="删除">
				</a>
			</li>
			<br />
			<div >
				<script type="text/javascript">
					
				</script>
			</div>
		</logic:iterate>
	</ul>
</logic:present>