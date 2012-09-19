<%@ page language="java"  pageEncoding="GB2312"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Iterator" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My Data Table</title>
	<link rel="stylesheet" type="text/css" href="./style/styles.css">
  </head>
  
  <body>
	<h1>Total Chart</h1>
	<img src="../myTable/genChart.do?name=totalMap" />
	
	<logic:present name="priMap">
		<h1>Problem By Priority:</h1>
		
		<table>
			<thead>
				<tr>
					<th>Priority</th>
					<logic:present name="totalMap" >
						<logic:iterate id="sub" name="totalMap">
							<th>${ sub.key }</th>
						</logic:iterate>
					</logic:present>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
			<logic:iterate id="perPri" name="priMap">
				<tr>
					<td>${ perPri.key }</td>
					<logic:iterate id="sub" name="perPri" property="value">
						<td>${ sub.value }</td>
					</logic:iterate>
					<td>
					<% 
					  	  TreeMap map = (TreeMap)((Entry)perPri).getValue();
					  	  int count = 0;
					  	  for(Iterator iter = map.keySet().iterator(); iter.hasNext(); ){
					  	  		Integer i = (Integer)map.get( iter.next() );
					  	  		count += i.intValue();
					  	  }
					  	  out.print( count );
					%>
					</td>
				</tr>
			</logic:iterate>
			</tbody>
		</table>
		
		<logic:iterate id="perPri" name="priMap">
		<h2>${ perPri.key }:</h2>
		<table>
			<thead>
				<tr>
					<logic:iterate id="sub" name="perPri" property="value">
						<th>${ sub.key }</th>
					</logic:iterate>
				</tr>
			</thead>
			<tbody>
					<tr>
						<logic:iterate id="sub" name="perPri" property="value">
						<td>${ sub.value }</td>
						</logic:iterate>
					</tr>
			</tbody>
		</table>
		<img src="../myTable/genChart.do?name=${ perPri.key }&chartName=${ perPri.key } Chart" />
		</logic:iterate>
		<br />
	</logic:present>
	
	<logic:present name="yearMap">
	
		<h1>Problem By Year:</h1>
		
		<table>
			<thead>
				<tr>
					<th>Year</th>
					<logic:present name="totalMap" >
						<logic:iterate id="sub" name="totalMap">
							<th>${ sub.key }</th>
						</logic:iterate>
					</logic:present>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
			<logic:iterate id="perYear" name="yearMap">
				<tr>
					<td>${ perYear.key }</td>
					<logic:iterate id="sub" name="perYear" property="value">
						<td>${ sub.value }</td>
					</logic:iterate>
					<td>
					<% 
					  	  TreeMap map = (TreeMap)((Entry)perYear).getValue();
					  	  int count = 0;
					  	  for(Iterator iter = map.keySet().iterator(); iter.hasNext(); ){
					  	  		Integer i = (Integer)map.get( iter.next() );
					  	  		count += i.intValue();
					  	  }
					  	  out.print( count );
					%>
					</td>
				</tr>
			</logic:iterate>
			</tbody>
		</table>
		
		<logic:iterate id="perYear" name="yearMap">
		<h2>${ perYear.key }:</h2>
		<table>
			<thead>
				<tr>
					<logic:iterate id="sub" name="perYear" property="value">
						<th>${ sub.key }</th>
					</logic:iterate>
				</tr>
			</thead>
			<tbody>
					<tr>
						<logic:iterate id="sub" name="perYear" property="value">
						<td>${ sub.value }</td>
						</logic:iterate>
					</tr>
			</tbody>
		</table>
		<img src="../myTable/genChart.do?name=${ perYear.key }&chartName=${ perYear.key } Chart" />
		</logic:iterate>
		<br />
	</logic:present>
	
	<logic:present name="subMap">
		<logic:iterate id="subcategory" name="subMap">
			<h1>${ subcategory.key }</h1>
			
			<table>
				<thead>
					<tr>
						<logic:iterate id="sub" name="subcategory" property="value">
						<th>${ sub.key }</th>
						</logic:iterate>
					</tr>
				</thead>
				<tbody>
					<tr>
						<logic:iterate id="sub" name="subcategory" property="value">
						<td>${ sub.value }</td>
						</logic:iterate>
					</tr>
				</tbody>
			</table>
			<img src="../myTable/genChart.do?name=${ subcategory.key }&chartName=${ subcategory.key } Chart" />
			
		</logic:iterate>
	</logic:present>
	
  </body>
</html>
