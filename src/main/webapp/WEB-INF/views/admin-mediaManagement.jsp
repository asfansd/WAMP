<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Manage Database</title>
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
		.mediaManagement {
			margin-top: 4%;
		}
	</style>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="mediaManagement">
		<h1>Manage Media Database</h1>
		<table style="margin-left: 27%; border: 3px solid rgb(77, 0, 0)">
			<thead style="border: 2px solid rgb(77, 0, 0)">
					<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Media ID</th>
					<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Media Name</th>
					<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Media Type</th>
					<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Artist</th>
					<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Media Link</th>
					<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Delete</th>
			</thead>	
			<c:forEach items="${sessionScope.mediaList}"  var="media">
			<tr style="border: 1px solid rgb(0, 94, 128)">
				<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);">${media.mediaid}</td>
				<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);">${media.name}</td>
				<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);">${media.type}</td>
				<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);">${media.artist.name}</td>
				<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);"><a href="${media.url}">Link</a></td>
				<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);"><a href="${contextPath}/admin/media/delete.htm?mediaid=${media.mediaid}"><i style="color: yellow;" class="fa fa-trash"></i></a></td>
			</tr>
			</c:forEach>
		</table>
		<br><br>
		<a style="background-color: darkgreen; padding: 10px; text-decoration: none;" href="${contextPath}/admin/addMedia/add.htm">Add New Media</a>
	</div>
</body>
</html>