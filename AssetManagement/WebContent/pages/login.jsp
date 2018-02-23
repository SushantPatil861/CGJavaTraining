<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
   <%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html><title>Login
</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="${pageContext.request.contextPath}/css/w3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/login.css" REL="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/style1.css" REL="stylesheet" type="text/css">
<body>
<div class="w3-container w3-light-grey" style="padding:10%;padding-left:20%;padding-right:20%">
  
  <div class="w3-card-12 w3-round-large">
    <div class="w3-container w3-navyblue w3-center w3-upper-round-large">
      <h2>Login</h2>
    </div>
	<f:form cssClass="w3-container w3-white w3-round-large" modelAttribute="loginDetails" method="POST" action="LoginCheck" target="_top">
	  <p>
	  <label class="w3-label w3-validate">UserID</label>
	  <f:input path="userId" cssClass="w3-input" pattern="[AM][0-9]{5}" required="required"/></p>
	  <p>
	  <label class="w3-label w3-validate">Password</label>
	  <f:password path="userPassword" cssClass="w3-input" required="required" showPassword="true"/></p>
	  <p class="w3-center">
	  <input class="w3-btn w3-navyblue w3-round" type="submit" value="Login"/><br/><br/>
	  <font color="red">${loginFail}</font></p>
	</f:form>
  </div>
  <c:remove var="loginFail"/>
</div>
</body>
</html>
