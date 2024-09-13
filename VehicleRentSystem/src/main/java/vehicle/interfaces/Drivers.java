package vehicle.interfaces;

import java.util.ArrayList;
import vehicle.classes.*;

public interface Drivers {

	public int addDriver(Driver driver);
	
	public int editDrivers(Driver driver);
	
	public Driver getDriver(int d);

	public int deleteDriver(int d);

	public ArrayList<Driver> getDrivers();
}
