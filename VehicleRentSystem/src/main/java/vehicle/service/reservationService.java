package vehicle.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import vehicle.classes.*;
import vehicle.connection.*;
import vehicle.interfaces.Drivers;
import vehicle.interfaces.Reservations;


public class reservationService implements Reservations{
	
	public int addReservation(Reservation reservation) {
		Connection connection;
		PreparedStatement preparedStatement;
	    
		try {
			connection = DBConnect.getDBConnection();
			
			//insert value
			preparedStatement = connection.prepareStatement("insert into reservation (userId, vehicleId, driverId, date) values (?,?,?,?)");
			preparedStatement.setInt(1, reservation.getUserId());
			preparedStatement.setInt(2,reservation.getVehicleId());
			preparedStatement.setInt(3,reservation.getDriverId());
			preparedStatement.setString(4,reservation.getDate());
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();
			
			return 1;
		
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	public ArrayList<Reservation> getReservations() {
		
		ArrayList<Reservation> reservationList = new ArrayList<Reservation>();
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			
			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("SELECT r.id,u.id,u.name,v.id,v.photo,d.id,d.name,r.date FROM reservation r,users u,driver d,vehicle v where r.userId=u.id and r.vehicleId=v.id and r.driverId=d.id");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				Reservation reservation = new Reservation();
				
				reservation.setId(resultSet.getInt(1));
				reservation.setUserId(resultSet.getInt(2));
				reservation.setUser_name(resultSet.getString(3));
				reservation.setVehicleId(resultSet.getInt(4));
				reservation.setVehicle(resultSet.getString(5));
				reservation.setDriverId(resultSet.getInt(6));
				reservation.setDriver(resultSet.getString(7));
				reservation.setDate(resultSet.getString(8));
				
				reservationList.add(reservation);
				
			}
			
			preparedStatement.close();
			connection.close();
			
		}catch (ClassNotFoundException | SQLException  e) {

			System.out.println(e.getMessage());
		}
		
		return reservationList;
	}

	public int editReservations(Reservation reservation) {
		Connection connection;
		PreparedStatement preparedStatement;
	    
		try {
			connection = DBConnect.getDBConnection();
			
				//update value
				preparedStatement = connection.prepareStatement("UPDATE reservation SET userId=?, vehicleId=?, driverId=?, date=? where id=?");
				preparedStatement.setInt(1, reservation.getUserId());
				preparedStatement.setInt(2,reservation.getVehicleId());
				preparedStatement.setInt(3,reservation.getDriverId());
				preparedStatement.setString(4,reservation.getDate());
				preparedStatement.setInt(5,reservation.getId());
				preparedStatement.execute();
				preparedStatement.close();
				connection.close();
				return 1;
				
		
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public int deleteReservation(int reservation) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//delete reservation
			preparedStatement = connection.prepareStatement("DELETE FROM reservation WHERE id=?");
			preparedStatement.setInt(1, reservation);
			preparedStatement.execute();

			return 1;
		
		}catch (ClassNotFoundException | SQLException  e) {
			return 0;
		}
	}
	
	public Reservation getReservation(int id) {
		Connection connection;
		PreparedStatement preparedStatement;
		Reservation reservation = new Reservation();
		
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("SELECT r.id,u.id,u.name,v.id,v.photo,d.id,d.name,r.date FROM reservation r,users u,driver d,vehicle v where r.userId=u.id and r.vehicleId=v.id and r.driverId=d.id and r.id=?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next())
			{
				reservation.setId(resultSet.getInt(1));
				reservation.setUserId(resultSet.getInt(2));
				reservation.setUser_name(resultSet.getString(3));
				reservation.setVehicleId(resultSet.getInt(4));
				reservation.setVehicle(resultSet.getString(5));
				reservation.setDriverId(resultSet.getInt(6));
				reservation.setDriver(resultSet.getString(7));
				reservation.setDate(resultSet.getString(8));
			}
			
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
		}
		return reservation;
	}
	
}
