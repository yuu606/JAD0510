<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Servlets.*"%>
<!DOCTYPE html>
<html class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	
</head>
<title>Your Info</title>

</head>
<%@page import="java.sql.*"%>

<%
int UserId = (int)session.getAttribute("sessUserID");

String Email = "";
String First_Name = "";
String Last_Name = "";
String Address = "";
String Username = "";
String Password;
String results = "";
try {
	Connection conn = DBConnect.getConnectionToDatabase();
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
	//out.print(Address);
%>

<body class="d-flex flex-column h-100"> 
	<main class="flex-shrink-0">
		<div class="container-fluid">
			<%@ include file="header.jsp"%>
			<%if (session.getAttribute("sessUserID") != null) { %>
			<div class="d-flex align-items-center mb-2 justify-content-center height">
				<div class="p-2 w-100">
					<form name="memberprofile">
						<div class="input-group mb-3 ">
							<span class="input-group-text" name="first_name">First Name:</span>
							<input type="text" class="form-control" value='<%=First_Name%>'
								disabled>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" name="last_name">Last Name:</span> <input
								type="text" class="form-control" value='<%=Last_Name%>' disabled>
						</div>
		
						<div>
							<br>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" name="Email">Email:</span> <input
								type="text" class="form-control" value='<%=Email%>' disabled>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" name="Address">Address:</span> <input
								type="text" class="form-control" value="<%=Address%>" disabled>
						</div>
						<div>
							<br>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" name="Username">Username:</span> <input
								type="text" class="form-control" value='<%=Username%>' disabled>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" name="Password">Password:</span> <input
								type="text" class="form-control" value='<%=Password%>' disabled>
						</div>
					</form>
				</div>
		
				<div class="p-2 w-100">
					<button class="btn btn-secondary text-nowrap col-12 mb-3" 
					onclick="window.location.href='membersPageEdit.jsp?userID=<%=UserId %>'">Edit</button>
					<button class="btn btn-secondary  text-nowrap col-12" onclick="del()">Delete</button>
		
					<script>
						function del() {
							if (window
									.confirm("Are you sure you want to delete your account?")) {
								window.location.href = "editorDeleteMember.jsp?submit=Delete";
							}
						}
					</script>
				</div>
			</div>
			<%} else { %>
			<div class="row">
				<h2>You are not logged in as a customer</h2>
			</div>
			<% } %>
		</div>
	</main>
<%@include file="../footer.html"%>
</body>
<%
// Step 7: Close connection
conn.close();
} catch (Exception e) {
out.println("Error :" + e);
}
%>
</html>

<style>
.height{
	min-height: 590px;
}
</style>