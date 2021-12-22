<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Login</title>
	<style>
		html {
			height: 100%;
		}
		body {
			background-image: linear-gradient(rgb(77, 0, 0), rgb(51, 51, 51));
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
			border: 2px solid rgb(38, 38, 38);
			background-color: rgb(38, 38, 38);
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
		<h1>&emsp;&ensp;Admin Login: </h1><br>
        <form:form action="${contextPath}/admin/login.htm" modelAttribute="admin" method="POST">
			&emsp;&emsp;&emsp;Username: &emsp;<form:input type="text" path="username" /><br><br><br>
	        &emsp;&emsp;&emsp;Password: &emsp;&nbsp;<form:input type="password" path="password" /><br><br><br>
	        <input class="button" type="submit" value="Log In">
            <input style="background-color: rgb(89, 89, 89);" class="button" type="reset" value="Reset"><br><br><br>
	    </form:form>
        <form ACTION="${contextPath}/admin/save.htm" METHOD="GET">
            <input style="background-color: rgb(77, 0, 0);" class="button" type="submit"  value="Admin Registration">
        </form>
	</div>
</body>
</html>