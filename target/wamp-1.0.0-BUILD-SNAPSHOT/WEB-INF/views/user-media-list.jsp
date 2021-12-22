<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="user-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Media Search</title>
	<style>
		html {
			height: 100%;
		}
		body {
			text-align: center;
			font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
			background-image: linear-gradient(rgb(153, 230, 255), darkgrey);
			background-repeat: no-repeat;
			background-size: cover;
		}
		h1 {
			margin-top: 8%;
		}
		.mediaSearch {
			margin-top: 5%;
		} 
	</style>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="mediaSearch">	
		<h1 style="font-weight: bold;">Media Search</h1><br>
		<table style="margin-left:28%; border: 3px solid rgb(0, 94, 128)">
			<thead style="border: 2px solid rgb(0, 94, 128)">
					<th style="padding: 15px; border: 2px solid rgb(0, 94, 128); background-color: rgb(0, 94, 128); color: white;">Media Name</th>
					<th style="padding: 15px; border: 2px solid rgb(0, 94, 128); background-color: rgb(0, 94, 128); color: white;">Media Type</th>
					<th style="padding: 15px; border: 2px solid rgb(0, 94, 128); background-color: rgb(0, 94, 128); color: white;">Artist</th>
					<th style="padding: 15px; border: 2px solid rgb(0, 94, 128); background-color: rgb(0, 94, 128); color: white;">Groove</th>
					<th style="padding: 15px; border: 2px solid rgb(0, 94, 128); background-color: rgb(0, 94, 128); color: white;">Add to Playlist</th>
			</thead>		
			<c:forEach items="${requestScope.mediaList}"  var="media">
			<tr style="border: 1px solid rgb(0, 94, 128)">
				<td style="padding: 10px; border: 1px solid rgb(0, 94, 128);">${media.name}</td>
				<td style="padding: 10px; border: 1px solid rgb(0, 94, 128);">${media.type}</td>
				<td style="padding: 10px; border: 1px solid rgb(0, 94, 128);">${media.artist.name}</td>
				<td style="padding: 10px; border: 1px solid rgb(0, 94, 128);"><a href="${contextPath}/media/play.htm?mediaid=${media.mediaid}" target="_blank"><i style="color: darkgreen;" class="fa fa-play"></i></a></td>
				<td style="padding: 10px; border: 1px solid rgb(0, 94, 128);"><a href="${contextPath}/user/addMedia.htm?mediaid=${media.mediaid}"><i style="color: darkgreen;" class="fa fa-plus"></i></a>
			</tr>
			</c:forEach>
		</table>
		<br><br>
	</div>
</body>
</html>