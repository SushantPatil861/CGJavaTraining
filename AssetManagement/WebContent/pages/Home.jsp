<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3.css"><%-- 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/myScript.js"></script> --%>
<style>
li a.active {
	color:#000;
	background-color:#ccc;
}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
<script>
$(document).ready(function(){
    $("a").click(function(){
        $("a").removeClass("active");
        $(this).addClass("active");
    });
});

function displayMsg(failureMessage){
	//alert("hello" +failureMessage);
	var str="Invalid Username or Password\nRedirected to Home Page...";
	if(failureMessage=='10'){
		alert(str);
	}
}
</script>

<body onload="displayMsg('${failureMessage}')">
<header style="padding:2%;background-color:#dddddd;border:navy 1px solid;" class="w3-card-2">
<center><img  width="5%" id="logo" src="${pageContext.request.contextPath}/res/logo.png"><img  id="headerimg" width="60%" src="${pageContext.request.contextPath}/res/assetmanagementheader.png"></center>
</header>
<div class="w3-blue-grey" style="text-align:right">
</div>
<ul class="w3-navbar w3-navyblue w3-card-2">
	<li><a href="${pageContext.request.contextPath}/pages/Home.jsp" target="_top"><img src="${pageContext.request.contextPath}/res/home.png" height="50" width="50">Home</a></li>
   	<li><a href="${pageContext.request.contextPath}/pages/supplier1.jsp" target="content"><img src="${pageContext.request.contextPath}/res/suppliers.png" height="50" width="50">Suppliers</a></li>
   	<li><a href="${pageContext.request.contextPath}/pages/policies.jsp" target="content"><img src="${pageContext.request.contextPath}/res/policies.png" height="50" width="50">Policies</a></li>
   	<li><a href="${pageContext.request.contextPath}/pages/aboutus.jsp" target="content"><img src="${pageContext.request.contextPath}/res/aboutus.png" height="50" width="50">About Us</a></li>
  	<li class="w3-right"><a href="${pageContext.request.contextPath}/prepareLogin" target="content"><img src="${pageContext.request.contextPath}/res/login.png" height="50" width="50">Login</a></li>
</ul>
<div style="padding:0.2%;background-color:#dddddd;border:navy 1px solid;" class="w3-card-2">

</div>
<c:if test="${loginFailure == 1}">
<c:set scope="session" var="loginFail" value="Invalid Username Or Password"></c:set>
<iframe src="${pageContext.request.contextPath}/prepareLogin"  name="content"  width="100%" style="height:80%;padding: 0px" class="w3-border-0">
</iframe>
</c:if>
<c:if test="${loginFailure != 1}">
<iframe src="${pageContext.request.contextPath}/pages/back1.jsp"  name="content"  width="100%" style="height:80%;padding: 0px" class="w3-border-0">
</iframe>
</c:if>
<footer class="w3-container w3-navyblue" style="text-align:right">
Copyright&copy; All rights reserved&reg;
</footer>
</body>
</html>