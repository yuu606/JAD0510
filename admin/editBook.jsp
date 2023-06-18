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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<div class="container-fluid">
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
	        	 onclick="window.location.href='../LogOut_session.jsp?logOut=true'">Logout</button>
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
			action="manageBooks.jsp?command=update&ISBN1=<%=isbn1%>"
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
						<td><input class="form-control" type="number" step="0.01"
							min="0" name="Price" value="<%=Price%>"></td>
					</tr>
					<tr>
						<td>Quantity:</td>
						<td><input class="form-control" type="number" min="0"
							name="Quantity" value="<%=Quantity%>"></td>
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
							min="1" max="3" value="<%=genreID%>"></td>
					</tr>
					<tr>
						<td>Rating:</td>
						<td><input class="form-control" type="number" name="Rating"
							min="0" max="5" step="0.1" value="<%=Rating%>"></td>
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
	</div>
	<%@include file="../footer.html"%>
</body>
</html>