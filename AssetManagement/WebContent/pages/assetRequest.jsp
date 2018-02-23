<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Raise Asset Request</title>
<link href="${pageContext.request.contextPath}/css/w3.css"
	REL="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/add_asset.js"
	type="text/javascript"></script>
<script>
	function setDescription(stringToSplit, separator) {

		var arrayOfStrings = stringToSplit.split(separator);
		if(arrayOfStrings[0]!=""){
		document.getElementById('des').innerHTML = arrayOfStrings[1];
		}
		else{
			document.getElementById('des').innerHTML = null;
		}
	}
	function openModal(requestId) {
		if(requestId == ""){
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
<body onload="openModal('${requestId}')">
<%!int i=0; %>
	<div class="w3-container"
		style="padding: 5%; padding-left: 10%; padding-right: 10%">
		<div class="w3-card-12 w3-round-large">
			<div class="w3-container w3-darkteal w3-center w3-upper-round-large">
				<h2>RAISE REQUEST</h2>
			</div>
			<form class="w3-container" name="myform"
				action="raiseRequest" method="post">
				<p>
					<label class="w3-label w3-validate">Asset</label>
					<select  name="assetId" id="assetId" class="w3-input" onChange="setDescription(this.value,'<assetDescription>')" required="required">
						<option value="" disabled="disabled">Please Select</option>
						<c:forEach items="${assetList}" var="asset">
							<%i++; %>
							<option value="${asset.assetId}<assetDescription>${asset.assetDes}">${asset.assetId}-${asset.assetName}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label class="w3-label w3-validate">Asset Description</label>
					<textarea class="w3-input" id="des" name="assetDes" width="100px"
						height="20px" value="" readonly="readonly"></textarea>
				</p>
				<p>
					<label class="w3-label w3-validate">Employee</label> <select
						name="employeeId" class="w3-input" required="required">
						<option disabled="disabled" value="" >Please Select</option>
						<c:forEach items="${empList}" var="emp">
							<option value="${emp.empNo}">${emp.empNo}-${emp.empName}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label class="w3-label w3-validate">Requirement</label>
					<textarea class="w3-input" id="req" name="requirement"
						width="100px" height="20px" required></textarea>
				</p>
				<p class="w3-center">
				<table class="w3-table">
					<tr>
						<th class="w3-center"><input id="sub"
							class="w3-btn w3-darkteal w3-round" type="submit"
							value="Raise Request"></th>
						<th class="w3-center"><input id="sub"
							class="w3-btn w3-darkteal w3-round" type="reset"
							value="Reset Data"></th>
					</tr>
				</table>
				</p>
			</form>
		</div>
	</div>
	<div id="id01" class="w3-modal w3-animate-zoom">
		<div class="w3-modal-content w3-card-4">
			<header class="w3-container w3-darkteal">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-closebtn">&times;</span>
				<h2 class="w3-center">REQUEST RAISED</h2>
			</header>
			<div style="width: 100%; height: 100%">
				<form class="w3-container" name="updateform"
					action="">
					<p>
						<input class="w3-input" id="id" type="hidden" name="assetId"
							value="${asset.assetId}" readonly="readonly">
					</p>
					<p class="w3-center">
				Request Successfully Raised with ID: ${requestId}<br/><br/>
					<input id="sub"
							class="w3-btn w3-darkteal w3-round" type="button" value="Ok"
							onclick="closeModal()"/>
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
			<footer class="w3-container w3-darkteal">
			</footer>
		</div>
	</div>
	<br>
	<hr>
</body>
</html>
