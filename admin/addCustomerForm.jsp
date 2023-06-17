<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<title>Add Customer</title>
</head>
<body>
	<% if (session.getAttribute("sessUserID") != null && session.getAttribute("sessUserID").equals("2")){ %>
		<div class="sticky-top row">
			<nav class="navbar" style="background-color: rgb(52, 78, 65);">
					<div class="container-fluid d-flex">
						<div class="p-2 flex-grow-1">
							<h3 style="font-family: Copperplate, fantasy; color: white; padding: 5px;">Bookly</h3>
						</div>
						<div class="p-2" style="margin:10px;">
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
							<h3 style="font-family: Copperplate, fantasy; color: white; padding: 5px;">Bookly - Admin</h3>
						</div>
						<div class="p-2" style="margin:10px;">
							<button class="btn btn-success  text-nowrap"
							style="font-family: Monaco, monospace; font-weight: bold;"
							onclick="window.location.href='../public/logOut.jsp'">Logout</button>
						</div>
					</div>
				</nav>
			</div>
			<!-- -----------------END OF HEADER-----------------  -->
	<form name="Edit"
		action="${pageContext.request.contextPath}/ManageUsersServlet?command=add"
		method="post">
		<div class="container-fluid p-3">
			<table class="table table-bordered table-hover">
				<tr>
					<td>Email:</td>
					<td><input type="text" name="Email" class="form-control"></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><input type="text" name="Address" class="form-control"></td>
				</tr>
				<tr>
					<td>First Name:</td>
					<td><input type="number" name="FirstName" class="form-control"></td>
				</tr>
				<tr>
					<td>Last_Name:</td>
					<td><input type="number" name="LastName" class="form-control"></td>
				</tr>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="Username" class="form-control"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="date" name="Password" class="form-control"></td>
				</tr>
				<tr>
					<td><input type="submit" name="btnSubmit" value="Submit"
						class="btn btn-success"></td>
				</tr>
			</table>
		</div>
	</form>
<%} %>
</body>
</html>