<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Media</title>
</head>

<body>
<h1>Add Artist</h1>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<form method="GET" action="${contextPath}/admin/mediaAdd.htm">
		Media Name: <input type="text" value="${sessionScope.media.name}" readonly/><br>
		Media Type: <input type="text" value="${sessionScope.media.type}" readonly/><br>
		Media URL: <input type="url" value="${sessionScope.media.url}" readonly/><br>
		Select Artist: <input list="artists" name="artist">
				<datalist id="artists">
				<c:forEach items="${sessionScope.artistList}"  var="artist">
				  	<option value="${artist.artistid}: ${artist.name}">  
				</c:forEach>
				</datalist><br><br>
		<input type="submit" name="action" value="Add Artist"/>
	</form>
	<br><br>
	<!-- <a href="${contextPath}/admin/music.htm">Go Back To Artist List</a> -->
</body>
</html>