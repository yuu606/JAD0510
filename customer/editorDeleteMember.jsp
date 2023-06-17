<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Processing</title>
</head>
<body>
	<%@ page import="java.sql.*"%>

	<%
	int UserId = (int) session.getAttribute("sessUserID");
	String Editing = request.getParameter("submit");
	try {
		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/jad?user=root&password=urM@ther69420&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);
		Statement stmt = conn.createStatement();
		String sqlStr;
		out.print(Editing);
		if (Editing.equals("Delete")) {
			sqlStr = "delete from jad.users where User_Id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, UserId);
			int count = pstmt.executeUpdate();
			//out.println (count + " records deleted");
		
			response.sendRedirect("../Login.jsp");
		} else if (Editing.equals("confirm edit")) {
			sqlStr = "UPDATE jad.customers c, jad.users u set c.First_Name = ?,c.Last_Name= ?,c.Email = ? ,c.Address = ?,  u.Username= ?, u.Password=? where u.User_Id = ? AND u.User_Id = c.User_Id ";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			pstmt.setString(1, request.getParameter("first_name"));
			pstmt.setString(2, request.getParameter("last_name"));
			out.print(request.getParameter("last_name"));
			pstmt.setString(3, request.getParameter("Email"));
			pstmt.setString(4, request.getParameter("Address"));
			
			out.print(request.getParameter("Username"));
			pstmt.setString(5, request.getParameter("Username"));
			pstmt.setString(6, request.getParameter("Password"));
			pstmt.setInt(7, UserId);
			int count = pstmt.executeUpdate();
			 out.print("edt <br> "+count);
			 
			 session.removeAttribute("sessUserId");
			response.sendRedirect("membersPage.jsp");
		}
		conn.close();
	} catch (Exception e) {
		out.println("Error :" + e);
	}
	%>


</body>
</html>