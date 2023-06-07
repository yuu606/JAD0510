import java.sql.DriverManager;
import java.sql.*;

public class DBConnect {
	public static Connection getConnectionToDatabase() {
		Connection connection = null;
		
		try {
			//load driver class 
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver);
			System.out.println("MySQL JDBC Driver Registered");
			
			//get hold of the DriverManager 
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jad", "root", "urM@ther69420");
			} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
		}
		
		if (connection != null) {
			System.out.println("Connection made to DB!");
		}
		return connection;
	}
}
