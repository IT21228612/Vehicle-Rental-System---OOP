package vehicle.connection;

import java.sql.*;

public class DBConnect {
	
	private static Connection connection;

	public static Connection getDBConnection() throws ClassNotFoundException, SQLException {

		if (connection == null || connection.isClosed()) {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehicle_rent", "root", "");
		}
		
		return connection;
	}

}
