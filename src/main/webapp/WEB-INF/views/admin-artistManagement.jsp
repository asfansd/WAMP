<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Management</title>
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
		.artistManagement {
			margin-top: 4%;
		}
		.addedArtist:disabled {
			background-color: darkgrey;	
		}
	</style>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
		<div class="artistManagement">
			<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
			<h1>Manage Artist(s)</h1>	
			<table style="margin-left: 34%; border: 3px solid rgb(77, 0, 0)">
				<thead style="border: 2px solid rgb(77, 0, 0)">
						<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Artist ID</th>
						<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Artist Name</th>
						<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Media List</th>
						<th style="padding: 15px; border: 2px solid rgb(77, 0, 0); background-color: white; color: rgb(179, 0, 0);">Delete</th>
				</thead>	
				<c:forEach items="${sessionScope.artistList}"  var="artist">
				<tr style="border: 1px solid rgb(0, 94, 128)">
					<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);">${artist.artistid}</td>
					<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);">${artist.name}</td>
					<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);">
						<ul>
							<c:forEach items="${sessionScope.medialist}"  var="media">
								<c:if test = "${media.artist.name = artist.name}">
		         					<li>${media.name}</li>
		      					</c:if>
							</c:forEach>
						</ul>
					</td>	
					<td style="padding: 10px; border: 1px solid rgb(77, 0, 0);"><a href="${contextPath}/admin/artist/delete.htm?artistid=${artist.artistid}"><i style="color: yellow;" class="fa fa-trash"></i></a></td>
				</tr>
				</c:forEach>
			</table>
			<br><br>
			<input style="border: 0px; background-color: darkgreen; padding: 10px; color: white" type="button" name="addArtist" onclick="artist()" value="New Artist"></input><br><br>
			<script>
				function artist() {
				  document.getElementById("artistName").disabled = false;
				  document.getElementById("artistAdd").disabled = false;
				}
			</script>
			<form action="${contextPath}/admin/artist/add.htm" method="GET">
				<input style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;" type="text" name="artistName" id="artistName" placeholder="Artist Name" disabled></input>
				<input type="submit" name="artistAdd" id="artistAdd" disabled value="Add New Artist"></input>
			</form>
		</div>
</body>
</html>