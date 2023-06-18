<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Servlets.*"%>

<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>Book Details</title>

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
<!-- =======================================	
	 Author: Kuek Yi
	 Date:  5/6/2023
	 Description: ST0510/JAD CA1 Assignment
	 =======================================		 -->

<%
//Getting search results
String ISBN, Title, Author, Publisher, Publication_Date, Rating, genre_name, Description;
String results = "";
Double Price;
int Quantity;
String searched = request.getParameter("search");

ISBN = request.getParameter("ISBN");
try {
	Connection conn = DBConnect.getConnectionToDatabase();
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


<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<div class="container-fluid">
			<div class="sticky-top">
				<%@include file="header.jsp"%>
				<div class="row">
					<div
						class="px-3 p-2 text-success-emphasis bg-success-subtle border fw-bold">
						Now viewing:
						<div id="Title" class="fw-normal" style="display: inline"><%=Title%></div>
						BY
						<div id="Author" class="fw-normal" style="display: inline"><%=Author%></div>
					</div>
				</div>
			</div>
			<article class="container-fluid p-4 px-5">
				<div class="row">
					<div class="col-3">
						<img src='../Images/<%=ISBN%>.jpg'
							style="width: 90%; height: auto;">
					</div>
					<div class="col-9">
						<!--part 1 -->
						<div class="row">
							<button class="btn btn-success  text-nowrap col m-2"
								style="font-family: Monaco, monospace; font-weight: bold;"
								onclick="history.back()">Back</button>
							<button class="btn btn-success  text-nowrap col m-2"
								style="font-family: Monaco, monospace; font-weight: bold;"
								onclick="window.location.href ='../customer/shoppingCart.jsp'">Add
								to Cart</button>
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
		</div>
	</main>
	<%@include file="../footer.html"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<%
	if (request.getParameter("errCode") != null && (request.getParameter("errCode")).equals("404")) {
		out.print("sorry, we didn't manage to find anything that matched what you typed.");
	}
	%>
</body>
</html>