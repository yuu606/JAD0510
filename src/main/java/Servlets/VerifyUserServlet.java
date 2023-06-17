package Servlets;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * Servlet implementation class VerifyUserServlet
 */
@WebServlet("/VerifyUserServlet")
public class VerifyUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyUserServlet() {
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

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try{
		connection = DBConnect.getConnectionToDatabase();
		statement = connection.createStatement();
		String sql = "SELECT * FROM users";
		resultSet = statement.executeQuery(sql);

		while(resultSet.next()){
			
			if (username.equals(resultSet.getString("Username"))&&password.equals(resultSet.getString("Password"))){
				
				int userRole = resultSet.getInt("Role_Id");
				int userID = resultSet.getInt("User_Id");
				HttpSession session = request.getSession();
				session.setAttribute("sessUserID", userID);
				session.setAttribute("sessUserRole", userRole);
				
				if (userRole == 1) {
					String path = "customer/membersPage.jsp";
					response.sendRedirect(path);
				} else {
					String path = "admin/adminMain.jsp";
					response.sendRedirect(path);
				}
			}
		}
		
		String path = "public/Login.jsp?errCode=invalidLogin";
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


