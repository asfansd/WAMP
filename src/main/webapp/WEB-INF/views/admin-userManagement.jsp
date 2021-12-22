<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Management</title>
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
		.userManagement {
			margin-top: 4%;
		}
	</style>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="userManagement">
		<h1>Manage User Account(s)</h1>
		<table style="margin-left: 37%; border: 3px solid rgb(77, 0, 0)">
			<thead style="border: 2px solid rgb(77, 0, 0)">
					<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">User ID</th>
					<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Username</th>
					<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Role</th>
					<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Delete</th>
			</thead>
			<c:forEach items="${sessionScope.userList}"  var="user">
			<tr style="border: 1px solid rgb(0, 94, 128)">
				<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);">${user.userid}</td>
				<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);">${user.username}</td>
				<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);">${user.role}</td>
				<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);"><a href="${contextPath}/userAdmin/delete.htm?userid=${user.userid}"><i style="color: yellow;" class="fa fa-trash"></i></a></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>