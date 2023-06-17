package Servlets;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.sql.Date;

/**
 * Servlet implementation class ManageBooksServlet
 */
@WebServlet("/ManageBooksServlet")
public class ManageBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageBooksServlet() {
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
				String isbn = request.getParameter("ISBN");
				sql = "DELETE FROM books WHERE ISBN = ?";
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, isbn);
				pstmt.executeUpdate();
				path = "resultBooks.jsp?deletedBook=" + isbn;
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
				String imgRef = request.getParameter("imageRef");
				
				String strPubDate = request.getParameter("publicationDate");
				Date pubDate = Date.valueOf(strPubDate);
				
				sql = "UDATE books SET ISBN = ?, Title = ?, Author = ?, Price = ?, Quantity = ?, Publisher = ?, Publication_Date = ?, Genre_Id = ?, Rating = ?, Description = ?, Image_Ref = ? WHERE ISBN = ?;";
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
				pstmt.setString(11, imgRef);
				pstmt.setString(12, isbn1);
				
				pstmt.executeUpdate();
				path = "resultBooks.jsp?updatedBook=" + isbn2;
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
				imgRef = request.getParameter("imageRef");
				
				strPubDate = request.getParameter("publicationDate");
				pubDate = Date.valueOf(strPubDate);
				
				sql = "INSERT INTO books (ISBN, Title, Author, Price, Quantity, Publisher, Publication_Date, Genre_Id, Rating, Description, Image_Ref) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
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
				pstmt.setString(11, imgRef);
				
				pstmt.executeUpdate();
				path = "resultBooks.jsp?newBook=" + isbn;
				response.sendRedirect(path);
				break;
			}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
	}

}
