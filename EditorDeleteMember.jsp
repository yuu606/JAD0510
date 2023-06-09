<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Processing</title>
</head>
<body>
	<%@ page import="java.sql.*"%>

	<%
	String Editing = request.getParameter("submit");
	try {
		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/jad?user=root&password=kairasql&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);
		Statement stmt = conn.createStatement();
		String sqlStr;
		out.print(Editing);
		if (Editing.equals("Delete")) {
			sqlStr = "delete from jad.users where User_Id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, 4);
		    int count = pstmt.executeUpdate();
		    // ===STEP 6
		    out.println (count + " records deleted");

	} else if (Editing.equals("confirm edit")) {
	sqlStr = "UPDATE jad.customers c, jad.users u set c.Email = ? ,c.Address = ?, c.First_Name = ?,c.Last_Name= ?, u.Username= ?, u.Password=? where u.User_Id = ? AND u.User_Id = c.User_Id ";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	//pstmt.setInt(1, UserId);
	}
	conn.close();
	} catch (Exception e) {
	out.println("Error :" + e);
	}
	%>


</body>
</html>