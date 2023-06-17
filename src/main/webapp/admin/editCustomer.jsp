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
<title>Edit Customer</title>
</head>
<body>
<% 
int userID1 = Integer.parseInt(request.getParameter("userID")); 
int custID1 = Integer.parseInt(request.getParameter("custID")); 
%>
<form name="Edit" action="${pageContext.request.contextPath}/ManageBooksServlet?command=update&custID1=<%=custID1 %>&userID1=<%=custID1 %>" method="post">
<table class="center">
	<%
	try{
		Connection connection = DBConnect.getConnectionToDatabase();
		String sql ="SELECT c.Email, c.First_Name, c.Last_Name, c.Address, u.Username, u.Password FROM jad.customers c, jad.users u WHERE c.User_Id = u.User_Id and c.User_Id = ?";
		PreparedStatement psmt = connection.prepareStatement(sql);
		psmt.setInt(1, userID1);
		ResultSet rs = psmt.executeQuery();
		while(rs.next()){ 
			String Email = rs.getString("Email");
			String Address = rs.getString("Address");
			String First_Name = rs.getString("First_Name");
			String Last_Name = rs.getString("Last_Name");
			String Username = rs.getString("Username");
			String Password = rs.getString("Password");
	%>
	<tr>
		<td>Customer ID:</td>
		<td><input type="text" name="custID2" value="<%=custID1 %>"></td>
	</tr>
	<tr>
		<td>User ID:</td>
		<td><input type="text" name="custID2" value="<%=userID1 %>"></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><input type="text" name="Email" value="<%=Email %>"></td>
	</tr>
	<tr>
		<td>Address:</td>
		<td><input type="text" name="Address" value="<%=Address %>"></td>
	</tr>
	<tr>
		<td>First Name:</td>
		<td><input type="number" name="FirstName" value="<%=First_Name%>"></td>
	</tr>
	<tr>
		<td>Last Name:</td>
		<td><input type="number" name="LastName" value="<%=Last_Name %>"></td>
	</tr>
	<tr>
		<td>Username:</td>
		<td><input type="text" name="Username" value="<%=Username %>"></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input type="date" name="Password" value="<%=Password %>"></td>
	</tr>
	<tr>
		<td><input type="submit" name="btnSubmit" value="Submit"></td>
	</tr>
	<% } 
	connection.close();
} catch (Exception e) {
	e.printStackTrace();
} %>
</table>
</form>

</body>
</html>