package vehicle.interfaces;
import java.util.ArrayList;

import vehicle.classes.*;

public interface Reservations {

	public int addReservation(Reservation reservation);

	public ArrayList<Reservation> getReservations();

	public int deleteReservation(int d);

	public Reservation getReservation(int d);

	public int editReservations(Reservation reservation);
	
}
