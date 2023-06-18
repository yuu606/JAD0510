<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<!-- =======================================	
	 Author: Kuek Yi
	 Date:  5/6/2023
	 Description: ST0510/JAD CA1 Assignment
	 =======================================		 -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>

<%@page import="java.sql.*"%>
<%
//User searched:
String searched = request.getParameter("search");

String results = (String)session.getAttribute("searchRes");
%>

<body>
	<div class="sticky-top">
		<%@include file="header.jsp"%>
		<div
			class="px-3 pt-2 text-success-emphasis bg-success-subtle border border-success-subtle fw-bold">
			You searched
			<%=searched%>
			<a href="">Search again?</a>
		</div>

	</div>
	<article class="container-fluid my-2">
		<div class=" row justify-content-around g-0" id="Results">
			<%=results%>
		</div>
	</article>
	<%@include file="../footer.html"%>
</html>