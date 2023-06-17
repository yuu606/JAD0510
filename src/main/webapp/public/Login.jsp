<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<body >
	<div class="container-fluid">
		<div class="sticky-top row">
				<nav class="navbar" style="background-color: rgb(52, 78, 65);">
					<div class="container-fluid d-flex">
						<div class="p-2 flex-grow-1">
							<h3 style="font-family: Copperplate, fantasy; color: white; padding: 5px;">Bookly - Login</h3>
						</div>
						<div class="p-2" style="margin:10px;">
							<button class="btn btn-success  text-nowrap"
							style="font-family: Monaco, monospace; font-weight: bold;"
							onclick="window.location.href='signUp.jsp'">Sign Up</button>
						</div>
					</div>
				</nav>
			</div>
		<div class="row align-items-center height">
			<%if (session.getAttribute("sessUserID") != null){ %>
				<div class="p-2">
					<h1> You are already signed in</h1>
				</div>
			<%} else {%>
			<div class="container-fluid d-flex flex-column">
				<div class="p-2">
					<h3 class="text-center">
						<strong>Login to explore</strong>
					</h3>
				</div>
				
				<div class="p-2">
					<form action="${pageContext.request.contextPath}/VerifyUserServlet" method="post" id="Login-form" class="col-7"
						style="margin-left: auto; margin-right: auto;">
						<div class="container card p-3"
							style="background-color: rgb(218, 215, 205);">
							<div class="form-group p-1">
								<input type="text" class="form-control" name="username"
									placeholder="Username/Email" required="required">
							</div>
							<div class="form-group p-1">
								<input type="password" class="form-control" name="password"
									placeholder="Password" required="required">
							</div>
						</div>
						<div class="form-group mt-1 d-grid" id="enter">
							<button type="submit" class="btn btn-success btn-block">Login</button>
						</div>
						<div id="msg" style="color: rgb(255, 0, 0);">
							<%
							String message = request.getParameter("errCode");
							if (message != null && message.equals("invalidLogin")) {
								out.print("**Error in login");
							}
							%>
						</div>
					</form>
				</div>
			</div>
			<%} %>
		</div>
		<div class="row">
			<%@include file="../footer.html"%>
		</div>
	</div>
</body>
</html>

<style>
.height{
	min-height: 599px;
}
</style>