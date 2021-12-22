<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
	<script>
	function ajaxEvent() {

    var xmlHttp;
    try // Firefox, Opera 8.0+, Safari
    {
        xmlHttp = new XMLHttpRequest();
    } catch (e) {
        try // Internet Explorer
        {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {
                alert("Your browser does not support AJAX!");
                return false;
            }
        }
    }

    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4) {
            document.getElementById("info").innerHTML = xmlHttp.responseText;
        }
    }
    
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    xmlHttp.open("POST", "../ajaxservice.htm?username="+username+"&password="+password, true);
    xmlHttp.send();
}
</script>
	<title>WAMP</title>
	<style>
		body {
			background-image: url('../resources/images/userloginPage.png');
			background-repeat: no-repeat;
			background-size: cover;
		}
		.content {
			padding-top: 2%;
			padding-bottom: 2%;
			margin-top: 10%;
			margin-left: 30%;
			width: 40%;
			opacity: 0.6;
			border: 2px solid rgb(0, 57, 77);
			background-color: rgb(0, 77, 102);
			border-radius: 20px;
			text-align: center;
			font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
			color: white; 
		}
		.content:hover {
			opacity: 1;
		}
		h1{
		
		}
		a{
			color: white;
			text-decoration: none;
			background-color: darkgreen;
			padding: 5px;
			
		}
		.adminAccess {
			background-color: darkred;
			padding: 5px;
		}
		.button {
			background-color: #4CAF50; /* Green */
		  	border: none;
		  	color: white;
			padding: 10px 10px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
		  	font-size: 16px;
		  	border-radius: 5px;
		  	margin-left: 15px;
		}
		.deco{
			letter-spacing:0px;
		}
	</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="content">
		<h1> W.A.M.P.<br>&nbsp;|> Web Accessible Media Player &nbsp;&lt;|</h1><br>
		<c:if test = "${not empty requestScope.error}">
			<div style="margin-left: 30%; width: 50%; padding:8px; background-color: darkred; opacity: 0.7; border-radius: 10px; color: white; font-weight: bolder; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;">
				Credentials are Incorrect!
			</div><br><br>
		</c:if>
		<form:form action="${contextPath}/user/login.htm" modelAttribute="user" method="POST">
			Username: <form:input type="text" path="username" required="required"/><br /><br><br>
		    Password:&nbsp; <form:input type="password" path="password" required="required"/><br /><br><br>
		    <input class="button" type="submit" value="Log In">
	        <input class="button" type="reset"  value="Reset">
		</form:form>
		<br><br>
		<div id="info">
			Not a User? &nbsp;<a href="${contextPath}/user/save.htm">Play Now!</a>
			<br /><br>
			<a class="adminAccess" href="${contextPath}/admin/login.htm">Administrator Access</a>
		</div>
	</div>
</body>
</html>