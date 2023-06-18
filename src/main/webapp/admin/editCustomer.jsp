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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	
<title>Edit Customer</title>
</head>
<body>
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
	<%
	int userID1 = Integer.parseInt(request.getParameter("userID"));
	int custID1 = Integer.parseInt(request.getParameter("custID"));
	%>
	<form name="Edit"
		action="manageUsers.jsp?command=update&custID1=<%=custID1 %>&userID1=<%=custID1 %>"
		method="post">
		<div class="container-fluid p-3">
			<table class="table table-bordered table-hover">
				<%
				try {
					Connection connection = DBConnect.getConnectionToDatabase();
					String sql = "SELECT c.Email, c.First_Name, c.Last_Name, c.Address, u.Username, u.Password FROM jad.customers c, jad.users u WHERE c.User_Id = u.User_Id and c.User_Id = ?";
					PreparedStatement psmt = connection.prepareStatement(sql);
					psmt.setInt(1, userID1);
					ResultSet rs = psmt.executeQuery();
					while (rs.next()) {
						String Email = rs.getString("Email");
						String Address = rs.getString("Address");
						String First_Name = rs.getString("First_Name");
						String Last_Name = rs.getString("Last_Name");
						String Username = rs.getString("Username");
						String Password = rs.getString("Password");
				%>

				<tr>
					<td>Customer ID:</td>
					<td><input class="form-control" type="text" name="custID2"
						value="<%=custID1%>"></td>
				</tr>
				<tr>
					<td>User ID:</td>
					<td><input class="form-control" type="text" name="custID2"
						value="<%=userID1%>"></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input class="form-control" type="email" name="Email"
						value="<%=Email%>"></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><input class="form-control" type="text" name="Address"
						value="<%=Address%>"></td>
				</tr>
				<tr>
					<td>First Name:</td>
					<td><input class="form-control" type="text" name="FirstName"
						value="<%=First_Name%>"></td>
				</tr>
				<tr>
					<td>Last Name:</td>
					<td><input class="form-control" type="text" name="LastName"
						value="<%=Last_Name%>"></td>
				</tr>
				<tr>
					<td>Username:</td>
					<td><input class="form-control" type="text" name="Username"
						value="<%=Username%>"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input class="form-control" type="text" name="Password"
						value="<%=Password%>"></td>
				</tr>
				<tr>
					<td><input class="btn btn-success" type="submit"
						name="btnSubmit" value="Submit"></td>
				</tr>
				<%
				}
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