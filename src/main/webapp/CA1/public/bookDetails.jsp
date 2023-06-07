<!DOCTYPE html>

<head>

<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<title>SP DVD</title>

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
		</div>
		<div
			class="px-3 pt-2 text-success-emphasis bg-success-subtle border border-success-subtle fw-bold">
			Now viewing:
			<div id="Title" class="fw-normal" style="display: inline">Title
				about cats</div>
			BY
			<div id="Author" class="fw-normal" style="display: inline">AUTHOR</div>
		</div>
</body>

<article class="container-fluid p-4 px-5">
	<div class="row">
		<div class="col-3">
			<img
				src="https://images.unsplash.com/flagged/photo-1557427161-4701a0fa2f42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA==&w=1000&q=80"
				style="width: 90%; height: auto;">
		</div>
		<div class="col-9">
			<!--part 1 -->
			<div class="row"
				style="border-bottom: 1px solid; border-color: darkolivegreen;">
				<h3 id="Title" style="color: rgb(128, 0, 0);">Title about cats</h3>
				<h5 id="Author" style="color: rgb(15, 128, 0);">BY: AUTHOR</h5>
			</div>
			<div class="row"
				style="border-bottom: 1px solid; border-color: darkolivegreen;">
				<h3 class="display-6" id="Cost">$3.50</h3>
			</div>
			<div class="row"
				style="border-bottom: 1px solid; border-color: darkolivegreen;">
				<h5 style="color: darkblue;">Quantity: 33</h5>
			</div>

			<!--part 2 -->
			<div class="row"
				style="border-bottom: 1px solid; border-color: darkolivegreen; margin-top: 5%;">
				<h5 id="Genre" class="col-4">Genre: WWW</h5>
				<h5 id="Rating" class="col-2">Rating: PG</h5>
			</div>
			<div class="row"
				style="border-bottom: 1px solid; border-color: darkolivegreen; margin-top: 1%;">
				<h5 style="color: rgb(15, 128, 0);">Description:</h5>
				<p id="Description">EEEEEEEEEEEEEEEEEEEEEEE E EEE EEEEEE EEE
					EEEEEE EEEEEEEEEE EEEEEEEEEEEEEEE EEEEEEEEEEEEEEEEEEEEEE
					EEEEEEEEEEEEEEE EEEEE EEEEEEEE</p>
			</div>
			<div class="row row-cols-3"
				style="border-bottom: 1px solid; border-color: darkolivegreen; margin-top: 1%;">
				<h6 id="PublishBy" class="col">
					Published by:<br> Sir potato
				</h6>
				<h6 id="PublishOn" class="col">
					Published on (DD/MM/YY):<br> 10/10/2023
				</h6>
				<h6 id="ISBN" class="col">
					ISBN: <br>1023467310
				</h6>
			</div>
		</div>
	</div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	</html>