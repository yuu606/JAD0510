<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
<!-- =======================================	
	 Author: Kuek Yi
	 Date:  6/6/2023
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

<%@page import="java.sql.*"%>
<%
//User searched:
String searched = request.getParameter("search");

//test
//String searched = "a";

//Getting search results
String Title, Author, ISBN;
String results = "";
try {
	// Step1: Load JDBC Driver
	Class.forName("com.mysql.jdbc.Driver");

	// Step 2: Define Connection URL
	String connURL = "jdbc:mysql://localhost/jad?user=root&password=kairasql&serverTimezone=UTC";

	// Step 3: Establish connection to URL
	Connection conn = DriverManager.getConnection(connURL);
	// Step 4: Create Statement object
	Statement stmt = conn.createStatement();
	// Step 5: Execute SQL Command
	String sqlStr = "SELECT Title, Author, ISBN FROM jad.books b, jad.genre g WHERE b.Genre_Id= g.genre_id AND g.genre_name like ?";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, searched);

	//out.println(pstmt);

	ResultSet rs = pstmt.executeQuery();

	// Step 6: Process Result
	while (rs.next()) {
		Title = rs.getString("Title");
		Author = rs.getString("Author");
		ISBN = rs.getString("ISBN");

		results += " <div class='card mb-3' onclick=\"window.location.href='bookDetails.jsp?ISBN=" + ISBN
		+ "'\" style='max-width: 600px;'><div class='row g-0'><div class='col-md-3'><img src='https://images.unsplash.com/flagged/photo-1557427161-4701a0fa2f42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA==&w=1000&q=80'style='width: auto;height:150px;' class='img-fluid rounded-start'></div><div class='col-md-9'><div class='card-body'><h5 class='card-title'>"
		+ Title + "</h5><p class='card-text'>By: " + Author + "<p></div></div></div></div>";
	}

	// Step 7: Close connection
	conn.close();
} catch (Exception e) {
	out.println("Error :" + e);
}
%>

<body>
	<div class="sticky-top">
		<nav class="navbar" style="background-color: rgb(52, 78, 65);">
			<div class="container-fluid justify-content-between">

				<h2 style="font-family: Copperplate, fantasy; color: white;">Search
					Results</h2>

				<div class="row">
					<div id="Actors" class="col"></div>
					<div id="Customers" class="col">
						<div id="GPLogin" class="col">
							<button class="btn btn-success  text-nowrap"
								style="font-family: Monaco, monospace; font-weight: bold;">Login</button>
						</div>
					</div>
					<div id="AdminLogin" class="col">
						<button class="btn btn-secondary  text-nowrap"
							style="font-family: Monaco, monospace; font-weight: bold;">Sign
							Up</button>
					</div>
				</div>
			</div>
		</nav>
		<div>
			<div
				class="px-3 p-2 text-success-emphasis bg-success-subtle border border-success-subtle fw-bold">
				Genre:
				<div id="searchby" class="badge text-bg-success "
					style="font-size: 15px;"><%=searched%></div>
				<a href="">Search again?</a>
			</div>
		</div>

	</div>

	</div>
	<article class="container-fluid my-2">
		<div class=" row justify-content-around g-0" id="Results">
			<%=results%>

		</div>
	</article>
	<%@include file="footer.html"%>
</html>