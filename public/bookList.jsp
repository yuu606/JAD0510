<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Servlets.*"%>
<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String results = "";
try {
	connection = DBConnect.getConnectionToDatabase();
	statement = connection.createStatement();
	String sql = "SELECT * FROM books";
	resultSet = statement.executeQuery(sql);

	while (resultSet.next()) {
		String Title = resultSet.getString("Title");
		String ISBN = resultSet.getString("ISBN");
		String Author = resultSet.getString("Author");

		results += " <div class='card mb-3' onclick=\"window.location.href='bookDetails.jsp?ISBN=" + ISBN
		+ "'\" style='max-width: 600px;'><div class='row g-0'><div class='col-md-3'><img src='../Images/" + ISBN
		+ ".jpg'style='width: auto;height:150px;' class='img-fluid rounded-start'></div><div class='col-md-9'><div class='card-body'><h5 class='card-title'>"
		+ Title + "</h5><p class='card-text'>By: " + Author + "<p></div></div></div></div>";
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>Bookly</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>
	<!-- 
=======================================	
Author: Chong Yu Lin
Date:  2023
Description: ST0510/JAD CA1 Assignment
=======================================
-->
	<div class="d-flex flex-column h-100">
		<%@ include file="header.jsp"%>
		<main class="flex-shrink-0">
			<div class="container-fluid d-flex flex-column">
				<article class="container-fluid p-2">
					<div class=" row justify-content-around g-0" id="Results">
						<%=results%>
					</div>
				</article>
			</div>
		</main>
		<%@include file="../footer.html"%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>