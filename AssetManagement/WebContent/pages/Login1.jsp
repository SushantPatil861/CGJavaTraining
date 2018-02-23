<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3.css">
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
</script>
<body>
<header style="padding:2%;background-color:#dddddd;border:navy 1px solid;" class="w3-card-2">
<center><img  width="5%" id="logo" src="${pageContext.request.contextPath}/res/logo.png"><img  id="headerimg" width="60%" src="${pageContext.request.contextPath}/res/assetmanagementheader.png"></center>
</header>
<div class="w3-blue-grey" style="text-align:right">
</div>
<ul class="w3-navbar w3-navyblue w3-card-2">
	<li><a href="${pageContext.request.contextPath}/pages/back1.jsp" target="content"><img src="${pageContext.request.contextPath}/res/home.png" height="50" width="50">Home</a></li>
   	<li><a href="${pageContext.request.contextPath}/pages/supplier1.jsp" target="content"><img src="${pageContext.request.contextPath}/res/suppliers.png" height="50" width="50">Suppliers</a></li>
   	<li><a href="${pageContext.request.contextPath}/pages/policies.jsp" target="content"><img src="${pageContext.request.contextPath}/res/policies.png" height="50" width="50">Policies</a></li>
   	<li><a href="${pageContext.request.contextPath}/pages/aboutus.jsp" target="content"><img src="${pageContext.request.contextPath}/res/aboutus.png" height="50" width="50">About Us</a></li>
  	<li class="w3-right"><a href="${pageContext.request.contextPath}/pages/Login.jsp" target="content"><img src="${pageContext.request.contextPath}/res/login.png" height="50" width="50">Login</a></li>
</ul>
<div class="w3-navyblue" width="100%" style="height:1%"></div>
<div class="w3-container w3-light-grey" style="padding:10%;padding-left:20%;padding-right:20%">
  
  <div class="w3-card-12 w3-round-large">
    <div class="w3-container w3-navyblue w3-center w3-upper-round-large">
      <h2>Login</h2>
    </div>
	<form class="w3-container w3-white w3-round-large" method="POST" action="${pageContext.request.contextPath}/LoginCheck" target="_top">
	  <p>
	  <label class="w3-label w3-validate">Username</label>
	  <input class="w3-input" type="text" name="txtUid" pattern="[AM]{1}[0-9]{5}" required></p>
	  <p>
	  <label class="w3-label w3-validate">Password</label>
	  <input class="w3-input" type="password" name="txtPwd" pattern="[A-Za-z0-9]{8,50}" required></p>
	  <p class="w3-center">
	  <input class="w3-btn w3-navyblue w3-round" type="submit" value="Login"></input><br/><br/><font color="red">${failureMessage}</font></p>
	</form>
  </div>
</div>
<footer class="w3-container w3-grey" style="text-align:right">
Copyright&copy; All rights reserved&reg;
</footer>
</body>
</html>
