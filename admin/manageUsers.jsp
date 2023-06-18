<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="Servlets.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection connection = null;
String command = request.getParameter("command");
String sql = null;
String path = "";
PreparedStatement pstmt;

try{
	connection = DBConnect.getConnectionToDatabase();
	int userID;
	switch(command) {
	case "delete":
		userID = Integer.parseInt(request.getParameter("userID"));
		String sql1 = "DELETE FROM users WHERE users.User_Id = ?";
		pstmt = connection.prepareStatement(sql1);
		pstmt.setInt(1, userID);
		pstmt.executeUpdate();

		path = "resultCustomer.jsp?deletedCust=" + userID;
		break;
	case "update":
		int userID1 = Integer.parseInt(request.getParameter("userID1"));
		int userID2 = Integer.parseInt(request.getParameter("userID2"));
		String Username = request.getParameter("Username");
		String Password = request.getParameter("Password");
		
		sql1 = "UPDATE users SET User_Id = ?, Username = ?, Password = ? WHERE User_Id = ?";
		pstmt = connection.prepareStatement(sql1);
		pstmt.setInt(1, userID2);
		pstmt.setString(2, Username);
		pstmt.setString(3, Password);
		pstmt.setInt(4, userID1);
		
		int custID1 = Integer.parseInt(request.getParameter("custID1"));
		int custID2 = Integer.parseInt(request.getParameter("custID2"));

		String email = request.getParameter("Email");
		String address = request.getParameter("Address");
		String firstName = request.getParameter("FirstName");
		String lastName = request.getParameter("LastName");
		
		String sql2 = "UPDATE customers SET Customer_Id = ?, User_Id = ?, Email = ?, Address = ?, First_Name = ?, Last_Name = ? WHERE Customer_Id = ?;";
		pstmt = connection.prepareStatement(sql2);
		pstmt.setInt(1, custID2);
		pstmt.setInt(2, userID2);
		pstmt.setString(3, email);
		pstmt.setString(4, address);
		pstmt.setString(5, firstName);
		pstmt.setString(6, lastName);
		pstmt.setInt(7, custID1);
		
		pstmt.executeUpdate();
		path = "resultCustomer.jsp?updatedCust=" + userID2;
		break;
	case "add":
		String username = request.getParameter("Username");
		String password = request.getParameter("Address");
		
		sql1 = "INSERT INTO users (Username, Password, Role_Id) VALUES (?,?,1)";
		pstmt = connection.prepareStatement(sql1);
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		pstmt.executeUpdate();
		
		sql2 = "SELECT users.User_Id FROM jad.users WHERE Username = ?";
		pstmt = connection.prepareStatement(sql2);
		pstmt.setString(1, username);
		ResultSet rs = pstmt.executeQuery();
		
		userID = rs.getInt("User_Id");
		email = request.getParameter("Email");
		address = request.getParameter("Address");
		firstName = request.getParameter("FirstName");
		lastName = request.getParameter("LastName");
		
		String sql3 = "INSERT INTO customers (User_Id, Email, Address, First_Name, Last_Name) VALUES (?,?,?,?,?)";
		pstmt = connection.prepareStatement(sql3);
		pstmt.setInt(1, userID);
		pstmt.setString(2, email);
		pstmt.setString(3, address);
		pstmt.setString(4, firstName);
		pstmt.setString(5, lastName);
		pstmt.executeUpdate();
		
		pstmt.executeUpdate();
		path = "resultCustomer.jsp?newCust=" + userID;
		break;
	}
	
	response.sendRedirect(path);
	connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>