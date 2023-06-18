<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>Sign Up</title>

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
<body class="d-flex flex-column h-100">
	<!-- 
=======================================	
Author: Chong Yu Lin
Date:  2023
Description: ST0510/JAD CA1 Assignment
=======================================
-->
<main class="flex-shrink-0">
	<div class="container-fluid" style="min-height:87vh;">
		<%@include file="header.jsp"%>
		<div class="row align-items-center height">
				<%
				if (session.getAttribute("sessUserID") != null) {
				%>
				<div class="p-2">
					<h1>You are already signed in</h1>
				</div>
				<%} else {%>
				<div class="container-fluid d-flex flex-column">
					<div class="p-2 mt-3">
						<h3 class=" text-center">
							<strong>Sign up to start exploring</strong>
						</h3>
					</div>
					
					<div class="p-2">
						<form action="processSignUp.jsp"
						method="post" id="Login-form" class="col-7"
						style="margin-left: auto; margin-right: auto;">
						<div class="container card p-3"
							style="background-color: rgb(218, 215, 205);">
							<div class="form-group p-1">
								<input type="text" class="form-control" name="username"
									placeholder="Username" required="required">
							</div>
							<div class="form-group p-1">
								<input type="password" class="form-control" name="password"
									placeholder="Password" required="required">
							</div>
							<div class="form-group p-1">
								<input type="email" class="form-control" name="email"
									placeholder="Email" required="required">
							</div>
							<div class="form-group p-1">
								<input type="text" class="form-control" name="address"
									placeholder="Address" required="required">
							</div>
							<div class="form-group p-1">
								<input type="text" class="form-control" name="firstName"
									placeholder="First Name" required="required">
							</div>
							<div class="form-group p-1">
								<input type="text" class="form-control" name="lastName"
									placeholder="Last Name" required="required">
							</div>
						</div>
						<div class="form-group mt-1 d-grid" id="enter">
							<button type="submit" class="btn btn-success btn-block">Sign Up</button>
						</div>
						<div id="msg" style="color: rgb(255, 0, 0);">
							<%
							String message = request.getParameter("errCode");
							if (message != null && message.equals("userExists")) {
								out.print("**User already exists");
							}
							%>
						</div>
					</form>
					</div>
				</div>
			</div>
			<%}%>
		</div>
</main>
<%@include file="../footer.html"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>

<style>
.height {
	min-height: 599px;
}
</style>