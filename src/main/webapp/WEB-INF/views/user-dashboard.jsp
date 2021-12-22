<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="user-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Dashboard</title>
	<style>
		html {
			height: 100%;
		}
		body{
			text-align:center;
			font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
			background-image: linear-gradient(rgb(0, 153, 204), darkgrey);
			background-repeat: no-repeat;
			background-size: cover;
		}
		.dashboard {
			margin-top: 4%;
		}
		.vl {
		  	border-left: 4px solid rgb(0, 94, 128);
		  	border-radius: 100px;
		  	height: 350px;
		  	position: absolute;
		  	left: 50%;
		  	margin-left: -3px;
		  	margin-top: 20%;
		  	top: 0;
		}
		.search1 {
			text-align: left;
			display: inline-block;
			margin-right:500px;
			margin-top: 80px;
		}
		.search2 {
			text-align: left;
			display: inline-block;
			margin-top: 80px;
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
	</style>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="dashboard">
		<h1> User Dashboard</h1><br>
		<h2> Welcome, ${sessionScope.currentUser.username}!</h2>
		<br>
	</div>
	<c:if test = "${not empty requestScope.error}">
		<div style="margin-left: 30%; width: 30%; padding:8px; background-color: darkred; opacity: 0.7; border-radius: 10px; color: white; font-weight: bolder; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;">
			${requestScope.error}
		</div><br><br>
	</c:if>
	<div class="search1">
		<p>Search Media:</p>
		<form action="${contextPath}/user/mediaSearch.htm" method="get">
			<input style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; text-align: center; height: 30px; width: 150px; border-radius: 10px;" type="text" name="media-keyword"  placeholder="Media Name" required/><br><br>
			<input style="border: 0px; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; padding: 10px 10px; background-color: green; color: white;" name="button" type="submit" name="submit1" value="Search" />	
		</form>
	</div>
	<div class="vl"></div>
	<div class="search2">
		<p>Search User:</p>
		<form action="${contextPath}/user/userSearch.htm" method="get">
			<input style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; text-align: center; height: 30px; width: 150px; border-radius: 10px;" type="text" name="user-keyword"  placeholder="User Name" required/><br><br>
			<input style="border: 0px; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; padding: 10px 10px; background-color: green; color: white;" name="button" type="submit" name="submit2" value="Search" />	
		</form>
	</div>
</body>
</html>