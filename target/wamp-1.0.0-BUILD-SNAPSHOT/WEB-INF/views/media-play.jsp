<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Media Player</title>
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
		h1 {
			margin-top: 5%;
		}
	</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="mediaPlayer">
		<h1>Playing: ${requestScope.name}</h1>
		<c:if test = "${requestScope.location == 'web'}">
		    <c:if test = "${requestScope.type == 'song'}">
		    	<iframe style="margin-top: 10%; border-radius: 10px; border: 4px solid rgb(30, 30, 47)" width="600" height="50"
					src="${requestScope.url}">
				</iframe>
		    </c:if>
		    <c:if test = "${requestScope.type == 'video'}">
		    	<iframe style="margin-top: 1%; border-radius: 10px; border: 4px solid rgb(30, 30, 47)" width="600" height="420"
					src="${requestScope.url}">
				</iframe>
			</c:if>
		</c:if>
		<c:if test = "${requestScope.location == 'db'}">
		    <c:if test = "${requestScope.type == 'song'}">
		        <iframe style="margin-top: 10%; border-radius: 10px; border: 4px solid rgb(30, 30, 47)" width="600" height="50"
					src="${requestScope.url}">
				</iframe>
		    </c:if>
		    <c:if test = "${requestScope.type == 'video'}">
		    	<iframe style="margin-top: 1%; border-radius: 10px; border: 4px solid rgb(30, 30, 47)" width="600" height="420"
					src="${requestScope.url}">
				</iframe>
			</c:if>
		</c:if>
	</div>
</body>
</html>