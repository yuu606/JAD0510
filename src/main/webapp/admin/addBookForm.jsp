<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Book</title>
</head>
<body>
<form name="Edit" action="${pageContext.request.contextPath}/ManageBooksServlet?command=add" method="post">
<table class="center">
	<tr>
		<td>ISBN:</td>
		<td><input type="text" name="ISBN"></td>
	</tr>
	<tr>
		<td>Title:</td>
		<td><input type="text" name="Title"></td>
	</tr>
	<tr>
		<td>Author:</td>
		<td><input type="text" name="Author"></td>
	</tr>
	<tr>
		<td>Price:</td>
		<td><input type="number" name="Price"></td>
	</tr>
	<tr>
		<td>Quantity:</td>
		<td><input type="number" name="Quantity"></td>
	</tr>
	<tr>
		<td>Publisher:</td>
		<td><input type="text" name="Publisher"></td>
	</tr>
	<tr>
		<td>Publication Date:</td>
		<td><input type="date" name="publicationDate"></td>
	</tr>
	<tr>
		<td>Genre ID:</td>
		<td><input type="number" name="genreID"></td>
	</tr>
	<tr>
		<td>Rating:</td>
		<td><input type="number" name="Rating"></td>
	</tr>
	<tr>
		<td>Description:</td>
		<td><input type="number" name="Description"></td>
	</tr>
	<tr>
		<td>Image File:</td>
		<td><input type="file" name="imageFile" /></td>
	</tr>
	<tr>
		<td>Image Reference:</td>
		<td><input type="number" name="imageRef"></td>
	</tr>
	<tr>
		<td><input type="submit" name="btnSubmit" value="Add"></td>
	</tr>
</table>
</form>

</body>
</html>