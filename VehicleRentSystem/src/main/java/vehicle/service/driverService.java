package vehicle.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vehicle.classes.*;
import vehicle.connection.*;
import vehicle.interfaces.Drivers;

public class driverService implements Drivers{
	
	public int addDriver(Driver driver) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//insert value
			preparedStatement = connection.prepareStatement("insert into driver (name, age, address, nic, photo, years) values (?,?,?,?,?,?)");
			preparedStatement.setString(1, driver.getName());
			preparedStatement.setInt(2,driver.getAge());
			preparedStatement.setString(3,driver.getAddress());
			preparedStatement.setString(4,driver.getNic());
			preparedStatement.setString(5,driver.getPhoto());
			preparedStatement.setInt(6,driver.getYears());
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();
			
			return 1;
		
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	public ArrayList<Driver> getDrivers() {
		
		ArrayList<Driver> driverList = new ArrayList<Driver>();
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			
			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("SELECT * FROM driver");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				Driver driver = new Driver();
				
				driver.setId(Integer.parseInt(resultSet.getString(1)));
				driver.setName(resultSet.getString(2));
				driver.setAge(resultSet.getInt(3));
				driver.setAddress(resultSet.getString(4));
				driver.setNic(resultSet.getString(5));
				driver.setPhoto(resultSet.getString(6));
				driver.setYears(resultSet.getInt(7));
				
				driverList.add(driver);
				
			}
			
			preparedStatement.close();
			connection.close();
			
		}catch (ClassNotFoundException | SQLException  e) {

			System.out.println(e.getMessage());
		}
		
		return driverList;
	}

	public int editDrivers(Driver driver) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
				//update value
				preparedStatement = connection.prepareStatement("UPDATE driver SET name=?, age=?, address=? , nic=? , photo=? , years=? where id=?");
				preparedStatement.setString(1, driver.getName());
				preparedStatement.setInt(2,driver.getAge());
				preparedStatement.setString(3,driver.getAddress());
				preparedStatement.setString(4,driver.getNic());
				preparedStatement.setString(5,driver.getPhoto());
				preparedStatement.setInt(6,driver.getYears());
				preparedStatement.setInt(7,driver.getId());
				preparedStatement.execute();
				preparedStatement.close();
				connection.close();
				return 1;
				
		
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public int deleteDriver(int driver) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//delete driver
			preparedStatement = connection.prepareStatement("DELETE FROM driver WHERE id=?");
			preparedStatement.setInt(1, driver);
			preparedStatement.execute();

			return 1;
		
		}catch (ClassNotFoundException | SQLException  e) {
			return 0;
		}
	}
	
	public Driver getDriver(int id) {
		Connection connection;
		PreparedStatement preparedStatement;
		Driver driver = new Driver();
		
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("SELECT * FROM driver where id=?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next())
			{
				driver.setId(Integer.parseInt(resultSet.getString(1)));
				driver.setName(resultSet.getString(2));
				driver.setAge(resultSet.getInt(3));
				driver.setAddress(resultSet.getString(4));
				driver.setNic(resultSet.getString(5));
				driver.setPhoto(resultSet.getString(6));
				driver.setYears(resultSet.getInt(7));
			}
			
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
		}
		return driver;
	}
	
}
