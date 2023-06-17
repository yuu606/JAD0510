<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Servlets.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result - Book</title>
</head>
<body>
<% 
Connection connection = null;
PreparedStatement psmt = null;
String ISBN = null;
String header = null;

if (request.getParameter("deletedBook") != null){
	String deletedISBN = request.getParameter("deletedBook");
	out.print("You have deleted book" + deletedISBN );
} else {
	if (request.getParameter("updatedBook") != null){
		ISBN = request.getParameter("updatedBook");
		header = "Updated Book Details";
	} else if (request.getParameter("newBook") != null){
		ISBN = request.getParameter("newBook");
		header = "New Book Added";
	}
	
	connection = DBConnect.getConnectionToDatabase();
	String sql ="SELECT * FROM books WHERE ISBN = ?";
	psmt = connection.prepareStatement(sql);
	psmt.setString(1, ISBN);
	ResultSet rs = psmt.executeQuery(sql);
	while(rs.next()){ 
		String isbn = rs.getString("ISBN");
		String Title = rs.getString("Title");
		String Author = rs.getString("Author");
		double Price = rs.getDouble("Price");
		int Quantity = rs.getInt("Quantity");
		String Publisher = rs.getString("Publisher");
		Date date = rs.getDate("Publication_Date");
		int genreID = rs.getInt("Genre_Id");
		double Rating = rs.getDouble("Rating");
		String Description = rs.getString("Description");
		String imgRef = rs.getString("Image_Ref"); %>
		<h1><%=header %></h1>
			<table>
				<tr>
					<td><%=isbn %></td>
					<td><%=Title %></td>
					<td><%=Author %></td>
					<td><%=Price %></td>
					<td><%=Quantity %></td>
					<td><%=Publisher %></td>
					<td><%=date %></td>
					<td><%=genreID %></td>
					<td><%=Rating %></td>
					<td><%=Description %></td>
					<td><img src="../Images/<%=imgRef %>"/></td>
				</tr>
			</table>
	<%	} 
}
%>

</body>
</html>