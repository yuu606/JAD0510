<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
	<!-- =======================================	
	 Author: Kuek Yi
	 Date:  2023
	 Description: ST0510/JAD CA1 Assignment
	 =======================================		 -->
	 
	     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</head>
<body>
	<div class="sticky-top row">
		<nav class="navbar" style="background-color: rgb(52, 78, 65);">
			<div class="container-fluid d-flex">
				<div class="p-2 flex-grow-1">
					<h3 style="font-family: Copperplate, fantasy; color: white; padding: 5px;">Bookly - Login</h3>
				</div>
				<div class="p-2" style="margin:10px;">
					<button class="btn btn-success  text-nowrap"
					style="font-family: Monaco, monospace; font-weight: bold;"
					onclick="window.location.href='signUp.jsp'">Login</button>
				</div>
			</div>
		</nav>
	</div>
    <div class="p-3 ">
    <h3 class=" text-center"><strong>Login to explore</strong></h3>

    <form action="${pageContext.request.contextPath}/VerifyUserServlet" method="post" id="Login-form">
        <div class="container card p-3 col-7" style="background-color: rgb(218, 215, 205);">
            <div class="form-group p-1">
                <input type="text" class="form-control" id="username" placeholder="Email/Username" required="required">
            </div>
            <div class="form-group p-1">
                <input type="password" class="form-control" id="password" placeholder="Password" required="required">
            </div>
        </div>
        <div class="form-group mt-1 d-grid  col-7" id="enter" style="margin-left: auto;margin-right: auto;">
            <button type="submit" class="btn btn-success btn-block">Log in</button>
        </div>
    </form>

    <div id="msg"></div>
</div>

<% if (request.getParameter("errCode")!=null && (request.getParameter("errCode")).equals("invalidLogin")){
	out.print("You have entered an invalid ID/Password");
} %>
</body>
</html>