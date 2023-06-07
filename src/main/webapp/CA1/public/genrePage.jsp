<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
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
					<h3 style="font-family: Copperplate, fantasy; color: white; padding: 5px;">Bookly - Book Details</h3>
				</div>
				<div class="p-2" style="margin:10px;">
					<div class="container-fluid d-flex align-items-center">
						<div class="p-2">
							<input type="text" name="searchValue" style="max-width: 300px; margin: 10px; height:30px;">
						</div>
						<div class="p-2">
							<input  class="row" type ="submit" value="Search" style="max-width:60px; height:30px;">
						</div>
					</div>
				</div>
				<% if (session.getAttribute("sessUserID") != null) { %>
					<div class="p-2" style="margin:10px;">
						<button class="btn btn-success  text-nowrap"
						style="font-family: Monaco, monospace; font-weight: bold;"
						onclick="window.location.href='logOut.jsp'">Logout</button>
					</div>
				<% } else { %>
					<div class="p-2" style="margin:10px;">
						<button class="btn btn-success  text-nowrap"
						style="font-family: Monaco, monospace; font-weight: bold;"
						onclick="window.location.href='Login.jsp'">Login</button>
					</div>
					<div class="p-2" style="margin:10px;">
						<button class="btn btn-success  text-nowrap"
						style="font-family: Monaco, monospace; font-weight: bold;"
						onclick="window.location.href='signUp.jsp'">Sign Up</button>
					</div>
				<% } %>
				</div>
			</nav>
		
        <div class="px-3 pt-2 text-success-emphasis bg-success-subtle border border-success-subtle fw-bold">
            Category: <div id="searchby" class="fw-normal"></div>Search again?
        </div>

    	</div>
        <article class="container-fluid">
        <div class=" row justify-content-around" id="Results">

            <div class="card col-5 my-1">
                <div class="card-body" onclick="">
                    <div style="float: left;padding-right: 5%;">
                        <img src="https://images.unsplash.com/flagged/photo-1557427161-4701a0fa2f42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA==&w=1000&q=80"
                            style="width: 5pc;height:auto;">
                    </div>
                    <h5 class="card-text" style="margin-top:1%;">HiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiHiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii</h5>
                </div>
            </div>
            <div class="card col-5 my-1">
                <div class="card-body" onclick="">
                    <div style="float: left;padding-right: 5%;">
                        <img src="https://images.unsplash.com/flagged/photo-1557427161-4701a0fa2f42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA==&w=1000&q=80"
                            style="width: 5pc;height:auto;">
                    </div>
                    <h5 class="card-text" style="margin-top:1%;">HiiiiiiiiiiiiiiiiiiiiiiiHiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii</h5>
                </div>
            </div>
            <div class="card col-5 my-1">
                <div class="card-body" onclick="">
                    <div style="float: left;padding-right: 5%;">
                        <img src="https://images.unsplash.com/flagged/photo-1557427161-4701a0fa2f42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA==&w=1000&q=80"
                            style="width: 5pc;height:auto;">
                    </div>
                    <h5 class="card-text" style="margin-top:1%;">Hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii</h5>
                </div>
            </div>
            <div class="card col-5 my-1">
                <div class="card-body" onclick="">
                    <div style="float: left;padding-right: 5%;">
                        <img src="https://images.unsplash.com/flagged/photo-1557427161-4701a0fa2f42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA==&w=1000&q=80"
                            style="width: 5pc;height:auto;">
                    </div>
                    <h5 class="card-text" style="margin-top:1%;">Hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii</h5>
                </div>
            </div>
        </div>
    </article>

</body>
</html>