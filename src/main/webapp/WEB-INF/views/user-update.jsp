<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="user-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>${sessionScope.currentUser.username}</title>
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
		.profile {
			margin-top: 2px;
			margin-left: 40%;
			font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
		}
	</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1 style="margin-top: 50px;">${sessionScope.currentUser.username}'s Profile: </h1>
		<div class="profile">
			<table>
			<form action="${contextPath}/user/update.htm" method="POST"> 
				<tr style="padding-top: 10px; padding-bottom: 10px;">
				    <td style="padding-top: 10px; padding-bottom: 10px;">Username:&emsp;</td>
				    <td style="text-align: left; padding-top: 10px; padding-bottom: 10px;"><input style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; text-align: center; height: 25px;" type="text" name="username" id="username" maxlength="20" size="30" value="${sessionScope.currentUser.username}" /></td>
				</tr>
				<tr style="padding-top: 10px; padding-bottom: 10px;">
				    <td style="padding-top: 10px; padding-bottom: 10px;">Password:&emsp;</td>
				    <td style="text-align: left; padding-top: 10px; padding-bottom: 10px;"><input style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; text-align: center; height: 25px;" type="password" name="password" id="password" maxlength="20" size="30" value="${sessionScope.currentUser.password}"/></td>
				</tr>
				<tr style="padding-top: 10px; padding-bottom: 10px;">
				    <td style="padding-top: 10px; padding-bottom: 10px;">Type:</td>
				    <td style="padding-top: 10px; padding-bottom: 10px; background-color: darkgreen; color: white;">Active User</td>
				</tr>
				<tr style="padding-top: 10px; padding-bottom: 10px;">
				    <td style="padding-top: 10px; padding-bottom: 10px;">Playlist:</td>
				    <td style="padding-top: 10px; padding-bottom: 10px;">
				    	<table style="border: 3px solid rgb(0, 94, 128)">	
							<thead style="border: 2px solid rgb(0, 94, 128)">
								<th style="padding: 15px; border: 2px solid rgb(0, 94, 128); background-color: rgb(0, 94, 128); color: white;">Media Name</th>
								<th style="padding: 15px; border: 2px solid rgb(0, 94, 128); background-color: rgb(0, 94, 128); color: white;">Media Type</th>
								<th style="padding: 15px; border: 2px solid rgb(0, 94, 128); background-color: rgb(0, 94, 128); color: white;">Artist</th>
							</thead>
							<c:forEach items="${sessionScope.currentUser.playlist.medialist}"  var="media">
								<tr style="border: 1px solid rgb(0, 94, 128)">
									<td style="padding: 10px; border: 1px solid rgb(0, 94, 128);">${media.name}</td>
									<td style="padding: 10px; border: 1px solid rgb(0, 94, 128);">${media.type}</td>
									<td style="padding: 10px; border: 1px solid rgb(0, 94, 128);">${media.artist.name}</td>
								</tr>
							</c:forEach>
						</table>
				    </td>
				</tr>
				<tr>
				    <td style="text-align: left; padding-left: 70px;" colspan="2"><br><input style="border: 0px; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; padding: 10px 10px; background-color: green; color: white;" type="submit" name="action" value="Update" /></td>
				</tr>
			</form>
				<tr>
					<td style="text-align: left; padding-left: 45px;" colspan="2">
						<br><br>
						<form action="${contextPath}/user/delete.htm" method="GET"> 
							<input style="border: 0px; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; padding: 10px 10px; background-color: darkred; color: white;" type="submit" value="Delete Account"></input>
						</form>
					</td>
				</tr>	
			</table>
		
	</div>
	<br><br>
	
</body>
</html>