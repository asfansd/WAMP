<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Success Page</title>
	<style>
		html {
			height: 100%;
		}
		body{
			text-align:center;
			font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
			background-image: linear-gradient(rgb(0, 134, 179), darkgrey);
			background-repeat: no-repeat;
			background-size: cover;
			color: white;
		}
		.userAdded {
			margin-left: 200px;
			text-align: left;
			margin-top: 4%;
		}
	</style>
</head>
<body>
	<div class="userCreated">
		<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
		<br><br><h2>New User Account Created Successfully!</h2><br>
		<a style="text-decoration: none; background-color: darkgreen; padding: 10px; color: white; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;" href="${contextPath}/user/login.htm">Go to Login Page</a>
	</div>
</body>
</html>