<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<title>Add Book</title>
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
	<%
	if (session.getAttribute("sessUserID") == null || !session.getAttribute("sessUserRole").equals(2)){ %>
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
	<form name="Edit"
		action="${pageContext.request.contextPath}/ManageBooksServlet?command=add"
		method="post">
		<div class="container-fluid p-3">
			<table class="table table-bordered table-hover">
				<tr>
					<td>ISBN:</td>
					<td><input class="form-control" type="text" name="ISBN"></td>
				</tr>
				<tr>
					<td>Title:</td>
					<td><input class="form-control" type="text" name="Title"></td>
				</tr>
				<tr>
					<td>Author:</td>
					<td><input class="form-control" type="text" name="Author"></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input class="form-control" type="number" step="0.01" name="Price" min="0"></td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td><input class="form-control" type="number" name="Quantity" min="0"></td>
				</tr>
				<tr>
					<td>Publisher:</td>
					<td><input class="form-control" type="text" name="Publisher"></td>
				</tr>
				<tr>
					<td>Publication Date:</td>
					<td><input class="form-control" type="date"
						name="publicationDate"></td>
				</tr>
				<tr>
					<td>Genre ID:</td>
					<td><input class="form-control" type="number" name="genreID"  min="1" max="3"></td>
				</tr>
				<tr>
					<td>Rating:</td>
					<td><input class="form-control" type="number" name="Rating"  min="0" max="5" step="0.1"></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><textarea class="form-control"
						name="Description"></textarea>
				</tr>
				<tr>
					<td>Image File:</td>
					<td><input class="form-control" type="file" name="imageFile" /></td>
				</tr>
				<tr>
					<td>Image Reference:</td>
					<td><input class="form-control" type="text" name="imageRef"></td>
				</tr>
				<tr>
					<td><input class="btn btn-success" type="submit"
						name="btnSubmit" value="Add"></td>
				</tr>
			</table>
		</div>
	</form>
	<%
	}
	%>
	</div>
	<%@include file="../footer.html" %>
</body>
</html>