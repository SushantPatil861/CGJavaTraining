<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cg.assetmanagement.dto.Asset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Modify Asset</title>
<link href="${pageContext.request.contextPath}/css/w3.css"
	REL="stylesheet" type="text/css" />

<script src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	var showErr=1;
	var assetSelected;
	function openModal(assetId, assetName, purchaseDate, unitPrice, assetType,
			category, quantity, assetDes) {
		document.getElementById('id').value = assetId;
		document.getElementById('name').value = assetName;
		document.getElementById('date').value = purchaseDate;
		document.getElementById('price').value = unitPrice;
		document.getElementById(assetType).checked = true;
		document.getElementById('cat').value = category;
		document.getElementById('qty').value = quantity;
		document.getElementById('des').value = assetDes;
		document.getElementById('id01').style.display = 'block';
		if(showErr == '0'){
			$('#error1').hide();
			$('#error2').hide();
			$('#error3').hide();
			$('#error4').hide();
			$('#error5').hide();
			$('#error6').hide();
			$('#error7').hide();
		}
	}
	function openStatusModal(updateStatus) {
		if (updateStatus == '1') {
			document.getElementById('id02').style.display = 'block';
		} else {
			document.getElementById('id02').style.display = 'none';
			if(updateStatus == '2') {
				document.getElementById('id01').style.display = 'block';
			}
		}

	}
	function closeModal() {
		document.getElementById('id02').style.display = 'none';
	}
	
	function closeStatusModal() {
		document.getElementById('id01').style.display = 'none';
		showErr=0;
	}
</script>
</head>
<%!int index = 0;%>
<body onload="openStatusModal('${updateStatus}')">
	<%-- 	<%
		ArrayList<Asset> assetList=(ArrayList<Asset>)session.getAttribute("assetList"); 
		index=0;
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
				<th>Update</th>
				<!-- 
			<th>UpdateOld</th> -->
			</tr>
			<c:forEach items="${assetList}" var="asset">
				<tr>
					<%-- <%
					Asset asset=assetList.get(index++);
				%> --%>
					<td>${asset.assetName}</td>
					<td>${asset.assetId}</td>
					<td>${asset.purchaseDate}</td>
					<td>${asset.unitPrice}</td>
					<td>${asset.assetType}</td>
					<td>${asset.category}</td>
					<td>${asset.quantity}</td>
					<td>${asset.assetDes}</td>
					<td><button
							onclick="openModal(	'${asset.assetId}',
												'${asset.assetName}',
												'${asset.purchaseDate}',
												'${asset.unitPrice}',
												'${asset.assetType}',
												'${asset.category}',
												'${asset.quantity}',
												'${asset.assetDes}')">update</button></td>
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
				<span onclick="closeStatusModal()"
					class="w3-closebtn">&times;</span>
				<h2>UPDATE ASSET</h2>
			</header>
			<div style="width: 100%; height: 100%">
				<f:form cssClass="w3-container" action="modifyAsset"
					modelAttribute="modAsset" method="POST">
					<font class="w3-error">All Fields Are Mandatory</font>
					<br>
					<p>
						<label class="w3-label w3-validate">AssetID</label>
						<f:input cssClass="w3-input" path="assetId" id="id" type="number"
							name="assetId" value="${asset.assetId}" readonly="true" />
					</p>
					<p>
						<label class="w3-label w3-validate">Asset Name</label>
						<f:errors path="assetName" cssClass="w3-right w3-error" id="error1"></f:errors>
						<f:input cssClass="w3-input" path="assetName" id="name"
							type="text" name="assetName" value="${asset.assetName}" pattern="[A-Za-z0-9]+[\sA-Za-z0-9]*" required="required"/>
					</p>
					<p>
						<label class="w3-label w3-validate">Purchase Date</label>
						<f:errors path="purchaseDate" cssClass="w3-right w3-error" id="error2"></f:errors>
						<f:input cssClass="w3-input" path="purchaseDate" id="date"
							type="date" name="purchaseDate" max="<%=LocalDate.now()%>"
							value="${asset.purchaseDate}" required="required" />
					</p>
					<p>
						<label class="w3-label w3-validate">Purchase Price</label>
						<f:errors path="unitPrice" cssClass="w3-right w3-error" id="error3"></f:errors>
						<f:input cssClass="w3-input" path="unitPrice" id="price"
							name="unitPrice" value="${asset.unitPrice}"required="required" />
					</p>
					<p>
						<label class="w3-label w3-validate">Asset Type</label>
						<f:errors path="assetType" cssClass="w3-right w3-error" id="error4"></f:errors>
					<table class="w3-table">
						<tr>
							<td><f:radiobutton cssClass="w3-radio" path="assetType"
									id="IT" name="assetType" value="IT" required="required" /><label
								class="w3-validate">IT</label></td>
							<td><f:radiobutton cssClass="w3-radio" path="assetType"
									id="NonIT" name="assetType" value="NonIT"required="required" /><label
								class="w3-validate">Non-IT</label></td>
						</tr>
					</table>
					</p>
					<p>
						<label class="w3-label w3-validate">Category</label>
						<f:errors path="category" cssClass="w3-right w3-error" id="error5"></f:errors>
						<f:input cssClass="w3-input" path="category" name="category"
							value="${asset.category}" pattern="[A-Za-z]+[\sA-Za-z]*" id="cat"
							required="required" />
					</p>
					<p>
						<label class="w3-label w3-validate">Quantity</label>
						<f:errors path="quantity" cssClass="w3-right w3-error" id="error6"></f:errors>
						<f:input cssClass="w3-input" path="quantity" type="number"
							id="qty" name="quantity" min="1" value="${asset.quantity}"
							required="required" />
					</p>
					<p>
						<label class="w3-label w3-validate">Description</label>
						<f:errors path="assetDes" cssClass="w3-right w3-error" id="error7"></f:errors>
						<f:textarea cssClass="w3-input" path="assetDes" id="des"
							name="assetDes" width="100px" height="20px"
							value="${asset.assetDes}" required="required" />
					</p>
					<p class="w3-center">
						<input id="sub" class="w3-btn w3-darkteal w3-round" type="submit"
							value="Modify">
					</p>
				</f:form>
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
				<h2 class="w3-center">ASSET MODIFIED</h2>
			</header>
			<div style="width: 100%; height: 100%">
				<form class="w3-container" name="updateform"
					action="${pageContext.request.contextPath}/DeleteAsset">
					<p>
						<input class="w3-input" id="id" type="hidden" name="assetId"
							value="${asset.assetId}" readonly="readonly">
					</p>
					<p class="w3-center">
						Updated Successfully<br />
						<br /> <input id="sub" class="w3-btn w3-darkteal w3-round"
							type="button" value="Ok" onclick="closeModal()" />
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
</body>

</html>
