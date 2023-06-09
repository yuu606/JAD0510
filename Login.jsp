<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<!-- =======================================	
	 Author: Kuek Yi
	 Date:  4/6/2023
	 Description: ST0510/JAD CA1 Assignment
	 =======================================		 -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
</head>

<%@include file="header.html"%>
<body >
	<div class="p-3" >
		<h3 class=" text-center">
			<strong>Login to explore</strong>
		</h3>

		<form action="" id="Login-form" class="col-7"
			style="margin-left: auto; margin-right: auto;">
			<div class="container card p-3"
				style="background-color: rgb(218, 215, 205);">
				<div class="form-group p-1">
					<input type="text" class="form-control" id="username"
						placeholder="Email/Username" required="required">
				</div>
				<div class="form-group p-1">
					<input type="password" class="form-control" id="password"
						placeholder="Password" required="required">
				</div>
			</div>
			<div class="form-group mt-1 d-grid" id="enter">
				<button type="submit" class="btn btn-success btn-block">Log
					in</button>
			</div>
			<div id="msg" style="color: rgb(255, 0, 0);">
				<%
				String message = request.getParameter("errCode");
				if (message != null && message.equals("invalidLogin")) {
					//response.sendRedirect("login.jsp");
					out.print("**Error in login");
				}
				%>

			</div>
		</form>
	</div>
</body>
<%@include file="footer.html"%>
</html>