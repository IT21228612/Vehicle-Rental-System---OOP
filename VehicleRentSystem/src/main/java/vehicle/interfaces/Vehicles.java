package vehicle.interfaces;
import java.util.ArrayList;

import vehicle.classes.*;

public interface Vehicles {

	public int addVehicle(Vehicle vehicle);

	public ArrayList<Vehicle> getVehicles();

	public int deleteVehicle(int d);

	public Vehicle getVehicle(int d);

	public int editVehicles(Vehicle vehicle);
	
}
