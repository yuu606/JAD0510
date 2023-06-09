<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Your Info</title>

</head>
<%@page import="java.sql.*"%>

<%
int UserId;

session.setAttribute("sessUserID", 1);
UserId = (int) session.getAttribute("sessUserID");

String Email = "";
String First_Name = "";
String Last_Name = "";
String Address = "";
String Username = "";
String Password;
String results = "";
try {
	// Step1: Load JDBC Driver
	Class.forName("com.mysql.jdbc.Driver");

	// Step 2: Define Connection URL
	String connURL = "jdbc:mysql://localhost/jad?user=root&password=kairasql&serverTimezone=UTC";

	// Step 3: Establish connection to URL
	Connection conn = DriverManager.getConnection(connURL);
	// Step 4: Create Statement object
	Statement stmt = conn.createStatement();
	// Step 5: Execute SQL Command
	String sqlStr = "SELECT c.Email, c.First_Name, c.Last_Name, c.Address, u.Username, u.Password FROM jad.customers c, jad.users u WHERE c.User_Id = u.User_Id and c.User_Id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, UserId);

	//out.println(pstmt);

	ResultSet rs = pstmt.executeQuery();

	// Step 6: Process Result
	rs.next();
	Email = rs.getString("Email");
	First_Name = rs.getString("First_Name");
	Last_Name = rs.getString("Last_Name");
	Address = rs.getString("Address");
	Username = rs.getString("Username");
	Password = rs.getString("Password");
%>

<body>
	<div class="sticky-top">
		<nav class="navbar" style="background-color: rgb(52, 78, 65);">
			<div class="container-fluid justify-content-between">

				<h2 style="font-family: Copperplate, fantasy; color: white;">Your
					Information</h2>

				<div class="row">
					<div id="Actors" class="col"></div>
					<div id="Customers" class="col">
						<div id="GPLogin" class="col">
							<button class="btn btn-success  text-nowrap"
								style="font-family: Monaco, monospace; font-weight: bold;">Home</button>
						</div>
					</div>
					<div id="AdminLogin" class="col">
						<button class="btn btn-secondary  text-nowrap"
							style="font-family: Monaco, monospace; font-weight: bold;">Log
							Out</button>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<div class="row row-cols-2 p-5 container-fluid">
		<div class="col ">
			<form name="memberprofile">
				<div class="input-group mb-3 ">
					<span class="input-group-text" name="first_name">First Name:</span>
					<input type="text" class="form-control"
						value=<%out.println(First_Name);%> disabled>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" name="last_name">Last Name:</span> <input
						type="text" class="form-control" value=<%out.println(Last_Name);%>
						disabled>
				</div>

				<div>
					<br>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" name="Email">Email:</span> <input
						type="text" class="form-control" value=<%out.println(Email);%>
						disabled>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" name="Address">Address:</span> <input
						type="text" class="form-control" value=<%out.println(Address);%>
						disabled>
				</div>
				<div>
					<br>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" name="Username">Username:</span> <input
						type="text" class="form-control" value=<%out.println(Username);%>
						disabled>
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text" name="Password">Password:</span> <input
						type="text" class="form-control" value=<%out.println(Password);%>
						disabled>
				</div>
			</form>
		</div>

		<div class="col">
			<form action="MembersPageEdit.jsp" name="send" method="post">
				<input class="btn btn-secondary  text-nowrap col-12 mb-3"
					style="margin-top: 23%" type="submit" name="submit" value="Edit">
			</form>
				<button class="btn btn-secondary  text-nowrap col-12" onclick="del()">Delete</button>
			
			<script>
			function del(){
			if (window.confirm("Are you sure you want to delete your account?"))
			{
			window.location.href = "EditorDeleteMember.jsp?submit=Delete";
			} 
			}
			</script>
		</div>
	</div>
</body>
<%
// Step 7: Close connection
conn.close();
} catch (Exception e) {
out.println("Error :" + e);
}
%>
</html>