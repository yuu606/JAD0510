<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><% 
        if(request.getParameter("logOut")!= null && request.getParameter("logOut").equals("true")) {
        	System.out.println(request.getParameter("logOut"));
            session.invalidate();
            response.sendRedirect("public/logOut.jsp");
        }%>
</body>
</html>