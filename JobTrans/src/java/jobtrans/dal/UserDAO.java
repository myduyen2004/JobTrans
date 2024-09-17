/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
    
    public List<User> getAllUSer() {
        List<User> userList = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "Select * from [dbo].[Users]";
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt(1);
                String userName = rs.getNString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                String oauthProvider = rs.getString(5);
                String oauthId = rs.getString(6);
                String role = rs.getString(7);
                int balance = rs.getInt(8);
                String description = rs.getNString(9);
                String specification = rs.getNString(10);
                String address = rs.getNString(11);
                String avatarUrl = rs.getString(12);
                Boolean status = rs.getBoolean(13);
                User user = new User(userId, userName, email, password, oauthProvider, oauthId, role, balance, description, specification, address, avatarUrl, status);
                userList.add(user);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userList;
    }
    
    public User checkLogin(User user) {
        User temp = null;
        for (User u : new UserDAO().getAllUSer()) {
            if (u.getEmail().equals(user.getEmail())
                    && u.getPassword().equals(user.getPassword()) && u.isStatus()) {
                temp = user;
                break;
            }
        }
        return temp;
    }
    
    public User getUserByEmail(String emailIn){
        DBConnection db = DBConnection.getInstance();
        String sql = "Select * From Users where email = ?";
        User user = null;
        try {
            Connection con = db.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, emailIn);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                int userId = rs.getInt(1);
                String userName = rs.getNString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                String oauthProvider = rs.getString(5);
                String oauthId = rs.getString(6);
                String role = rs.getString(7);
                int balance = rs.getInt(8);
                String description = rs.getNString(9);
                String specification = rs.getNString(10);
                String address = rs.getNString(11);
                String avatarUrl = rs.getString(12);
                Boolean status = rs.getBoolean(13);
                user = new User(userId, userName, email, password, oauthProvider, oauthId, role, balance, description, specification, address, avatarUrl, status);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
    
    public static void main(String[] args) {
        UserDAO u = new UserDAO();
        
        System.out.println(u.getAllUSer());
        System.out.println(u.checkLogin(new User("nguyendinhquang25082004@gmail.com", "123qqquang")));
    }
}