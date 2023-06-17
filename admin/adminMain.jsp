<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="Servlets.*"%>
<!DOCTYPE html>
<%@page import="java.io.File" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Bookly</title>
	
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	
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
		<div class="row align-items-center height">
			<div class="container-fluid d-flex flex-column">
				<div class="row">
					<button class="btn btn-success text-nowrap"
					style="font-family: Monaco, monospace; font-weight: bold;"
					onclick="window.location.href='uploadImageForm.jsp'">Add New Book</button>
				</div>
				<div class="row">
					<table class="table table-bordered table-hover">
						<% 
						try {
							Connection connection = DBConnect.getConnectionToDatabase();
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							String sql = null;
							
							sql = "SELECT * FROM books";
							pstmt = connection.prepareStatement(sql);
							rs = pstmt.executeQuery(); 
							while(rs.next()){
								String isbn = rs.getString("ISBN");
								String Title = rs.getString("Title");
								String Author = rs.getString("Author");
								double Price = rs.getDouble("Price");
								int Quantity = rs.getInt("Quantity");
								String Publisher = rs.getString("Publisher");
								Date date = rs.getDate("Publication_Date");
								int genreID = rs.getInt("Genre_Id");
								String Rating = rs.getString("Rating");
								String Description = rs.getString("Description");
							%>
								<tr>
								 	<td><%=isbn %></td>
								 	<td><%=Title %></td>
								 	<td><%=Author %></td>
								 	<td><%=Price %></td>
								 	<td><%=Quantity %></td>
								 	<td><%=Publisher %></td>
								 	<td><%=date %></td>
								 	<td><%=genreID %></td>
								 	<td><%=Rating %></td>
								 	<td><%=Description %></td>
								 	<td><a href="editBook.jsp?isbn=<%= isbn %>">Edit</a></td>
								 	<td><a href="${pageContext.request.contextPath}/ManageBooksServlet?command=delete&isbn=<%= isbn %>">Delete</a></td>
								 </tr>
							<% } 
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						} %>
						</table>
				</div>
				<div class="row">
					<button class="btn btn-success text-nowrap"
					style="font-family: Monaco, monospace; font-weight: bold;"
					onclick="window.location.href='addCustomerForm.jsp'">Add New Customer</button>
				</div>
				<div class="row">
					<table class="table table-bordered table-hover">
						<% 
						try {
							Connection connection = DBConnect.getConnectionToDatabase();
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							String sql = null;
							
							sql = "SELECT c.Customer_Id, c.Email, c.First_Name, c.Last_Name, c.Address, u.Username, u.Password, u.User_Id FROM jad.customers c, jad.users u WHERE c.User_Id = u.User_Id";
							pstmt = connection.prepareStatement(sql);
							rs = pstmt.executeQuery(); 
							while(rs.next()){
								int customerID = rs.getInt("Customer_Id");
								int userID = rs.getInt("User_Id");
								String Email = rs.getString("Email");
								String First_Name = rs.getString("First_Name");
								String Last_Name = rs.getString("Last_Name");
								String Address = rs.getString("Address");
								String Username = rs.getString("Username");
								String Password = rs.getString("Password");
							%>
								<tr>
								 	<td><%=customerID %></td>
								 	<td><%=Email %></td>
								 	<td><%=First_Name%></td>
								 	<td><%=Last_Name %></td>
								 	<td><%=Address %></td>
								 	<td><%=Username %></td>
								 	<td><%=Password %></td>
								 	<td><a href="editBook.jsp?userID=<%=userID %>&custID=<%=customerID %>">Edit</a></td>
								 	<td><a href="${pageContext.request.contextPath}/ManageUsersServlet?command=delete&custID=<%=customerID %>">Delete</a></td>
								 </tr>
							<% } 
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						} %>
						</table>
				</div>
			</div>
		</div>
		
	<%} %>
	</div>
	<%@include file="../footer.html" %>
</body>
</html>
