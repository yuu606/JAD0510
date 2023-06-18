<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Servlets.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	
<title>Result - Book</title>
</head>
<body>
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
							onclick="window.location.href='adminMain.jsp'">Admin Home</button>
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
		<%
		Connection connection = null;
		PreparedStatement psmt = null;
		String ISBN = null;
		String header = null;

		if (request.getParameter("deletedBook") != null) {
			String deletedISBN = request.getParameter("deletedBook");
			out.print("You have deleted book");
		} else {
			if (request.getParameter("updatedBook") != null) {
				ISBN = request.getParameter("updatedBook");
				header = "Updated Book Details";
			} else if (request.getParameter("newBook") != null) {
				ISBN = request.getParameter("newBook");
				header = "New Book Added";
			}
			try {
				connection = DBConnect.getConnectionToDatabase();
				String sql = "SELECT * FROM books WHERE ISBN = ?";
				psmt = connection.prepareStatement(sql);
				psmt.setString(1, ISBN);
				ResultSet rs = psmt.executeQuery();
				while (rs.next()) {
				String isbn = rs.getString("ISBN");
				String Title = rs.getString("Title");
				String Author = rs.getString("Author");
				double Price = rs.getDouble("Price");
				int Quantity = rs.getInt("Quantity");
				String Publisher = rs.getString("Publisher");
				Date date = rs.getDate("Publication_Date");
				int genreID = rs.getInt("Genre_Id");
				double Rating = rs.getDouble("Rating");
				String Description = rs.getString("Description");
			%>
			<h2><%=header%></h2>
			<table class="table table-bordered m-2">
				<thead>
					<tr>
						<th scope="col">ISBN</th>
						<th scope="col">Title</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Quantity</th>
						<th scope="col">Publisher</th>
						<th scope="col">Publication Date</th>
						<th scope="col">Genre ID</th>
						<th scope="col">Rating</th>
						<th scope="col">Description</th>
					</tr>
				</thead>
				<tr>
					<td><%=isbn%></td>
					<td><%=Title%></td>
					<td><%=Author%></td>
					<td><%=Price%></td>
					<td><%=Quantity%></td>
					<td><%=Publisher%></td>
					<td><%=date%></td>
					<td><%=genreID%></td>
					<td><%=Rating%></td>
					<td><%=Description%></td>
				</tr>
			</table>
			<%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			}
			}
			;
			%>
	</div>
</body>
<%@include file="../footer.html" %>
</html>