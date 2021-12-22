<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Create User</title>
	<style>
		body {
			background-image: url('../resources/images/userloginPage.png');
			background-repeat: no-repeat;
			background-size: cover;
		}
		.content {
			padding-top: 2%;
			padding-bottom: 2%;
			margin-top: 10%;
			margin-left: 30%;
			width: 40%;
			opacity: 0.6;
			border: 2px solid rgb(0, 57, 77);
			background-color: rgb(0, 77, 102);
			border-radius: 20px;
			text-align: center;
			font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
			color: white; 
		}
		.content:hover {
			opacity: 1;
		}
		h1{
		
		}
		a{
			color: white;
			text-decoration: none;
			background-color: darkgreen;
			padding: 5px;
			
		}
		.button {
			background-color: #4CAF50; /* Green */
		  	border: none;
		  	color: white;
			padding: 10px 10px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
		  	font-size: 16px;
		  	border-radius: 5px;
		  	margin-left: 15px;
		}
		.deco{
			letter-spacing:0px;
		}
	</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="content">
		<h1>Create New User Account</h1><br><br>
		<c:if test = "${not empty requestScope.error}">
			<div style="margin-left: 35%; width: 30%; padding:8px; background-color: darkred; opacity: 0.7; border-radius: 10px; color: white; font-weight: bolder; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;">
				User already exists!
			</div><br><br>
		</c:if>
		<form:form modelAttribute="user" action="${contextPath}/user/save.htm" method="POST">
			Username: &emsp;<form:input path="username" /><br><br><br>
	        Password: &emsp;<form:input path="password" type="password"/><br><br><br>
	        Email: &emsp;&emsp;&nbsp;<input name="email" type="email"/><br><br><br>
	        <input class="button" type="submit" value="Register" />
	    </form:form>
	    <br><br>
		&emsp;<a href="${contextPath}/user/login.htm">&lt;&lt; Go to Login Page</a>
	</div>
</body>
</html>