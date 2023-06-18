<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="Servlets.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection connection = null;
String command = request.getParameter("command");
String sql = null;
String path = "";
PreparedStatement pstmt;

try{
	connection = DBConnect.getConnectionToDatabase();
	
	switch(command) {
	case "delete":
		String isbn = request.getParameter("ISBN");
		sql = "DELETE FROM books WHERE ISBN = ?;";
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, isbn);
		int count = pstmt.executeUpdate();
		System.out.println(count);
		path = "resultBook.jsp?deletedBook=true";
		response.sendRedirect(path);
		break;
	case "update":
		String isbn1 = request.getParameter("ISBN1");
		String isbn2 = request.getParameter("ISBN2");
		String title = request.getParameter("Title");
		String author = request.getParameter("Author");
		double price = Double.parseDouble(request.getParameter("Price"));
		int quantity = Integer.parseInt(request.getParameter("Quantity"));
		String publisher = request.getParameter("Publisher");
		int genreID = Integer.parseInt(request.getParameter("genreID"));
		double rating = Double.parseDouble(request.getParameter("Rating"));
		String description = request.getParameter("Description");
		
		String strPubDate = request.getParameter("publicationDate");
		Date pubDate = Date.valueOf(strPubDate);
		
		sql = "UPDATE books SET ISBN = ?, Title = ?, Author = ?, Price = ?, Quantity = ?, Publisher = ?, Publication_Date = ?, Genre_Id = ?, Rating = ?, Description = ? WHERE ISBN = ?;";
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, isbn2);
		pstmt.setString(2, title);
		pstmt.setString(3, author);
		pstmt.setDouble(4, price);
		pstmt.setInt(5, quantity);
		pstmt.setString(6, publisher);
		pstmt.setDate(7, pubDate);
		pstmt.setInt(8, genreID);
		pstmt.setDouble(9, rating);
		pstmt.setString(10, description);
		pstmt.setString(11, isbn1);
		
		pstmt.executeUpdate();
		path = "resultBook.jsp?updatedBook=" + isbn2;
		response.sendRedirect(path);
		break;
	case "add":
		isbn = request.getParameter("ISBN");
		title = request.getParameter("Title");
		author = request.getParameter("Author");
		price = Double.parseDouble(request.getParameter("Price"));
		quantity = Integer.parseInt(request.getParameter("Quantity"));
		publisher = request.getParameter("Publisher");
		genreID = Integer.parseInt(request.getParameter("genreID"));
		rating = Double.parseDouble(request.getParameter("Rating"));
		description = request.getParameter("Description");
		
		strPubDate = request.getParameter("publicationDate");
		pubDate = Date.valueOf(strPubDate);
		
		sql = "INSERT INTO books (ISBN, Title, Author, Price, Quantity, Publisher, Publication_Date, Genre_Id, Rating, Description) VALUES (?,?,?,?,?,?,?,?,?,?)";
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, isbn);
		pstmt.setString(2, title);
		pstmt.setString(3, author);
		pstmt.setDouble(4, price);
		pstmt.setInt(5, quantity);
		pstmt.setString(6, publisher);
		pstmt.setDate(7, pubDate);
		pstmt.setInt(8, genreID);
		pstmt.setDouble(9, rating);
		pstmt.setString(10, description);
		
		pstmt.executeUpdate();
		path = "resultBook.jsp?newBook=" + isbn;
		response.sendRedirect(path);
		break;
	}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>