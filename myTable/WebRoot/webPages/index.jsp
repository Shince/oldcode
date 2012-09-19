<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert definition="siteLayoutDef">
     <tiles:put name="title" type="string" value="Customer Table" /> 
     <tiles:put name="queryLable" value="query.jsp"/>
     <tiles:put name="tableLable" value="table.jsp"/>
</tiles:insert>
