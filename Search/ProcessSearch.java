package servlets;

import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;


/* 
=======================================	
Author: Chong Yu Lin / Kuek Yi
Date:  16 June 2023
Description: ST0510/JAD CA1 Assignment
=======================================
*/

/**
 * Servlet implementation class ProcessSearch
 */
@WebServlet("/ProcessSearch")
public class ProcessSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcessSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//create session
		HttpSession session = request.getSession();
		
		String searchTerm = request.getParameter("searchValue");
		//boolean found = false;
		String Title, Author, ISBN;
		String results = "";
		String SearchType;
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/db1?user=root&password=kairasql&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();
			
			// Step 5: Execute SQL Command
			String sqlStr = "SELECT Title, Author, ISBN FROM jad.books b, jad.genre g WHERE b.Genre_Id= g.genre_id AND g.genre_name like ?";

			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, searchTerm);

			ResultSet res = pstmt.executeQuery();

			// Step 6: Process Result
			
			if (res.next()) {
				while(res.next()) {
					Title = res.getString("Title");
					Author = res.getString("Author");
					ISBN = res.getString("ISBN");
					results += " <div class='card mb-3' onclick=\"window.location.href='bookDetails.jsp?ISBN=" + ISBN
							+ "'\" style='max-width: 600px;'><div class='row g-0'><div class='col-md-3'><img src='../Images/" + ISBN
							+ ".jpg'style='width: auto;height:150px;' class='img-fluid rounded-start'></div><div class='col-md-9'><div class='card-body'><h5 class='card-title'>"
							+ Title + "</h5><p class='card-text'>By: " + Author + "<p></div></div></div></div>";
				}
				SearchType="by GENRE:";

			} else {
				sqlStr = "SELECT * FROM jad.books WHERE jad.books.Title LIKE ?";			
				pstmt = conn.prepareStatement(sqlStr);
				pstmt.setString(1, "%"+searchTerm+"%");
				res = pstmt.executeQuery();
				while(res.next()) {
					Title = res.getString("Title");
					Author = res.getString("Author");
					ISBN = res.getString("ISBN");
					results += " <div class='card mb-3' onclick=\"window.location.href='bookDetails.jsp?ISBN=" + ISBN
							+ "'\" style='max-width: 600px;'><div class='row g-0'><div class='col-md-3'><img src='../Images/" + ISBN
							+ ".jpg'style='width: auto;height:150px;' class='img-fluid rounded-start'></div><div class='col-md-9'><div class='card-body'><h5 class='card-title'>"
							+ Title + "</h5><p class='card-text'>By: " + Author + "<p></div></div></div></div>";
				}
				SearchType="by TITLE: ";
			}
			session.setAttribute("searchRes",results);
			response.sendRedirect("CA1-JAD/Search/searchResults.jsp?search="+SearchType+searchTerm);
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			response.getWriter().append("Error :" + e);
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
