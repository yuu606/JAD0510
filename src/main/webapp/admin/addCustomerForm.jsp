<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Customer</title>
</head>
<body>
<form name="Edit" action="${pageContext.request.contextPath}/ManageUsersServlet?command=add" method="post">
<table class="center">
	<tr>
		<td>Email:</td>
		<td><input type="text" name="Email"></td>
	</tr>
	<tr>
		<td>Address:</td>
		<td><input type="text" name="Address"></td>
	</tr>
	<tr>
		<td>First Name:</td>
		<td><input type="number" name="FirstName"></td>
	</tr>
	<tr>
		<td>Last_Name:</td>
		<td><input type="number" name="LastName"></td>
	</tr>
	<tr>
		<td>Username:</td>
		<td><input type="text" name="Username"></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input type="date" name="Password"></td>
	</tr>
	<tr>
		<td><input type="submit" name="btnSubmit" value="Submit"></td>
	</tr>
</table>
</form>

</body>
</html>