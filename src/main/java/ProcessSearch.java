

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* 
=======================================	
Author: Chong Yu Lin
Date:  2023
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
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		String searchTerm = request.getParameter("searchValue");

		try{
		connection = DBConnect.getConnectionToDatabase();
		statement = connection.createStatement();
		String sql = "SELECT * FROM books";
		resultSet = statement.executeQuery(sql);

		while(resultSet.next()){
			
			if (searchTerm.equals(resultSet.getString("Title"))){
				
				String path = "bookDetails.jsp?searched=" + searchTerm;
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
			}
		}
		
		String sql2 = "SELECT * FROM genre";
		resultSet = statement.executeQuery(sql);
		
		while(resultSet.next()){
			if (searchTerm.equals(resultSet.getString("genre_name"))){
				
				String path = "genrePage.jsp?searched=" + searchTerm;
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
			}
		}
		
		String path = "Index.jsp?errCode=404";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
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