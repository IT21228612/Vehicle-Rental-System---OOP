package vehicle.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vehicle.classes.*;
import vehicle.connection.*;
import vehicle.interfaces.Reservations;
import vehicle.interfaces.Vehicles;


public class vehicleService implements Vehicles{
	
	public int addVehicle(Vehicle vehicle) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//insert value
			preparedStatement = connection.prepareStatement("insert into vehicle (type, brand, model, registrationNo, seats, photo) values (?,?,?,?,?,?)");
			preparedStatement.setString(1, vehicle.getType());
			preparedStatement.setString(2,vehicle.getBrand());
			preparedStatement.setString(3,vehicle.getModel());
			preparedStatement.setString(4,vehicle.getRegistrationNo());
			preparedStatement.setInt(5,vehicle.getSeats());
			preparedStatement.setString(6,vehicle.getPhoto());
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();
			
			return 1;
		
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	public ArrayList<Vehicle> getVehicles() {
		
		ArrayList<Vehicle> vehicleList = new ArrayList<Vehicle>();
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			
			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("SELECT * FROM vehicle");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				Vehicle vehicle = new Vehicle();
				
				vehicle.setId(resultSet.getInt(1));
				vehicle.setType(resultSet.getString(2));
				vehicle.setBrand(resultSet.getString(3));
				vehicle.setModel(resultSet.getString(4));
				vehicle.setRegistrationNo(resultSet.getString(5));
				vehicle.setSeats(resultSet.getInt(6));
				vehicle.setPhoto(resultSet.getString(7));
				
				vehicleList.add(vehicle);
				
			}
			
			preparedStatement.close();
			connection.close();
			
		}catch (ClassNotFoundException | SQLException  e) {

			System.out.println(e.getMessage());
		}
		
		return vehicleList;
	}

	public int editVehicles(Vehicle vehicle) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
				//update value
				preparedStatement = connection.prepareStatement("UPDATE vehicle SET type=?, brand=?, model=?, registrationNo=?, seats=?, photo=? where id=?");
				preparedStatement.setString(1, vehicle.getType());
				preparedStatement.setString(2,vehicle.getBrand());
				preparedStatement.setString(3,vehicle.getModel());
				preparedStatement.setString(4,vehicle.getRegistrationNo());
				preparedStatement.setInt(5,vehicle.getSeats());
				preparedStatement.setString(6,vehicle.getPhoto());
				preparedStatement.setInt(7,vehicle.getId());
				preparedStatement.execute();
				preparedStatement.close();
				connection.close();
				return 1;
				
		
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public int deleteVehicle(int vehicle) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//delete vehicle
			preparedStatement = connection.prepareStatement("DELETE FROM vehicle WHERE id=?");
			preparedStatement.setInt(1, vehicle);
			preparedStatement.execute();

			return 1;
		
		}catch (ClassNotFoundException | SQLException  e) {
			return 0;
		}
	}
	
	public Vehicle getVehicle(int id) {
		Connection connection;
		PreparedStatement preparedStatement;
		Vehicle vehicle = new Vehicle();
		
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("SELECT * FROM vehicle where id=?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next())
			{

				vehicle.setId(resultSet.getInt(1));
				vehicle.setType(resultSet.getString(2));
				vehicle.setBrand(resultSet.getString(3));
				vehicle.setModel(resultSet.getString(4));
				vehicle.setRegistrationNo(resultSet.getString(5));
				vehicle.setSeats(resultSet.getInt(6));
				vehicle.setPhoto(resultSet.getString(7));
			}
			
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
		}
		return vehicle;
	}
	
}
