<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="Servlets.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection connection = null;
PreparedStatement psmt = null;
ResultSet resultSet = null;

String username = request.getParameter("username");
String password = request.getParameter("password");
String path = "";

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

String sql2 = "INSERT INTO users (Username, Password, Role_Id) VALUES (?,?,1);";
psmt = connection.prepareStatement(sql2);
psmt.setString(1, username);
psmt.setString(2, password);
psmt.executeUpdate();

String sql3 = "SELECT User_Id FROM users WHERE username = ?";
psmt = connection.prepareStatement(sql3);
psmt.setString(1, username);
resultSet = psmt.executeQuery();
while(resultSet.next()){
	int userID = resultSet.getInt("User_Id");
	path = "membersPage.jsp?userID=" + userID;
	response.sendRedirect(path);
	
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>