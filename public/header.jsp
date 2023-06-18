<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
</head>
<!-- 
=======================================	
Author: Chong Yu Lin
Date:  2023
Description: ST0510/JAD CA1 Assignment
=======================================
-->
<body>
<div class="sticky-top row"  style="background-color: rgb(52, 78, 65);">
<nav class="navbar navbar-expand-lg" data-bs-theme="dark">
  <div class="container-fluid">
    <a style="font-family: Copperplate, fantasy; color: white; padding: 5px;" class="navbar-brand">Bookly</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="Index.jsp"
          style="font-family: Monaco, monospace; font-weight: bold;">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="bookList.jsp"
          style="font-family: Monaco, monospace; font-weight: bold;">Titles</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"
          style="font-family: Monaco, monospace; font-weight: bold;">
            Genres
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="../public/genrePage.jsp?search=romance">Romance</a></li>
            <li><a class="dropdown-item" href="../public/genrePage.jsp?search=fantasy">Fantasy</a></li>
            <li><a class="dropdown-item" href="../public/genrePage.jsp?search=classic">Classic</a></li>
          </ul>
        </li>
      </ul>
      <% if (session.getAttribute("sessUserID") != null) { %>
        	<button class="btn btn-outline-success"
        	 style="font-family: Monaco, monospace; font-weight: bold; margin: 10px;"
        	 onclick="window.location.href='../LogOut_session.jsp?logOut=true'">
	          Logout
	        </button>
	        <button class="btn btn-outline-success"
        	 style="font-family: Monaco, monospace; font-weight: bold; margin: 10px;"
        	 onclick="window.location.href='../customer/membersPage.jsp'">
	          Profile
	        </button>
        <% } else { %>
        	 <button class="btn btn-outline-success"
        	 style="font-family: Monaco, monospace; font-weight: bold; margin: 10px;"
        	 onclick="window.location.href='Login.jsp'">
	          Login
	        </button>
	         <button class="btn btn-outline-success"
        	 style="font-family: Monaco, monospace; font-weight: bold; margin: 10px;"
        	 onclick="window.location.href='signUp.jsp'">
	          Sign Up
	        </button>
        <% } %>
      <form class="d-flex" action="${pageContext.request.contextPath}/ProcessSearch" method="get" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" name="searchValue" aria-label="Search">
        <button class="btn btn-outline-success" type="submit"
        style="font-family: Monaco, monospace; font-weight: bold;">Search</button>
      </form>
    </div>
  </div>
</nav>
</div>
</body>