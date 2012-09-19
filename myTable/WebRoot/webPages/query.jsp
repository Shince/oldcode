<%@ page language="java" contentType="text/html; charset=GB2312" pageEncoding="GB2312" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<div id="breadcrumbs">
	<div id="breadcrumbs_container">
		<div id="queryStatus">
			Welcome to use Customer Service..
		</div>
		<div id="queryForm">
			<form action="/myTable/query.do" method="POST" class="searchbox" name="queryForm">
				<input name="custID" class="query" onfocus="toggleSBSize(true);"
					onblur="toggleSBSize(false);" id="header-searchbox"
					value="${query}" />
				<select name="dbMenu" class="select">
					<!-- <option value="retrieve">DB2INST3.PMR_RETRIVED</option> -->
					<option value="wkly">CQDB.PMR_WKLY_HPP_UV</option>
					<option value="hist">CQDB.PMR_HPP_HIST_UV</option>
					<!-- <option value="archive">CQDB.PMR_HPP_ARCHIVE_UV</option> -->
				</select>
				<input type="button" onclick="retrieveURL('/myTable/query.do','queryForm','Loading..',processConent2StateChange);" value="提取信息" class="submit" />
				<input type="button" onclick="window.open('/myTable/genTable.do', 'Chart'); " value="生成报表" class="submit" />
			</form>
		</div>
	</div>
</div>