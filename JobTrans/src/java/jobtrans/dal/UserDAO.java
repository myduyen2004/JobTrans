/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.model.User;
import jobtrans.utils.DBConnection;

/**
 *
 * @author admin
 */
public class UserDAO {
    private final DBConnection dbConnection;

    public UserDAO() {
        dbConnection = DBConnection.getInstance();
    }
    
    public void addUserByLoginGoogle(User user){
        String sql = "INSERT INTO User(user_name, email, oauth_provider, oauth_id, role, balance, status)"
                + " VALUES (?,?,?,?,?,?,?)";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setNString(1,user.getUserName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getOauthProvider());
            statement.setString(4, user.getOauthId());
            statement.execute();
            statement.close();
            con.close();
        } catch(Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public User getUserByEmail(String email){
        DBConnection db = DBConnection.getInstance();
        User user = null;
        String sql = "SELECT COUNT(*) FROM [dbo].[User] WHERE email = ?";
        
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt(1);
                String userName = rs.getNString(2);
                String password = rs.getString(4);
                String oauthProvider = rs.getString(5);
                String oauthId = rs.getString(6);
                String role = rs.getString(7);
                double balance = rs.getInt(8);
                String description = rs.getNString(9);
                String specification = rs.getNString(10);
                String address = rs.getNString(11);
                String avatarUrl = rs.getNString(12);
                boolean status = rs.getBoolean(13);
                user = new User(userId, userName, email, password, oauthProvider, oauthId, role, userId, description, specification, address, avatarUrl, status);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
    
    public boolean checkExistEmail(String email){
        DBConnection db = DBConnection.getInstance();
        User user = null;
        String sql = "SELECT * FROM [dbo].[User] WHERE email = ?";
        boolean check = false;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()== true) {
                check = true;
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
}
