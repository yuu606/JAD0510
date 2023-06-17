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
	
<title>Result - Customer</title>
</head>
<body>
<div class="container-fluid">
	<%
	if (session.getAttribute("sessUserID") == null || !session.getAttribute("sessUserRole").equals(2)){	%>
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
	Connection connection = null;
	PreparedStatement psmt = null;
	String header = null;

	if (request.getParameter("deletedCust") != null) {
		String deletedCust = request.getParameter("deletedCust");
		out.print("You have deleted book" + deletedCust);
	} else {
		int userID = 0;
		String sql = "";
		if (request.getParameter("updatedCust") != null) {
			userID = Integer.parseInt(request.getParameter("updatedCust"));
			header = "Updated Customer Details";
		} else if (request.getParameter("newCust") != null) {
			userID = Integer.parseInt(request.getParameter("newCust"));
			header = "New Customer Added";
		}
		try {
			connection = DBConnect.getConnectionToDatabase();
			sql = "SELECT c.Customer_Id, c.Email, c.First_Name, c.Last_Name, c.Address, u.Username, u.Password FROM jad.customers c, jad.users u WHERE c.User_Id = u.User_Id and c.User_Id = ?";
			psmt = connection.prepareStatement(sql);
			psmt.setInt(1, userID);
			ResultSet rs = psmt.executeQuery(sql);
			while (rs.next()) {
		int custID = rs.getInt("Customer_Id");
		String Email = rs.getString("Email");
		String FirstName = rs.getString("First_Name");
		String LastName = rs.getString("Last_Name");
		String Address = rs.getString("Address");
		String Username = rs.getString("Username");
		String Password = rs.getString("Password");
	%>
	<h1><%=header%></h1>
	<table class="table table-bordered m-2">
		<tr>
			<td><%=custID%></td>
			<td><%=userID%></td>
			<td><%=Email%></td>
			<td><%=FirstName%></td>
			<td><%=LastName%></td>
			<td><%=Address%></td>
			<td><%=Username%></td>
			<td><%=Password%></td>
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
	%>
</div>
<%@include file="../footer.html" %>
</body>
</html>