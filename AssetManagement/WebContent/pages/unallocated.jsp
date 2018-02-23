<%@page import="java.util.List"%>
<%@page import="javax.json.Json"%>
<%@page import="java.util.ArrayList"%><%@page import="com.cg.assetmanagement.dto.Asset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Add Asset</title>
<link href="${pageContext.request.contextPath}/css/w3.css"
	REL="stylesheet" type="text/css" />
	
    <style>
    	a:HOVER {
	background-color: silver;
	color:teal;
}
    </style>
</head>
<%
        String exportToExcel = (String)request.getAttribute("exportToExcel");
        if (exportToExcel != null
                && exportToExcel.toString().equalsIgnoreCase("YES")) {
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="
                    + "unallocated.xls");
 
        }
%>
<body align="center">
	<hr>
	<div class="w3-container">
	<table class="w3-table w3-striped w3-bordered w3-border w3-card-4" style="font-size: small;">
	<caption class="w3-container w3-darkteal" style="font-size:x-large;">UNALLOCATED ASSETS
	
	<%
	exportToExcel = (String)request.getAttribute("exportToExcel");
        if (exportToExcel == null) {
    %>
	<a class="w3-right" href="${pageContext.request.contextPath}/GenerateUnallocatedReport" style="text-decoration:none;font-size:x-large;"><img alt="" src="${pageContext.request.contextPath}/res/save.png" height="35" width="35"></a>
	<%
        }
    %>
	</caption>
		<tr class="w3-teal" bgcolor="yellow" style="font-size: small;">
			<th>AssetName</th>
			<th>AssetId</th>
			<th>PurchaseDate</th>
			<th>UnitPrice</th>
			<th>AssetType</th>
			<th>Category</th>
			<th>Quantity</th>
			<th>AssetDes</th>
		</tr>
		<c:forEach items="${unallocated}" var="asset">
			<tr>
				<td>${asset.assetName}</td>
				<td>${asset.assetId}</td>
				<td>${asset.purchaseDate}</td>
				<td>${asset.unitPrice}</td>
				<td>${asset.assetType}</td>
				<td>${asset.category}</td>
				<td>${asset.quantity}</td>
				<td>${asset.assetDes}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<hr>
</body>
</html>
