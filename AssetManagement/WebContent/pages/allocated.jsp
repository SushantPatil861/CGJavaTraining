<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Allocated Asset</title>
<link href="${pageContext.request.contextPath}/css/w3.css"
	REL="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/add_asset.js"
	type="text/javascript"></script>

<style>
a:HOVER {
	background-color: silver;
	color: teal;
}
</style>
</head>
<%
	String exportToExcel = (String)request.getAttribute("exportToExcel");
	if (exportToExcel != null
			&& exportToExcel.toString().equalsIgnoreCase("YES")) {
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "inline; filename="
				+ "allocated.xls");

	}
%>
<body align="center">
	<hr>
	<div class="w3-container">
		<table class="w3-table w3-striped w3-bordered w3-border w3-card-4"
			style="font-size: small;">
			<caption class="w3-container w3-darkteal" style="font-size: x-large;">
				ALLOCATED ASSETS

				<%
				exportToExcel = (String)request.getAttribute("exportToExcel");
				if (exportToExcel == null) {
			%>
				<a class="w3-right"
					href="${pageContext.request.contextPath}/GenerateAllocatedReport"
					style="text-decoration: none; font-size: x-large;"><img alt="" src="${pageContext.request.contextPath}/res/save.png" height="35" width="35"></a>
				<%
					}
				%>
			</caption>
			<tr class="w3-teal" style="font-size: small;">
				<th>Allocation Id</th>
				<th>Request Id</th>
				<th>Asset Id</th>
				<th>Allocation Date</th>
				<th>Employee ID</th>
			</tr>
			<c:forEach items="${allocated}" var="asset">
				<tr>
					<td>${asset.allocationId}</td>
					<td>${asset.request.requestId}</td>
					<td><a href="ShowAssetInAllocated?id=${asset.asset.assetId}"
						style="text-decoration: none">${asset.asset.assetId}</a></td>
					<td>${asset.allocationDate}</td>
					<td><a
						href="ShowEmployeeInAllocated?id=${asset.employee.empNo}"
						style="text-decoration: none">${asset.employee.empNo}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<hr>
	<c:if test="${asset.assetName ne null}">
		<div id="id01" class="w3-modal w3-animate-zoom" style="display: block">
			<div class="w3-modal-content w3-card-4">
				<header class="w3-container w3-darkteal">
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="w3-closebtn">&times;</span>
					<h2>ASSET INFO</h2>
				</header>
				<table class="w3-table w3-striped w3-bordered w3-border w3-card-4"
					style="font-size: small;">

					<tr class="w3-teal" style="font-size: small;">
						<th>AssetName</th>
						<th>AssetId</th>
						<th>PurchaseDate</th>
						<th>UnitPrice</th>
						<th>AssetType</th>
						<th>Category</th>
						<th>Quantity</th>
						<th>AssetDes</th>
					</tr>
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
				</table>
			</div>
			<input type="text" id="id" style="display: none" /> <input
				type="text" id="name" style="display: none" /> <input type="date"
				id="date" style="display: none" /> <input type="text" id="price"
				style="display: none" /> <input type="text" id="type"
				style="display: none" /> <input type="text" id="cat"
				style="display: none" /> <input type="text" id="qty"
				style="display: none" /> <input type="text" id="des"
				style="display: none" />
			<footer class="w3-container w3-darkteal">
			</footer>
		</div>
	</c:if>
	<c:if test="${employee.empName ne null}">
		<div id="id02" class="w3-modal w3-animate-zoom" style="display: block">
			<div class="w3-modal-content w3-card-4">
				<header class="w3-container w3-darkteal">
					<span
						onclick="document.getElementById('id02').style.display='none'"
						class="w3-closebtn">&times;</span>
					<h2>Employee INFO</h2>
				</header>
				<table class="w3-table w3-striped w3-bordered w3-border w3-card-4"
					style="font-size: small;">

					<tr class="w3-teal" style="font-size: small;">
						<th>Employee Id</th>
						<th>Employee Name</th>
						<th>Designation</th>
						<th>Hire Date</th>
						<th>Department Name</th>
					</tr>
					<tr>
						<td>${employee.empNo}</td>
						<td>${employee.empName}</td>
						<td>${employee.designation}</td>
						<td>${employee.hireDate}</td>
						<td>${employee.department}</td>
					</tr>
				</table>
			</div>
			<footer class="w3-container w3-darkteal">
			</footer>
		</div>
	</c:if>
</body>
</html>
