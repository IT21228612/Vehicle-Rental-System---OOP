package vehicle.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;
import vehicle.connection.DBConnect;

public class loginService {

    private int success;

    public int getSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }

    public int login(String uemail, String password) {
        
        Connection connection;
        PreparedStatement preparedStatement;
        String storedPasswordHash = null;
        int admin = 0, id = 0;
        
        try {
            connection = DBConnect.getDBConnection();
            
            preparedStatement = connection.prepareStatement("SELECT id, password, privilege FROM users WHERE email=?");
            preparedStatement.setString(1, uemail);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                id = rs.getInt(1);
                storedPasswordHash = rs.getString(2);
                admin = rs.getInt(3);
            }
            
            if (storedPasswordHash != null && BCrypt.checkpw(password, storedPasswordHash)) {
                setSuccess(admin + 1);
                return id;
            } else {
                setSuccess(0);
                return id;
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            setSuccess(0);
            return 0;
        }
    }
}
