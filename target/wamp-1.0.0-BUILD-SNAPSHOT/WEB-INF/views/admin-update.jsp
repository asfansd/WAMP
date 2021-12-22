<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${sessionScope.currentAdmin.username}</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1>${sessionScope.currentAdmin.username}'s Profile: </h1>
	<form action="${contextPath}/admin/update.htm" method="POST"> 
		<table>
		<tr>
		    <td>USERNAME:</td>
		    <td><input type="text" name="username" id="username" maxlength="20" size="30" required="required" value="${sessionScope.currentAdmin.username}" /></td>
		</tr>
		
		<tr>
		    <td>PASSWORD:</td>
		    <td><input type="password" name="password" id="password" maxlength="20" size="30" required="required" value="${sessionScope.currentAdmin.password}"/></td>
		</tr>
		<tr>
		    <td>Type:</td>
		    <td>Administrator</td>
		</tr>
		<tr>
		    <td colspan="2"><input type="submit" name="action" value="Update" /></td>
		</tr>	
		</table>
	</form>
	<br><br>
	<form action="${contextPath}/admin/delete.htm" method="GET"> 
		<input type="submit" value="Delete Account"></input>
	</form>
</body>
</html>