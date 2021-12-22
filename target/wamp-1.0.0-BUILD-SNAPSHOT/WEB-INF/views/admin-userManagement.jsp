<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Management</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<h1>Manage User Account(s)</h1>
	<table>
		<tr>
			<th>User ID</th>
			<th>Username</th>
			<th>Password</th>
			<th>Role</th>
			<th> </th>
		</tr>
		<c:forEach items="${sessionScope.userList}"  var="user">
		<tr>
			<td>${user.userid}</td>
			<td>${user.username}</td>
			<td>${user.password}</td>
			<td>${user.role}</td>
			<td><a href="${contextPath}/userAdmin/delete.htm?userid=${user.userid}">Delete</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>