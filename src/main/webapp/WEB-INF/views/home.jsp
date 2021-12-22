<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<style>
		h1 {
			font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
			color: white;	
		}
		body {
			background-image: linear-gradient(darkred , rgb(64, 64, 64));			
		}
		a {
			background-color: darkgreen;
			color: white;
			text-decoration: none;
			font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
			font-size: 20px;
			padding: 20px;
		}
		div {
			text-align:center;
			margin-top:15%;	
		}
		span {
			margin-top:10px;
			padding: 15px;
			background-color: black;
			color: white;
		}
	</style>
</head>
<body>
	<div>
		<h1>
			Welcome to the world of <br /><br /><span>W.A.M.P</span>  
		</h1>
		<br /><br /><br /><br /><br /><br /><br /><br /><br />
		<a href="http://localhost:8080/wamp/user/login.htm">Let's Play >> </a>
	</div>
</body>
</html>
