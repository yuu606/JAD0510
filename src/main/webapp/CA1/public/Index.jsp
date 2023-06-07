<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Bookly</title>
	
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<!-- 
=======================================	
Author: Chong Yu Lin
Date:  2023
Description: ST0510/JAD CA1 Assignment
=======================================
-->
<div class="container-fluid">
		<div class="sticky-top row">
			<nav class="navbar" style="background-color: rgb(52, 78, 65);">
					<div class="container-fluid d-flex">
						<div class="p-2 flex-grow-1">
							<h3 style="font-family: Copperplate, fantasy; color: white; padding: 5px;">Bookly</h3>
						</div>
						<%
							if (session.getAttribute("sessUserID") != null) { %>
						<div class="p-2" style="margin:10px;">
							<button class="btn btn-success  text-nowrap"
							style="font-family: Monaco, monospace; font-weight: bold;"
							onclick="window.location.href='logOut.jsp'">Logout</button>
						</div>
						<%
						} else {
						%>
						<div class="p-2" style="margin:10px;">
							<button class="btn btn-success  text-nowrap"
							style="font-family: Monaco, monospace; font-weight: bold;"
							onclick="window.location.href='Login.jsp'">Login</button>
						</div>
						<div class="p-2" style="margin:10px;">
							<button class="btn btn-success  text-nowrap"
							style="font-family: Monaco, monospace; font-weight: bold;"
							onclick="window.location.href='signUp.jsp'">Sign Up</button>
						</div>
						<% } %>
					</div>
				</nav>
			</div>
		<div class="row align-items-center height">
			<div class="container-fluid d-flex flex-column">
				<div class="p-2">
					<h1 style="font-family: helvetica; font-weight: bold; text-align: center;">Read anywhere, any time.</h1>
				</div>
				<div class="p-2">
					<h2 style="font-family: helvetica; text-align: center;">All your favorite books in one place</h2>
				</div>
				<br>
					<form action="${pageContext.request.contextPath}/ProcessSearch" method="GET">
						<div class="container-fluid d-flex align-items-center flex-column">
							<div class="p-2">
								<p style="font-family: helvetica; font-size: 30px; text-align: center;">Search for Title/Category:</p>
							</div>
							<div class="p-2">
								<div class="container-fluid d-flex align-items-center">
									<div class="p-2">
										<input type="text" name="searchValue" style="max-width: 300px; margin: 10px; height:30px;">
									</div>
									<div class="p-2">
										<input  class="row" type ="submit" value="Search" style="max-width:60px; height:30px;">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<%@include file="footer.html" %>
			</div>
		</div>
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<% if (request.getParameter("errCode")!=null && (request.getParameter("errCode")).equals("404")){
	out.print("sorry, we didn't manage to find anything that matched what you typed.");
} %>
</body>
</html>

<style>
.height{
	min-height: <script>window.innnerHeight</script>;
}
</style>