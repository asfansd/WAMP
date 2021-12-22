<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Dashboard</title>
	<style>
		html {
			height: 100%;
		}
		body{
			text-align:center;
			font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
			background-image: linear-gradient(rgb(179, 0, 0), darkgrey);
			background-repeat: no-repeat;
			background-size: cover;
			color: white;
		}
		.dashboard {
			margin-top: 4%;
		}
		.vl1 {
		  	border-left: 4px solid rgb(51, 51, 51);
		  	border-radius: 100px;
		  	height: 350px;
		  	position: absolute;
		  	left: 33%;
		  	margin-left: -3px;
		  	margin-top: 20%;
		  	top: 0;
		}
		.vl2 {
		  	border-left: 4px solid rgb(51, 51, 51);
		  	border-radius: 100px;
		  	height: 350px;
		  	position: absolute;
		  	left: 67%;
		  	margin-left: -3px;
		  	margin-top: 20%;
		  	top: 0;
		}
		.search1 {
			text-decoration: none;
			background-color: rgb(77, 0, 0);
			margin-left: 0px;
			color: white;
			padding:20px;
		}
		.search2 {
			text-decoration: none;
			background-color: rgb(77, 0, 0);
			margin-left: 300px;
			color: white;
			padding:20px;
		}
		.search3 {
			text-decoration: none;
			background-color: rgb(77, 0, 0);
			margin-left: 300px;
			color: white;
			padding:20px;
		}
		p {
			font-size: x-large;
		}
		.textBox {
			border-radius: 10px;
		}
		.button {
			margin-left: 100px;
			background-color: darkgreen;
		}
		.searches {
			margin-top: 200px;
		}
	</style>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="dashboard">
		<h1>Admin Dashboard</h1>
		<h2>Welcome Admin!</h2>
		<br>
	</div>
	<div class="searches">
		<a class="search1" href="${contextPath}/admin/user.htm">Manage User Account(s)</a>
		<div class="vl1"></div>
		<a class="search2" href="${contextPath}/admin/media.htm">Manage Media</a>
		<div class="vl2"></div>
		<a class="search3" href="${contextPath}/admin/artist.htm">Manage Artist(s)</a>
	</div>
</body>
</html>