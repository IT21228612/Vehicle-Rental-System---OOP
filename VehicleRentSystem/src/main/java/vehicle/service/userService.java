package vehicle.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vehicle.classes.*;
import vehicle.connection.*;
import vehicle.interfaces.Users;
import vehicle.interfaces.Vehicles;

public class userService implements Users{
	
	public int addUser(User user) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//insert value
			preparedStatement = connection.prepareStatement("insert into users (name,nic,email,address,photo,password,privilege) values (?,?,?,?,?,?,?)");
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2,user.getNic());
			preparedStatement.setString(3,user.getEmail());
			preparedStatement.setString(4,user.getAddress());
			preparedStatement.setString(5,user.getPhoto());
			preparedStatement.setString(6,user.getPassword());
			preparedStatement.setInt(7,user.getPrivilege());
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();
			
			return 1;
		
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	public ArrayList<User> getUsers() {
		
		ArrayList<User> userList = new ArrayList<User>();
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			
			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("SELECT * FROM users");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				User user = new User();
				
				user.setId(Integer.parseInt(resultSet.getString(1)));
				user.setName(resultSet.getString(2));
				user.setNic(resultSet.getString(3));
				user.setEmail(resultSet.getString(4));
				user.setAddress(resultSet.getString(5));
				user.setPhoto(resultSet.getString(6));
				user.setPassword(resultSet.getString(7));
				user.setPrivilege(resultSet.getInt(8));
				
				userList.add(user);
				
			}
			
			preparedStatement.close();
			connection.close();
			
		}catch (ClassNotFoundException | SQLException  e) {

			System.out.println(e.getMessage());
		}
		
		return userList;
	}

	public int editUsers(User user) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
				//update value
				preparedStatement = connection.prepareStatement("UPDATE users SET name=?,nic=?,email=?,address=?,photo=?,password=?,privilege=? where id=?");
				preparedStatement.setString(1, user.getName());
				preparedStatement.setString(2,user.getNic());
				preparedStatement.setString(3,user.getEmail());
				preparedStatement.setString(4,user.getAddress());
				preparedStatement.setString(5,user.getPhoto());
				preparedStatement.setString(6,user.getPassword());
				preparedStatement.setInt(7,user.getPrivilege());
				preparedStatement.setInt(8,user.getId());
				preparedStatement.execute();
				preparedStatement.close();
				connection.close();
				return 1;
				
		
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public int deleteUser(int user) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//delete user
			preparedStatement = connection.prepareStatement("DELETE FROM users WHERE id=?");
			preparedStatement.setInt(1, user);
			preparedStatement.execute();

			return 1;
		
		}catch (ClassNotFoundException | SQLException  e) {
			return 0;
		}
	}
	
	public User getUser(int id) {
		Connection connection;
		PreparedStatement preparedStatement;
		User user = new User();
		
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("SELECT * FROM users where id=?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next())
			{
				user.setId(Integer.parseInt(resultSet.getString(1)));
				user.setName(resultSet.getString(2));
				user.setNic(resultSet.getString(3));
				user.setEmail(resultSet.getString(4));
				user.setAddress(resultSet.getString(5));
				user.setPhoto(resultSet.getString(6));
				user.setPassword(resultSet.getString(7));
				user.setPrivilege(resultSet.getInt(8));
			}
			
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
		}
		return user;
	}
	
}
