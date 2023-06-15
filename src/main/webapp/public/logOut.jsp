<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logged Out</title>
</head>
<body>
<%session.invalidate();%>
<div class="container-fluid">
	<div class="sticky-top">
		<%@include file="../header.jsp"%>
	</div>
	<div class="row">
		<h1>You have been logged out</h1>
		<h2>Back to <a href="public/Index.jsp">home page</a></h2>
	</div>
</div>
</body>
</html>