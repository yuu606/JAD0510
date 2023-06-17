<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<title>Your Cart</title>

</head>

<%@page import="java.sql.*"%>
<% 
String Title, Author, ISBN;
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
		Author = rs.getString("Author");
		ISBN = rs.getString("ISBN");
		Price = rs.getDouble("Price");

		results += " <div class='card mb-3' style='max-width: 600px;'><div class='row g-0'><div class='col-md-3'><img src='../Images/" + ISBN
		+ ".jpg'style='width: auto;height:195px;' class='img-fluid rounded-start'></div><div class='col-md-9'><div class='card-body'><h5 class='card-title'>"
		+ Title + "</h5><p class='card-text'>By: " + Author + "</p><p class='card-text'><em>$"+Price+"</em></p><button class='btn btn-secondary  text-nowrap col-12'>Remove</button></div></div></div></div>";
	}

	// Step 7: Close connection
	conn.close();
} catch (Exception e) {
	out.println("Error :" + e);
}
%>

<body>
		
	<div class="sticky-top "><%@ include file="header.jsp"%>
		<div
			class="px-3 pt-2 text-success-emphasis bg-success-subtle border border-success-subtle ">
			<div class="row">
				<div class="col">
					<h1 class="display-6">Total Cost: $121.96</h1>
				</div>
				<div class="col">
					<h1 class="display-6">You have: $300.50</h1>
				</div>
				<div class="col pb-2">
					<button class="btn btn-secondary  text-nowrap col-12"
						style="font-family: Monaco, monospace; font-weight: bold;">Check
						Out</button>
				</div>
			</div>
		</div>
	</div>
	<article class="container-fluid my-2">
		<div class=" row justify-content-around g-0" id="Results">
			<%=results%>

		</div>
		</article>
</body>