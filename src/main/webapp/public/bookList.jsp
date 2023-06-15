<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Servlets.*"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "db1";
String userid = "root";
String password = "urM@ther69420";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Bookly</title>
	
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
		<%@ include file="../header.jsp"%>
		<div class="row align-items-center height">
			<div class="container-fluid d-flex flex-column">
				<div class="p-2">
					<ul class="list-group">
					<% 
						connection = DBConnect.getConnectionToDatabase();
						statement = connection.createStatement();
						String sql = "SELECT * FROM books";
						resultSet = statement.executeQuery(sql);
						
						while(resultSet.next()){ 
							String title = resultSet.getString("Title");
							String imgRef = resultSet.getString("Image_Ref");
							String ISBN = resultSet.getString("ISBN");%>
								<li class="list-group-item">
									<img src="<%= imgRef %>"/>
									<h3><%= ISBN %></h3>
									<a href="bookDetails.jsp?=<%= title %>"><%= title %></a>
								</li>
					<% } %>
					</ul>
				</div>
			</div>
			<div class="row">
				<%@include file="../footer.html" %>
			</div>
		</div>
</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>