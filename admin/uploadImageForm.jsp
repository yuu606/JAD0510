<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<!-- 
=======================================	
Author: Chong Yu Lin
Date:  2023
Description: ST0510/JAD CA1 Assignment
=======================================
-->
<body>
	<div class="container-fluid " style="min-height:87vh;">
		<%
		if (session.getAttribute("sessUserID") == null || !session.getAttribute("sessUserRole").equals(2)) {
		%>
		<div class="sticky-top row">
			<nav class="navbar" style="background-color: rgb(52, 78, 65);">
				<div class="container-fluid d-flex">
					<div class="p-2 flex-grow-1">
						<h3
							style="font-family: Copperplate, fantasy; color: white; padding: 5px;">Bookly</h3>
					</div>
					<div class="p-2" style="margin: 10px;">
						<button class="btn btn-success  text-nowrap"
							style="font-family: Monaco, monospace; font-weight: bold;"
							onclick="window.location.href='../public/Index.jsp'">Home</button>
					</div>
				</div>
			</nav>
		</div>
		<h1>You are not authorized to access this page</h1>
		<%} else {%>
		<div class="sticky-top row">
			<nav class="navbar" style="background-color: rgb(52, 78, 65);">
				<div class="container-fluid d-flex">
					<div class="p-2 flex-grow-1">
						<h3
							style="font-family: Copperplate, fantasy; color: white; padding: 5px;">Bookly
							- Admin</h3>
					</div>
					<div class="p-2" style="margin: 10px;">
						<button class="btn btn-success  text-nowrap"
							style="font-family: Monaco, monospace; font-weight: bold;"
							onclick="window.location.href='../public/logOut.jsp'">Logout</button>
					</div>
				</div>
			</nav>
		</div>
		<!-- -----------------END OF HEADER-----------------  -->
		<div class="my-2">
			<form method="post"
				action="${pageContext.request.contextPath}/UploadImageServlet"
				enctype="multipart/form-data">
				<input type="file" name="file" /> 
				<input type="submit" value="Upload"  class="btn btn-primary"/>
			</form>
		</div>
		<%
		}
		%>

	</div>
	<%@include file="../footer.html"%>
</body>
</html>