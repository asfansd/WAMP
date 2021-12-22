<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Database</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<h1>Manage Media Database</h1>

	<table>		
		<c:forEach items="${sessionScope.mediaList}"  var="media">
		<tr>
			<td>${media.mediaid}</td>
			<td>${media.name}</td>
			<td>${media.type}</td>
			<td>${media.artist.name}</td>
			<td><a href="${media.url}">Link</a></td>
			<!--<td><a href="${contextPath}/admin/media/delete.htm?artistid=${media.artist.artistid}">Artist</a></td>-->
			<td><a href="${contextPath}/admin/media/delete.htm?mediaid=${media.mediaid}">Delete</a></td>
		</tr>
		</c:forEach>
	</table>
	<br><br>
	<a href="${contextPath}/admin/addMedia/add.htm">Add New Media</a>
</body>
</html>