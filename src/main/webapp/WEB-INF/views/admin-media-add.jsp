<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add New Media</title>
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
		.addMedia {
			margin-left: 650px;
			text-align: left;
			margin-top: 4%;
		}
	</style>
</head>
<body>
	<div class="addMedia">
		<h1>Add New Media</h1><br>
		<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
		<form name="form1" id="form1" method="POST" enctype="multipart/form-data" action="${contextPath}/admin/media/add.htm">
			Media Name: &emsp;<input type="text" name="mediaName" maxlength="30" required/><br><br>
			Media Type: &emsp;
			<input type="radio" id="song" name="mediaType" value="song">
			<label for="song">Song</label>
			<input type="radio" id="video" name="mediaType" value="video">
			<label for="video">Video</label><br><br>
			
			Media Source:&nbsp; 
			<input type="radio" id="url" name="mediaAddType" onchange="media()" value="url" required>
			<label for="url">URL</label>
			<input type="radio" id="file" name="mediaAddType" onchange="media()" value="file" required>
			<label for="file">File</label><br><br>
			Media URL: &emsp;&ensp;&nbsp;<input type="url" id="mediaUrl" name="mediaUrl" size="40" disabled/><br><br>
			File: &emsp;&emsp;&ensp;&nbsp;<input style="font-weight: bold; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; color: white; padding: 5px;" type="file" accept=".mp3,.mp4" id="fileUpload" name="fileUpload" size="50" disabled/><br><br>
			<script>
				function media() {
				  if(document.getElementById("url").checked){
					document.getElementById("mediaUrl").disabled=false;
					document.getElementById("fileUpload").disabled=true;
					document.getElementById("fileUpload").style.color="white";
					document.getElementById("fileUpload").style.backgroundColor="darkred";
					document.getElementById("form1").action='${contextPath}/admin/media/add.htm';
				  } else {
					 document.getElementById("mediaUrl").disabled=true;
					 document.getElementById("fileUpload").disabled=false;
					 document.getElementById("fileUpload").style.color="darkred";
					 document.getElementById("fileUpload").style.backgroundColor="white";
					 document.getElementById("form1").action='${contextPath}/admin/media/addFile.htm';
				  }
				}
			</script>
			
			<input form="form1" style="color: white; background-color: darkgreen; border: 0px; padding: 10px;" type="submit" name="action" value="Proceed to Add Artist >>"/>
		</form>
		<br><br>
	</div>
</body>
</html>