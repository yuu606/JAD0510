<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Servlets.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result - Customer</title>
</head>
<body>
<% 
Connection connection = null;
PreparedStatement psmt = null;
String header = null;

if (request.getParameter("deletedCust") != null){
	String deletedCust = request.getParameter("deletedCust");
	out.print("You have deleted book" + deletedCust );
} else {
	int userID = 0;
	String sql = "";
	if (request.getParameter("updatedCust") != null){
		userID = Integer.parseInt(request.getParameter("updatedCust"));
		header = "Updated Customer Details";
	} else if (request.getParameter("newCust") != null){
		userID = Integer.parseInt(request.getParameter("newCust"));
		header = "New Customer Added";
	}
	
	connection = DBConnect.getConnectionToDatabase();
	sql = "SELECT c.Customer_Id, c.Email, c.First_Name, c.Last_Name, c.Address, u.Username, u.Password FROM jad.customers c, jad.users u WHERE c.User_Id = u.User_Id and c.User_Id = ?";
	psmt = connection.prepareStatement(sql);
	psmt.setInt(1, userID);
	ResultSet rs = psmt.executeQuery(sql);
	while(rs.next()){ 
		int custID = rs.getInt("Customer_Id");
		String Email = rs.getString("Email");
		String FirstName = rs.getString("First_Name");
		String LastName = rs.getString("Last_Name");
		String Address = rs.getString("Address");
		String Username = rs.getString("Username");
		String Password = rs.getString("Password");
		%>
		<h1><%=header %></h1>
			<table>
				<tr>
					<td><%=custID %></td>
					<td><%=userID %></td>
					<td><%=Email %></td>
					<td><%=FirstName %></td>
					<td><%=LastName %></td>
					<td><%=Address %></td>
					<td><%=Username %></td>
					<td><%=Password %></td>
				</tr>
			</table>
	<%	} 
}
%>

</body>
</html>