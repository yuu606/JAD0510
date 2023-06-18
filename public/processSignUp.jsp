<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="Servlets.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<%
Connection connection = null;
PreparedStatement psmt = null;
ResultSet resultSet = null;

String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");
String path = "";
int userRole = 1;

try{
connection = DBConnect.getConnectionToDatabase();
Statement statement = connection.createStatement();
String sql = "SELECT * FROM users";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
	
	if (username.equals(resultSet.getString("Username"))){
		path = "signUp.jsp?errCode=userExists";
		response.sendRedirect(path);
	} 
}

String sql2 = "INSERT INTO users (Username, Password, Role_Id) VALUES (?,?,?);";
psmt = connection.prepareStatement(sql2);
psmt.setString(1, username);
psmt.setString(2, password);
psmt.setInt(3, userRole);
psmt.executeUpdate();

String sql3 = "SELECT User_Id FROM users WHERE Username = ?";
psmt = connection.prepareStatement(sql3);
psmt.setString(1, username);
resultSet = psmt.executeQuery();
resultSet.next();
int userID = resultSet.getInt("User_Id");

String sql4 = "INSERT INTO customers (User_Id, Email) VALUES (?,?);";
psmt = connection.prepareStatement(sql4);
psmt.setInt(1, userID);
psmt.setString(2, email);
psmt.executeUpdate();

session = request.getSession();
session.setAttribute("sessUserID", userID);
session.setAttribute("sessUserRole", userRole);

path = "../customer/membersPage.jsp?userID=" + userID;
response.sendRedirect(path);

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>