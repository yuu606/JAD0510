<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Logged Out</title>
</head>
<!-- 
=======================================	
Author: Chong Yu Lin
Date:  2023
Description: ST0510/JAD CA1 Assignment
=======================================
-->
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
	<div class="container-fluid height">
		<%@include file="header.jsp"%>
		<div class="row">
			<h1>You have been logged out</h1>
			<h2>Back to <a href="Index.jsp">home page</a></h2>
		</div>
	</div>
</main>
<%@include file="../footer.html" %>
<%session.invalidate();%>
</body>
</html>

<style>
.height{
	min-height: 595px;
}
</style>