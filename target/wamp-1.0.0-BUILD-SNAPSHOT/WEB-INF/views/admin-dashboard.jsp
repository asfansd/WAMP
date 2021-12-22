<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1>Admin Dashboard</h1>
	<h2>Welcome Admin!</h2>
	
	<br>
	<a href="${contextPath}/admin/user.htm">Manage User Account(s)</a>
	
	<br>
	<a href="${contextPath}/admin/media.htm">Manage Media</a>
	
	<br>
	<a href="${contextPath}/admin/artist.htm">Manage Artist(s)</a>
</body>
</html>