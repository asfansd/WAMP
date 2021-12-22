<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>${sessionScope.currentAdmin.username}</title>
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
		.updateProfile {
			margin-top: 4%;
		}
	</style>
</head>
<body>
	<div class="updateProfile">
		<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
		<h1>${sessionScope.currentAdmin.username}'s Profile: </h1>
		<form action="${contextPath}/admin/update.htm" method="POST"> 
		<table style="margin-left: 40%;">
			<tr style="padding-top: 10px; padding-bottom: 10px;">
			    <td style="padding-top: 10px; padding-bottom: 10px;">Username:&emsp;</td>
			    <td style="text-align: left; padding-top: 10px; padding-bottom: 10px;"><input style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; text-align: center;" type="text" name="username" id="username" maxlength="20" size="30" required="required" value="${sessionScope.currentAdmin.username}" /></td>
			</tr>
			
			<tr style="padding-top: 10px; padding-bottom: 10px;">
			    <td style="padding-top: 10px; padding-bottom: 10px;">Password:&emsp;</td>
			    <td style="text-align: left; padding-top: 10px; padding-bottom: 10px;"><input style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; text-align: center;" type="password" name="password" id="password" maxlength="20" size="30" required="required" value="${sessionScope.currentAdmin.password}"/></td>
			</tr>
			<tr style="padding-top: 10px; padding-bottom: 10px;">
			    <td style="padding-top: 10px; padding-bottom: 10px;">Type:&emsp;</td>
			    <td style="padding-top: 10px; padding-bottom: 10px; background-color: darkred; color: white;">Administrator</td>
			</tr>
			<tr style="padding-top: 10px; padding-bottom: 10px;">
			    <td style="text-align: left; padding-left: 120px;" colspan="2"><br><br><input style="border: 0px; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; padding: 10px 10px; background-color: green; color: white;" type="submit" name="action" value="Update" /></td>
			</tr>	
			</table>
		</form>
		<br><br>
		<form action="${contextPath}/admin/delete.htm" method="GET"> 
			<input style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; background-color: darkred; padding: 10px; color: white; border: 0px;" type="submit" value="Delete Account"></input>
		</form>
	</div>
</body>
</html>