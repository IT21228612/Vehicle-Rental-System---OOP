package vehicle.interfaces;
import java.util.ArrayList;

import vehicle.classes.*;

public interface Users {

	public int addUser(User user);

	public ArrayList<User> getUsers();

	public int deleteUser(int d);

	public User getUser(int d);

	public int editUsers(User user);
	
}
