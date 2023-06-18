<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<title>Transaction</title>
</head>
<body>
<%@page import="java.sql.*"%>
<% 
String Title;
Double Price;
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
	String sqlStr = "SELECT * FROM jad.books where Price > ?;";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setDouble(1,26.0);

	//out.println(pstmt);

	ResultSet rs = pstmt.executeQuery();

	// Step 6: Process Result
	while (rs.next()) {
		Title = rs.getString("Title");
		Price = rs.getDouble("Price");

		results += "<div class='card mb-3'><div class='card-body row'><h4 class='card-text col-10'><strong>"+ Title + "</strong></h4><p class='card-text col-2 lead' style='font-size: 24px;'><em>$"+Price+"</em></p></div></div>";
	}

	// Step 7: Close connection
	conn.close();
} catch (Exception e) {
	out.println("Error :" + e);
}
%>
	<%@ include file="header.jsp"%>
    <article class="container-fluid my-2 px-5">
        <h3 style="color: rgb(128, 0, 0);">Order Summary</h3>
<%=results %>

    </article>

</body>
<div class="sticky-bottom">
    <div class="px-3 pt-2 text-success-emphasis bg-success-subtle border border-success-subtle ">
        <div class="row">
            <div class="col-5 px-5">
                <h1 class="display-6">Total Cost: $121.96</h1>
            </div>
            <div class="col p-2">
                <button class="btn btn-success  text-nowrap col-12"
                    style="font-family: Monaco, monospace; font-weight: bold;">Confirm Payment</button>
            </div>
            <div class="col p-2">
                <button class="btn btn-secondary  text-nowrap col-12" onclick="window.location.href ='shoppingCart.jsp'"
                    style="font-family: Monaco, monospace; font-weight: bold;">Back to Cart</button>
            </div>
        </div>
    </div>

</div>
</body>
    <%@ include file="../footer.html"%>
</html>