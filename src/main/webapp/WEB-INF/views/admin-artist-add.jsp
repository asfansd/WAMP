<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Artist</title>
</head>


<body>
	<h1>Add New Artist</h1>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<form method="post" action="${contextPath}/admin/media/add.htm">
		Artist Name: <input type="text" name="mediaName" maxlength="30" required/><br>
		Media Type: 
		<input type="radio" id="song" name="mediaType" value="song">
		<label for="song">Song</label><br>
		<input type="radio" id="video" name="mediaType" value="video">
		<label for="video">Video</label><br>
		Media URL: <input type="url" name="mediaUrl" size="40" required/><br>
		<input type="submit" name="action" value="Proceed to Add Artist"/>
	</form>
	<br><br>
	
</body>
</html>