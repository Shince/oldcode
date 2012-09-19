<%@ page language="java" pageEncoding="GB2312" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ page import="com.ibm.cn.db2.mytable.util.PageUtil"%>
<%@page import="com.ibm.cn.db2.mytable.util.Util"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.ibm.cn.db2.mytable.db.CategoryDAO"%>

<%
	TreeMap categories = CategoryDAO.getInstance().getMainCategory();
 %>
<logic:present name="custData">
	<table cellpadding="0" cellspacing="0" border="1" class="stripe">
		<thead>
			<tr>
				<th class="sortable" onclick="sortTable('PROB_CUST_ACCT_#');">
					Cust ID
				</th>
				<th class="sortable" onclick="sortTable('PROB_#');">
					PMR ID
				</th>
				<th class="sortable" onclick="sortTable('PROB_CUR_SEV_CD');">
					P
				</th>
				<th class="sortable" onclick="sortTable('PMR_OPEN_DT');">
					Open
				</th>
				<th class="sortable" onclick="sortTable('PROB_CLOSED_DT');">
					Close
				</th>
				<th>
					Dur
				</th>
				<th>
					Ver
				</th>
				<th>
					Problem
				</th>
				<th>
					Sub
				</th>
				<th>
					Comment
				</th>
				<th>
					V
				</th>
			</tr>
		</thead>
		<tbody>
			<logic:iterate id="cust" name="custData">
				<tr valign="middle">
					<td style="font-size: 10px;width: 70px;">
						${cust.id}
					</td>
					<td style="font-size: 10px;width: 100px;">
						<a href="https://servweb.torolab.ibm.com/service/PMR/PmrRecord? &pmrno=${cust.pID }&bno=${cust.pBranch }&cno=${cust.pCentry }&cdate=${cust.data }" target="_blank">${cust.pmrID}</a>
					</td>
					<td style="font-size: 10px;">
						<p>${cust.PROB_CUR_SEV_CD}</p>
					</td>
					<td style="font-size: 10px;width: 70px;">
						${cust.PMR_OPEN_DT}
					</td>
					<td style="font-size: 10px;width: 70px;">
						${cust.PROB_CLOSED_DT}
					</td>
					<td style="font-size: 10px;width: 40px;">
						${cust.dur}
					</td>
					<td style="font-size: 10px;width: 40px;">
						<div id="ver_${cust.pmrID}" class="ver">
							<logic:present name="cust" property="db_ver">
								${ cust.db_ver }
							</logic:present>
							<logic:notPresent name="cust" property="db_ver">
								select
							</logic:notPresent>
						</div>
					</td>
					<td style="font-size: 10px;width: 80px;">
						<%=Util.genCategory((HashMap)cust, categories) %>
					</td>
					<td style="font-size: 10px;width: 120px;">
						<div id="${cust.pmrID}">
							<%=Util.genSubCategory((HashMap)cust) %>
						</div>
					</td>
					<td style="font-size: 10px;width: 200px;text-overflow: ellipsis;">
						<input type="hidden" value="${cust.pmrID }" />
						<logic:equal value="" name="cust" property="mycomment">
							<p>Click to Add</p>
						</logic:equal>
						<logic:notEqual value="" name="cust" property="mycomment">
							<p>${ cust.mycomment }</p>
						</logic:notEqual>
					</td>
					<td style="width: 20px;">
						<logic:equal value="0" name="cust" property="visible">
							<input type="checkbox" name="visible" onclick="updatePMR('${cust.pmrID}','visible','1');"/>	
						</logic:equal>
						<logic:equal value="1"  name="cust" property="visible">
							<input type="checkbox" name="visible" checked onclick="updatePMR('${cust.pmrID}','visible','0');" />	
						</logic:equal>
					</td>
				</tr>
			</logic:iterate>
		</tbody>
	</table>
	<div class="pageIndex">
		<%
			if (session.getAttribute("db").toString().compareTo("retrieve") == 0) {
					Integer count = (Integer) session.getAttribute("totalCount");
					//System.out.println( "Total result:" + count );
					
					Integer curPage = (Integer) session.getAttribute("page");
					//System.out.println( "Current page:" + curPage );
					
					String query = (String) session.getAttribute("query");
					//System.out.println( "Queried id:" + query );
					
					String pageIndex = PageUtil.BuildPager(count.intValue(), PageUtil.PAGESIZE, curPage.intValue(), query);
					//System.out.println( "Page index:" + pageIndex );
					
					out.print( pageIndex );
			}
		%>
	</div>
	<div id="someMenu">
		show Visible only?
		<logic:present name="visible" scope="session">
			<logic:equal value="true" name="visible" >
				<input type="checkbox" name="showVisibleBox" id="showVisibleBox" onclick="showVisible('${query }');" checked/>
			</logic:equal>
			<logic:equal value="false" name="visible" >
				<input type="checkbox" name="showVisibleBox" id="showVisibleBox" onclick="showVisible('${query }');" />
				<a href="javascript:void(0);" onclick="selectAll();">全选</a>,<a href="javascript:void(0);" onclick="deSelectAll();">不全选</a>
			</logic:equal>
		</logic:present>
		<logic:notPresent  name="visible" scope="session">
			'Visible' not exist
		</logic:notPresent>
	</div>
</logic:present>
<logic:notPresent name="custData">
	<div id="errors">
		<html:errors />
	</div>
		Welcome to use!
</logic:notPresent>