<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="Servlets.*"%>
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
<title>Edit Book</title>
</head>
<body>
	<%
	if (session.getAttribute("sessUserID") != null && session.getAttribute("sessUserID").equals("2")) {
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
	<%
	String ISBN;
	String Title;
	String Author;
	String Publisher;
	String Description;
	String Rating;
	double Price;
	int Quantity, genreID;
	Date date;
	String isbn1 = request.getParameter("isbn");
	%>
	<form name="Edit"
		action="${pageContext.request.contextPath}/ManageBooksServlet?command=update&ISBN1=<%=isbn1 %>"
		method="post">
		<div class="container-fluid p-3">
			<table class="table table-bordered table-hover">
				<%
				try {
					Connection connection = DBConnect.getConnectionToDatabase();
					String sql = "SELECT * FROM books WHERE ISBN = ?";

					System.out.println(isbn1);

					PreparedStatement psmt = connection.prepareStatement(sql);
					psmt.setString(1, isbn1);
					ResultSet rs = psmt.executeQuery();
					rs.next();
					ISBN = rs.getString("ISBN");
					Title = rs.getString("Title");
					Author = rs.getString("Author");
					Price = rs.getDouble("Price");
					Quantity = rs.getInt("Quantity");
					Publisher = rs.getString("Publisher");
					date = rs.getDate("Publication_Date");
					genreID = rs.getInt("Genre_Id");
					Rating = rs.getString("Rating");
					Description = rs.getString("Description");
				%>

				<tr>
					<td>ISBN:</td>
					<td><input class="form-control" type="text" name="ISBN2"
						value="<%=ISBN%>"></td>
				</tr>
				<tr>
					<td>Title:</td>
					<td><input class="form-control" type="text" name="Title"
						value="<%=Title%>"></td>
				</tr>
				<tr>
					<td>Author:</td>
					<td><input class="form-control" type="text" name="Author"
						value="<%=Author%>"></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input class="form-control" type="number" name="Price"
						value="<%=Price%>"></td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td><input class="form-control" type="number" name="Quantity"
						value="<%=Quantity%>"></td>
				</tr>
				<tr>
					<td>Publisher:</td>
					<td><input class="form-control" type="text" name="Publisher"
						value="<%=Publisher%>"></td>
				</tr>
				<tr>
					<td>Publication Date:</td>
					<td><input class="form-control" type="date"
						name="publicationDate" value="<%=date%>"></td>
				</tr>
				<tr>
					<td>Genre ID:</td>
					<td><input class="form-control" type="number" name="genreID"
						value="<%=genreID%>"></td>
				</tr>
				<tr>
					<td>Rating:</td>
					<td><input class="form-control" type="number" name="Rating"
						value="<%=Rating%>"></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><textarea class="form-control" name="Description"> <%=Description%></textarea></td>
				</tr>
				<tr>
					<td><input class="btn btn-success" type="submit"
						name="btnSubmit" value="Submit"></td>
				</tr>

				<%
				connection.close();
				} catch (Exception e) {
				e.printStackTrace();
				}
				}
				%>
			</table>
		</div>
	</form>

</body>
</html>
