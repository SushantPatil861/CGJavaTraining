<%@page import="com.cg.assetmanagement.dto.Asset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE HTML>
<html>
	<head>
		<link href="${pageContext.request.contextPath}/css/add_asset.css" REL="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/css/style1.css" REL="stylesheet" type="text/css"/>
		<script src="${pageContext.request.contextPath}/js/add_asset.js" type="text/javascript"></script>
		<script type="text/javascript">
			function check(){
				document.updateform.assetType.value="<%= ((Asset)(session.getAttribute("asset"))).getAssetType()%>";
			}
		</script>
	</head>
	<body bgcolor="#dddddd" align="center" onload="check()">
	<br><br>
		<br>
		<img src="${pageContext.request.contextPath}/res/addasset.png" height="40px" width="250px"/>
		<br>
		<hr>
		<form name="updateform" action="${pageContext.request.contextPath}/UpdateAsset">
		<fieldset>
		<table align="center" cellspacing="10px" cellpadding="0px">
			<tr>
				<td>Asset Id</td>
				<td><input id="inid" type="number" name="assetId" value="${asset.assetId}" readonly="readonly"></td>
				<td>Asset Name</td>
				<td><input id="inname" type="text" name="assetName" value="${asset.assetName}" required></td>
			</tr>
			<tr>
				<td>Purchase Date</td>
				<td><input id="in" type="date" name="purchaseDate" value="${asset.purchaseDate}" required></td>
				<td>Purchase Price</td>
				<td><input id="in" type="number" name="purchasePrice" value="${asset.purchasePrice}" required></td>
			</tr>
			<tr>
				<td>Asset Type</td>
				<td><input type="radio" id="rit" name="assetType" value="it" onchange="getCatIt()">IT<input type="radio" id="rnit" name="assetType" value="nit" onchange="getCatNIt()">Non-IT</td>
				<td>Category</td>
				<td><select name="category" value="${asset.category}" id="sel">
						<option>SELECT</option>
						</select>
				</td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td><input type="number" name="quantity" value="${asset.quantity}" required></td>
				<td>Description</td>
				<td><textarea id="assetDes" name="assetDes" width="100px" height="20px" value="${asset.assetDes}" required></textarea></td>
			</tr>
		</table>
			<input id="sub" class="btn btn-1 btn-1a" type="submit" value="Modify"><input id="sub" class="btn btn-1 btn-1a" type="reset" value="RESET">
		</fieldset>
		</form>	
		<br>
		<hr>
	</body>
</html>	