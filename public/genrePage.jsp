<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>Search Results - Genre</title>
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
</head>

<%@page import="java.sql.*"%>
<%@page import="Servlets.*"%>
<%
//User searched:
String searched = request.getParameter("search");

//test
//String searched = "a";

//Getting search results
String Title, Author, ISBN;
String results = "";
try {
	Connection conn = DBConnect.getConnectionToDatabase();
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
		+ "'\" style='max-width: 600px;'><div class='row g-0'><div class='col-md-3'><img src='../Images/" + ISBN
		+ ".jpg'style='width: auto;height:150px;' class='img-fluid rounded-start'></div><div class='col-md-9'><div class='card-body'><h5 class='card-title'>"
		+ Title + "</h5><p class='card-text'>By: " + Author + "<p></div></div></div></div>";
	}

	// Step 7: Close connection
	conn.close();
} catch (Exception e) {
	out.println("Error :" + e);
}
%>

<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<div class="container-fluid">
			<div class="sticky-top">
				<%@include file="header.jsp"%>
				<div class="row">
					<div
						class="px-3 p-2 text-success-emphasis bg-success-subtle border fw-bold">
						Genre:
						<div id="searchby" class="badge text-bg-success "
							style="font-size: 15px;"><%=searched%></div>
						<a href="Index.jsp">Search again?</a>
					</div>
				</div>
			</div>

			<article class="container-fluid my-2">
				<div class=" row justify-content-around g-0" id="Results">
					<%=results%>
				</div>
			</article>
		</div>
	</main>
	<%@include file="../footer.html"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>