<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="Servlets.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Book</title>
</head>
<body>
<% 
String ISBN;
String Title;
String Author;
String Publisher;
String Description;
String Rating;
double Price;
int Quantity, genreID;
Date date;
String isbn1 = request.getParameter("isbn"); %>
<form name="Edit" action="${pageContext.request.contextPath}/ManageBooksServlet?command=update&ISBN1=<%=isbn1 %>" method="post">
<table class="center">
	<%
	try{
		Connection connection = DBConnect.getConnectionToDatabase();
		String sql ="SELECT * FROM books WHERE ISBN = ?";
		PreparedStatement psmt = connection.prepareStatement(sql);
		psmt.setString(1, isbn1);
		ResultSet rs = psmt.executeQuery(sql);
		rs.next();
		ISBN = rs.getString("ISBN");
		Title = rs.getString("Title");
		Author = rs.getString("Author");
		Price = rs.getDouble("Price");
		Quantity = rs.getInt("Quantity");
		Publisher = rs.getString("Publisher");
		date = rs.getDate("Publication_Date");
		genreID = rs.getInt("Genre_Id");
		Rating = rs.getString("Rating");
		Description = rs.getString("Description"); %>
	<tr>
		<td>ISBN:</td>
		<td><input type="text" name="ISBN2" value="<%=ISBN %>"></td>
	</tr>
	<tr>
		<td>Title:</td>
		<td><input type="text" name="Title" value="<%=Title %>"></td>
	</tr>
	<tr>
		<td>Author:</td>
		<td><input type="text" name="Author" value="<%=Author %>"></td>
	</tr>
	<tr>
		<td>Price:</td>
		<td><input type="number" name="Price" value="<%=Price %>"></td>
	</tr>
	<tr>
		<td>Quantity:</td>
		<td><input type="number" name="Quantity" value="<%=Quantity %>"></td>
	</tr>
	<tr>
		<td>Publisher:</td>
		<td><input type="text" name="Publisher" value="<%=Publisher %>"></td>
	</tr>
	<tr>
		<td>Publication Date:</td>
		<td><input type="date" name="publicationDate" value="<%=date %>"></td>
	</tr>
	<tr>
		<td>Genre ID:</td>
		<td><input type="number" name="genreID" value="<%=genreID %>"></td>
	</tr>
	<tr>
		<td>Rating:</td>
		<td><input type="number" name="Rating" value="<%=Rating %>"></td>
	</tr>
	<tr>
		<td>Description:</td>
		<td><input type="number" name="Description" value="<%=Description %>"></td>
	</tr>
	<tr>
		<td><input type="submit" name="btnSubmit" value="Submit"></td>
	</tr>
	<% connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</table>
</form>

</body>
</html>
<style>
table, th, td {
  border: 1px solid;
}
</style>