package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManageUsersServlet
 */
@WebServlet("/ManageUsersServlet")
public class ManageUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageUsersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		Connection connection = null;
		String command = request.getParameter("command");
		String sql = null;
		String path = "";
		PreparedStatement pstmt;
		
		try{
			connection = DBConnect.getConnectionToDatabase();
			
			switch(command) {
			case "delete":
				int custID = Integer.parseInt(request.getParameter("customerID"));
				String sql1 = "DELETE FROM users WHERE users.Customer_Id = customers.Customer_Id AND customers.Customer_Id = ?";
				pstmt = connection.prepareStatement(sql1);
				pstmt.setInt(1, custID);
				pstmt.executeUpdate();
				
				String sql2 = "DELETE FROM customers WHERE Customer_Id = ?";
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1, custID);
				pstmt.executeUpdate();
				path = "result.jsp?deletedCust=" + custID;
				break;
			case "update":
				int userID1 = Integer.parseInt(request.getParameter("userID1"));
				int userID2 = Integer.parseInt(request.getParameter("userID2"));
				String Username = request.getParameter("Username");
				String Password = request.getParameter("Password");
				
				sql1 = "UPDATE users SET User_Id = ?, Username = ?, Password = ? WHERE User_Id = ?";
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1, userID2);
				pstmt.setString(2, Username);
				pstmt.setString(3, Password);
				pstmt.setInt(1, userID1);
				
				int custID1 = Integer.parseInt(request.getParameter("custID1"));
				int custID2 = Integer.parseInt(request.getParameter("custID2"));
				String email = request.getParameter("Email");
				String address = request.getParameter("Address");
				String firstName = request.getParameter("FirstName");
				String lastName = request.getParameter("LastName");
				
				sql2 = "UPDATE customers SET Customer_Id = ?, User_Id = ?, Email = ?, Address = ?, First_Name = ?, Last_Name = ? WHERE Customer_Id = ?;";
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1, custID2);
				pstmt.setInt(2, userID2);
				pstmt.setString(3, email);
				pstmt.setString(4, address);
				pstmt.setString(5, firstName);
				pstmt.setString(6, lastName);
				pstmt.setInt(7, custID1);
				
				pstmt.executeUpdate();
				path = "result.jsp?updatedCust=" + userID2;
				break;
			case "add":
				String username = request.getParameter("Username");
				String password = request.getParameter("Address");
				
				sql1 = "INSERT INTO users (Username, Password, Role_Id) VALUES (?,?,1)";
				pstmt = connection.prepareStatement(sql1);
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				pstmt.executeUpdate();
				
				sql2 = "SELECT users.User_Id FROM jad.users WHERE Username = ?";
				pstmt = connection.prepareStatement(sql2);
				pstmt.setString(1, username);
				ResultSet rs = pstmt.executeQuery();
				
				int userID = rs.getInt("User_Id");
				email = request.getParameter("Email");
				address = request.getParameter("Address");
				firstName = request.getParameter("FirstName");
				lastName = request.getParameter("LastName");
				
				String sql3 = "INSERT INTO customers (User_Id, Email, Address, First_Name, Last_Name) VALUES (?,?,?,?,?)";
				pstmt = connection.prepareStatement(sql3);
				pstmt.setInt(1, userID);
				pstmt.setString(2, email);
				pstmt.setString(3, address);
				pstmt.setString(4, firstName);
				pstmt.setString(5, lastName);
				pstmt.executeUpdate();
				
				pstmt.executeUpdate();
				path = "result.jsp?newCust=" + userID;
				break;
			}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
	}

}
