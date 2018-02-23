<%@page import="com.cg.assetmanagement.dto.Asset"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Delete Asset</title>
<link href="${pageContext.request.contextPath}/css/w3.css"
	REL="stylesheet" type="text/css" />

<script type="text/javascript">
	var assetSelected;
	function openModal(assetId) {
		document.getElementById('id').value = assetId;
		document.getElementById('id01').style.display = 'block';
	}
	function closeModal() {
		document.getElementById('id01').style.display = 'none';
	}
	function openModalForMessage(message) {
		if (message != "") {
			document.getElementById('id02').style.display = 'block';
		}
	}
</script>
</head>
<%!int index = 0;%>
<body onload="openModalForMessage('${failureMessage}')">
	<%-- <%
		ArrayList<Asset> assetList = (ArrayList<Asset>) session
				.getAttribute("assetList");
		index = 0;
	%> --%>
	<hr>
	<div class="w3-container">
		<table class="w3-table w3-striped w3-bordered w3-border w3-card-4"
			style="font-size: small;">
			<caption class="w3-darkteal" style="font-size: x-large;">ASSET
				LIST</caption>
			<tr class="w3-teal" style="font-size: small;">
				<th>AssetName</th>
				<th>AssetId</th>
				<th>PurchaseDate</th>
				<th>PurchasePrice</th>
				<th>AssetType</th>
				<th>Category</th>
				<th>Quantity</th>
				<th>AssetDes</th>
				<th>Delete</th>
				<!-- 
			<th>UpdateOld</th> -->
			</tr>
			<c:forEach items="${assetList}" var="asset">
				<tr>
					<%-- <%
						Asset asset = assetList.get(index++);
					%> --%>
					<td>${asset.assetName}</td>
					<td>${asset.assetId}</td>
					<td>${asset.purchaseDate}</td>
					<td>${asset.unitPrice}</td>
					<td>${asset.assetType}</td>
					<td>${asset.category}</td>
					<td>${asset.quantity}</td>
					<td>${asset.assetDes}</td>
					<td><button onclick="openModal(	'${asset.assetId}')"
							class="w3-border-0">
							<img alt=""
								src="${pageContext.request.contextPath}/res/delete.png"
								height="20" width="20">
						</button></td>
					<%-- 
				<td><a
					href="${pageContext.request.contextPath}/ModifyAsset?assetId=${asset.assetId}">Update</a></td> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
	<hr>
	<div id="id01" class="w3-modal w3-animate-zoom">
		<div class="w3-modal-content w3-card-4">
			<header class="w3-container w3-darkteal">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-closebtn">&times;</span>
				<h2 class="w3-center">CONFIRM DELETE</h2>
			</header>
			<div style="width: 100%; height: 100%">
				<form class="w3-container" name="updateform" action="DeleteAsset">
					<p>
						<input class="w3-input" id="id" type="hidden" name="assetId"
							value="${asset.assetId}" readonly="readonly">
					</p>
					<p class="w3-center">
						Are you sure you want to delete this asset? <input id="sub"
							class="w3-btn w3-darkteal w3-round" type="submit" value="Yes">
						<input id="sub" class="w3-btn w3-darkteal w3-round" type="button"
							value="No" onclick="closeModal()">
					</p>
				</form>
			</div>
			<input type="text" id="id" style="display: none" /> <input
				type="text" id="name" style="display: none" /> <input type="date"
				id="date" style="display: none" /> <input type="text" id="price"
				style="display: none" /> <input type="text" id="type"
				style="display: none" /> <input type="text" id="cat"
				style="display: none" /> <input type="text" id="qty"
				style="display: none" /> <input type="text" id="des"
				style="display: none" />
			<footer class="w3-container w3-darkteal"> </footer>
		</div>
	</div>
	<div id="id02" class="w3-modal w3-animate-zoom">
		<div class="w3-modal-content w3-card-4">
			<header class="w3-container w3-darkteal">
				<span onclick="document.getElementById('id02').style.display='none'"
					class="w3-closebtn">&times;</span>
				<h2 class="w3-center">ERROR</h2>
			</header>
			<div style="width: 100%; height: 100%">
				<form class="w3-container" name="updateform" action="DeleteAsset">
					<p class="w3-center">${failureMessage}</p>
				</form>
			</div>
			<input type="text" id="id" style="display: none" /> <input
				type="text" id="name" style="display: none" /> <input type="date"
				id="date" style="display: none" /> <input type="text" id="price"
				style="display: none" /> <input type="text" id="type"
				style="display: none" /> <input type="text" id="cat"
				style="display: none" /> <input type="text" id="qty"
				style="display: none" /> <input type="text" id="des"
				style="display: none" />
			<footer class="w3-container w3-darkteal"> </footer>
		</div>
	</div>
</body>

</html>
