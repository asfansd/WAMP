<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add Media</title>
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
		.addArtist {
			margin-left: 650px;
			text-align: left;
			margin-top: 4%;
		}
	</style>
</head>

<body>
	<div class="addArtist">
		<h1>Add Artist</h1><br>
		<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
		<form method="GET" action="${contextPath}/admin/mediaAdd.htm">
			Media Name: &emsp;<input style="text-align: center; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;" type="text" value="${sessionScope.media.name}" readonly/><br><br>
			Media Type: &emsp;&ensp;<input style="text-align: center; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;" type="text" value="${sessionScope.media.type}" readonly/><br><br>
			Media URL: &ensp;&emsp;<input style="text-align: center; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;" type="url" value="${sessionScope.media.url}" readonly/><br><br>
			Select Artist: &ensp;&nbsp;<input style="text-align: center; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;" list="artists" name="artist">
					<datalist id="artists">
					<c:forEach items="${sessionScope.artistList}"  var="artist">
					  	<option value="${artist.artistid}: ${artist.name}">  
					</c:forEach>
					</datalist><br><br>
			<input style="color: white; background-color: darkgreen; border: 0px; padding: 10px;" type="submit" name="action" value="Add Artist"/>
		</form>
		<br><br>
	</div>
</body>
</html>