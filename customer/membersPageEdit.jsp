<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Servlets.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	
<title>Your Info</title>

</head>
<%@page import="java.sql.*"%>

<%
int UserId;
UserId = Integer.parseInt(request.getParameter("userID"));

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
%>

<body>

	<div class="container-fluid">
		<%@ include file="header.jsp"%>
		<div class="m-5">
			<form action="editorDeleteMember.jsp" name="send" method="post"
				class="row row-cols-2">
				<div class="col">
					<div class="input-group mb-3 ">
						<span class="input-group-text">First Name:</span> <input
							type="text" class="form-control" name="first_name"
							value='<%=First_Name%>'>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">Last Name:</span> <input
							type="text" class="form-control" name="last_name"
							value='<%=Last_Name%>'>
					</div>

					<div>
						<br>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">Email:</span> <input type="email"
							class="form-control" name="Email" value='<%=Email%>'>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">Address:</span> <input type="text"
							class="form-control" name="Address" value='<%=Address%>'>
					</div>
					<div>
						<br>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">Username:</span> <input type="text"
							class="form-control" name="Username" value='<%=Username%>'>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">Password:</span> <input type="text"
							class="form-control" name="Password" value='<%=Password%>'>
					</div>
				</div>
				<div class="col">
					<input class="btn btn-secondary col-12 text-nowrap mb-3 "
						style="margin-top: 23%" type="submit" name="submit"
						value="confirm edit">

					<button class="btn btn-secondary  text-nowrap col-12 "
						type='button' onclick="window.location.href='membersPage.jsp'">Back</button>
				</div>
			</form>
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
<%@include file="../footer.html"%>
</html>