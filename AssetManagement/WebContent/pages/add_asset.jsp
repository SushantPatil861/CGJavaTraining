<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Add Asset</title>
<link href="${pageContext.request.contextPath}/css/w3.css"
	REL="stylesheet" type="text/css" />
<script type="text/javascript">
		function openModal(assetId) {
			if(assetId == null){
				document.getElementById('id01').style.display = 'none';
			}else{
				document.getElementById('id01').style.display = 'block';
			}
			
		}
		function closeModal() {
				document.getElementById('id01').style.display = 'none';
		}
		</script>
</head>
<body onLoad="openModal(${assetId})">
	<div class="w3-container"
		style="padding: 5%; padding-left: 10%; padding-right: 10%">
		<div class="w3-card-12 w3-round-large">
			<div class="w3-container w3-darkteal w3-center w3-upper-round-large">
				<h2>ADD ASSET</h2>
			</div>
			<f:form cssClass="w3-container" modelAttribute="addAsset"
				action="AddNewAsset" method="POST">
				<font class="w3-error">All Fields Are Mandatory</font>
				<br>
				<p>
					<label class="w3-label w3-validate">Asset Name</label>
					<f:errors path="assetName" cssClass="w3-right w3-error"></f:errors>
					<f:input cssClass="w3-input" path="assetName" id="name" type="text"
						pattern="[A-Za-z0-9]+[\sA-Za-z0-9]*" required="required"></f:input>
				</p>
				<p>
					<label class="w3-label w3-validate">Purchase Date</label>
					<f:errors path="purchaseDate" cssClass="w3-right w3-error"></f:errors>
					<f:input cssClass="w3-input" id="date" type="date"
						path="purchaseDate" max="<%=LocalDate.now()%>" required="required"></f:input>
				</p>
				<p>
					<label class="w3-label w3-validate">Purchase Price</label>
					<f:errors path="unitPrice" cssClass="w3-right w3-error"></f:errors>
					<f:input cssClass="w3-input" id="price" path="unitPrice" min="1" required="required"></f:input>
				</p>
				<p>
					<label class="w3-label w3-validate">Asset Type</label>
					<f:errors path="assetType" cssClass="w3-right w3-error"></f:errors>
				<table class="w3-table">
					<tr>
						<td><f:radiobutton cssClass="w3-radio" path="assetType"
								value="IT" required="required"/><label>IT</label> </td>
						<td><f:radiobutton cssClass="w3-radio" path="assetType"
								value="NonIT" required="required"/><label>Non-IT</label> </td>
					</tr>
				</table>
				</p>
				<p>
					<label class="w3-label w3-validate">Category</label>
					<f:errors path="category" cssClass="w3-right w3-error"></f:errors>
					<f:input cssClass="w3-input" id="sel" type="text" path="category"
						pattern="[A-Za-z]+[\sA-Za-z]*" required="required"></f:input>
				</p>
				<p>
					<label class="w3-label w3-validate">Quantity</label>
					<f:errors path="quantity" cssClass="w3-right w3-error"></f:errors>
					<f:input cssClass="w3-input" type="number" id="qty" path="quantity" min="1" required="required"/>
				</p>
				<p>
					<label class="w3-label w3-validate">Description</label>
					<f:errors path="assetDes" cssClass="w3-right w3-error"></f:errors>
					<f:textarea cssClass="w3-input" id="des" path="assetDes"
						width="100px" height="20px" required="required"></f:textarea>
				</p>
				<p class="w3-center">
				<table class="w3-table">
					<tr>
						<th class="w3-center"><input id="sub"
							class="w3-btn w3-darkteal w3-round" type="submit"
							value="Add Asset"></th>
						<th class="w3-center"><input id="sub"
							class="w3-btn w3-darkteal w3-round" type="reset"
							value="Reset Data"></th>
					</tr>
				</table>
				</p>
			</f:form>
		</div>
	</div>
	<div id="id01" class="w3-modal w3-animate-zoom">
		<div class="w3-modal-content w3-card-4">
			<header class="w3-container w3-darkteal">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-closebtn">&times;</span>
				<h2 class="w3-center">ASSET ADDED</h2>
			</header>
			<div style="width: 100%; height: 100%">
				<form class="w3-container" name="updateform"
					action="${pageContext.request.contextPath}/DeleteAsset">
					<p>
						<input class="w3-input" id="id" type="hidden" name="assetId"
							value="${asset.assetId}" readonly="readonly">
					</p>
					<p class="w3-center">
						Insertion Successful with ID: ${assetId}<br />
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
	<br>
	<hr>
</body>
</html>
