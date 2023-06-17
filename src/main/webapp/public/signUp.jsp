<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
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
	<div class="col align-items-center height">
			<div class="sticky-top row">
				<nav class="navbar" style="background-color: rgb(52, 78, 65);">
					<div class="container-fluid d-flex">
						<div class="p-2 flex-grow-1">
							<h3 style="font-family: Copperplate, fantasy; color: white; padding: 5px;">Bookly - Sign Up</h3>
						</div>
						<div class="p-2" style="margin:10px;">
							<button class="btn btn-success  text-nowrap"
							style="font-family: Monaco, monospace; font-weight: bold;"
							onclick="window.location.href='Login.jsp'">Login</button>
						</div>
					</div>
				</nav>
			</div>
			<div class="container-fluid d-flex flex-column">
				<%if (session.getAttribute("sessUserID") != null){ %>
				<div class="p-2">
					<h1> You are already signed in</h1>
				</div>
				<%} else {%>
					<h3 class=" text-center"><strong>Sign up to start exploring</strong></h3>
				    <form action="processSignUp.jsp" method="post" id="Login-form">
				        <div class="container card p-3 col-7" style="background-color: rgb(218, 215, 205);">
				            <div class="form-group p-1">
				                <input type="text" class="form-control" name="username" placeholder="Username" required="required">
				            </div>
				            <div class="form-group p-1">
				                <input type="password" class="form-control" name="password" placeholder="Password" required="required">
				            </div>
				            <div class="form-group p-1">
				                <input type="email" class="form-control" name="email" placeholder="Email" required="required">
				            </div>
				            <div class="form-group p-1">
				                <input type="text" class="form-control" name="address" placeholder="Address" required="required">
				            </div>
				            <div class="form-group p-1">
				                <input type="text" class="form-control" name="firstName" placeholder="First Name" required="required">
				            </div>
				            <div class="form-group p-1">
				                <input type="text" class="form-control" name="lastName" placeholder="Last Name" required="required">
				            </div>
				        </div>
				        <div class="form-group mt-1 d-grid  col-7" id="enter" style="margin-left: auto;margin-right: auto;">
				            <button type="submit" class="btn btn-success btn-block">Sign Up</button>
				        </div>
				    </form>
				<%}%>
			</div>
			<div class="row">
				<%@include file="../footer.html" %>
			</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>

<style>
.height{
	min-height: 599px;
}
</style>