<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
</body>




<%@page import="java.sql.*"%>
<%
//User searched:
String searched = request.getParameter("search");

String results = (String) session.getAttribute("searchRes");
%>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<div class="container-fluid" style="min-height:87vh;">
	<div class="sticky-top">
				<%@include file="header.jsp"%>
				<div class="row">
					<div
						class="px-3 p-2 text-success-emphasis bg-success-subtle border fw-bold">
					You searched
					<%=searched%>
					<a href="Index.jsp">Search again?</a>
				</div>
			</div>
			</div>
			<article class=" d-flex flex-column container-fluid my-2">
				<div class=" row justify-content-around g-0" id="Results">
					<%=results%>
				</div>
			</article>
		</div>
	</main>
<%@include file="../footer.html"%>

</html>