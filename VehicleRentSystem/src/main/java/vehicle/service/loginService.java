package vehicle.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vehicle.connection.DBConnect;

public class loginService {

	private int success;

	public int getSuccess() {
		return success;
	}

	public void setSuccess(int success) {
		this.success = success;
	}

	public int login(String uemail,String password) {
		
		Connection connection;
		PreparedStatement preparedStatement;
		String email=null;
		int admin=0,id=0;
		
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("select id,email,privilege from users where email=? and password=?");
			preparedStatement.setString(1, uemail);
			preparedStatement.setString(2, password);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next())
			{
				id = rs.getInt(1);
				email = rs.getString(2);
				admin = rs.getInt(3);
			}
			
			if(email==null) {
				setSuccess(0);
				return id;
			}else {
				setSuccess(admin+1);
				return id;
			}
			
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
			setSuccess(0);
			return 0;
		}
		
	}

}
