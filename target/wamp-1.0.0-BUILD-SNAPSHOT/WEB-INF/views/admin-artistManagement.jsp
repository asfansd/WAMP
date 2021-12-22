<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Management</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<h1>Manage Artist(s)</h1>	
	<table>		
		<c:forEach items="${sessionScope.artistList}"  var="artist">
		<tr>
			<td>${artist.artistid}</td>
			<td>${artist.name}</td>
			<td>
				<ul>
					<c:forEach items="${sessionScope.medialist}"  var="media">
						<c:if test = "${media.artist.name = artist.name}">
         					<li>${media.name}</li>
      					</c:if>
					</c:forEach>
				</ul>
			</td>	
			<td><a href="${contextPath}/admin/artist/delete.htm?artistid=${artist.artistid}">Delete</a></td>
		</tr>
		</c:forEach>
	</table>
	<br><br>
	<input type="button" name="addArtist" onclick="artist()" value="New Artist"></input>
	<script>
		function artist() {
		  document.getElementById("artistName").disabled = false;
		  document.getElementById("artistAdd").disabled = false;
		}
	</script>
	<form action="${contextPath}/admin/artist/add.htm" method="GET">
		<input type="text" name="artistName" id="artistName" disabled></input>
		<input type="submit" name="artistAdd" id="artistAdd" disabled value="Add New Artist"></input>
	</form>
</body>
</html>