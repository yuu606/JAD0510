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
<title>Book Details</title>

</head>
<!-- =======================================	
	 Author: Kuek Yi
	 Date:  5/6/2023
	 Description: ST0510/JAD CA1 Assignment
	 =======================================		 -->
<%@page import="java.sql.*"%>

<%
//Getting search results
String ISBN, Title, Author, Publisher, Publication_Date, Rating, genre_name, Description;
String results = "";
Double Price;
int Quantity;
String searched = request.getParameter("search");

ISBN = request.getParameter("ISBN");
try {
	// Step1: Load JDBC Driver
	Class.forName("com.mysql.jdbc.Driver");

	// Step 2: Define Connection URL
	String connURL = "jdbc:mysql://localhost/jad?user=root&password=urM@ther69420&serverTimezone=UTC";

	// Step 3: Establish connection to URL
	Connection conn = DriverManager.getConnection(connURL);
	// Step 4: Create Statement object
	Statement stmt = conn.createStatement();
	// Step 5: Execute SQL Command
	String sqlStr = "SELECT b.ISBN, b.Title, b.Author, b.Price, b.Quantity, b.Publisher, b.Publication_Date, b.Rating, g.genre_name,b.Description FROM jad.books b, jad.genre g where b.ISBN = ?  and  b.Genre_Id = g.genre_id;";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, ISBN);

	//out.println(pstmt);

	ResultSet rs = pstmt.executeQuery();

	// Step 6: Process Result
	rs.next();
	Title = rs.getString("Title");
	//out.println(Title);
	Author = rs.getString("Author");
	Price = rs.getDouble("Price");
	Quantity = rs.getInt("Quantity");
	Publisher = rs.getString("Publisher");
	Publication_Date = rs.getString("Publication_Date");
	Rating = rs.getString("Rating");
	genre_name = rs.getString("genre_name");
	Description = rs.getString("Description");

	results += " ";

	// Step 7: Close connection
%>


<body>
	<div class="sticky-top">
		<%@include file="../header.jsp"%>
		<div class="px-3 pt-2 text-success-emphasis bg-success-subtle border border-success-subtle fw-bold">
			Now viewing:
			<div id="Title" class="fw-normal" style="display: inline"><%=Title%></div>
			BY
			<div id="Author" class="fw-normal" style="display: inline"><%=Author%></div>
		</div>
		</div>
</body>

<article class="container-fluid p-4 px-5">
	<div class="row">
		<div class="col-3">
			<img src='../Images/<%=ISBN%>.jpg' style="width: 90%; height: auto;">
		</div>
		<div class="col-9">
			<!--part 1 -->
			<div class="row">
				<button class="btn btn-success  text-nowrap col m-2"
					style="font-family: Monaco, monospace; font-weight: bold;"
					onclick="history.back()">Back</button>
				<button class="btn btn-success  text-nowrap col m-2"
					style="font-family: Monaco, monospace; font-weight: bold;"
					onclick="window.location.href =''">Add to Cart</button>
			</div>
			<div class="row"
				style="border-bottom: 1px solid; border-color: darkolivegreen;">
				<h3 id="Title" style="color: rgb(128, 0, 0);"><%=Title%></h3>
				<h5 id="Author" style="color: rgb(15, 128, 0);">
					BY:
					<%=Author%></h5>
			</div>
			<div class="row"
				style="border-bottom: 1px solid; border-color: darkolivegreen;">
				<h3 class="display-6" id="Cost">
					$<%=Price%></h3>
			</div>
			<div class="row"
				style="border-bottom: 1px solid; border-color: darkolivegreen;">
				<h5 style="color: darkblue;">
					Quantity:
					<%=Quantity%></h5>
			</div>

			<!--part 2 -->
			<div class="row"
				style="border-bottom: 1px solid; border-color: darkolivegreen; margin-top: 5%;">
				<h5 id="Genre" class="col-4">
					Genre:
					<%=genre_name%></h5>
				<h5 id="Rating" class="col-2">
					Rating:
					<%=Rating%></h5>
			</div>
			<div class="row"
				style="border-bottom: 1px solid; border-color: darkolivegreen; margin-top: 1%;">
				<h5 style="color: rgb(15, 128, 0);">Description:</h5>
				<p id="Description"><%=Description%></p>
			</div>
			<div class="row row-cols-3"
				style="border-bottom: 1px solid; border-color: darkolivegreen; margin-top: 1%;">
				<h6 id="PublishBy" class="col">
					Published by:<br>
					<%=Publisher%>
				</h6>
				<h6 id="PublishOn" class="col">
					Published on (DD-MM-YY):<br>
					<%=Publication_Date%>
				</h6>
				<h6 id="ISBN" class="col">
					ISBN: <br><%=ISBN%>
				</h6>
			</div>
		</div>
	</div>
</article>
<%
conn.close();
} catch (Exception e) {
out.println("Error :" + e);
}
%>
<%@include file="../footer.html"%>
</html>