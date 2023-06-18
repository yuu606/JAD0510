<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Logged Out</title>
</head>
<body>

<div class="container-fluid">
	<div class="sticky-top">
		<%@include file="header.jsp"%>
	</div>
	<div class="row">
		<h1>You have been logged out</h1>
		<h2>Back to <a href="Index.jsp">home page</a></h2>
	</div>
</div>
<%session.invalidate();%>
</body>
</html>