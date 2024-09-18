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
            System.out.println(rs);
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
                User user = new User(userId, userName, email, password, oauthProvider, oauthId, role, balance,
                        description, specification, address, avatarUrl, status);
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

//    public User getUserByEmail(String emailIn) {
//        DBConnection db = DBConnection.getInstance();
//        String sql = "Select * From Users where email = ?";
//        User user = null;
//        try {
//            Connection con = db.openConnection();
//            PreparedStatement stmt = con.prepareStatement(sql);
//            stmt.setString(1, emailIn);
//            ResultSet rs = stmt.executeQuery();
//
//            while (rs.next()) {
//                int userId = rs.getInt(1);
//                String userName = rs.getNString(2);
//                String email = rs.getString(3);
//                String password = rs.getString(4);
//                String oauthProvider = rs.getString(5);
//                String oauthId = rs.getString(6);
//                String role = rs.getString(7);
//                int balance = rs.getInt(8);
//                String description = rs.getNString(9);
//                String specification = rs.getNString(10);
//                String address = rs.getNString(11);
//                String avatarUrl = rs.getString(12);
//                Boolean status = rs.getBoolean(13);
//                user = new User(userId, userName, email, password, oauthProvider, oauthId, role, balance, description,
//                        specification, address, avatarUrl, status);
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return user;
//    }

    public void addUserByLoginGoogle(User user) {
        String sql = "INSERT INTO Users(user_name, email, oauth_provider, oauth_id, avatar_url, status)"
                + " VALUES (?,?,?,?,?,?)";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setNString(1, user.getUserName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getOauthProvider());
            statement.setString(4, user.getOauthId());
            statement.setString(5, user.getAvatarUrl());
            statement.setBoolean(6, user.isStatus());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  public void addUserByRegister(User user) {
       String sql = "INSERT INTO Users(user_name,email,password,role,status)"
                + " VALUES (?,?,?,?,?)";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setNString(1, user.getUserName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getRole());
            statement.setBoolean(5, user.isStatus());
            statement.executeUpdate(); 
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public User getUserByEmail(String email) {
        DBConnection db = DBConnection.getInstance();
        User user = null;
        String sql = "SELECT * FROM [dbo].[Users] WHERE email = ?";

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
                user = new User(userId, userName, email, password, oauthProvider, oauthId, role, userId, description,
                        specification, address, avatarUrl, status);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
 
    public boolean checkExistEmail(String email) {
        DBConnection db = DBConnection.getInstance();
        User user = null;
        String sql = "SELECT * FROM [dbo].[Users] WHERE email = ?";
        boolean check = false;
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next() == true) {
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
<<<<<<< HEAD
    public void changePassword(String password, String email){
        String sql = "UPDATE [dbo].[Users] SET password = ? WHERE email = ?";
        ResultSet rs = null;
        try{
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, password);
            statement.setString(2, email);
            statement.executeQuery();
            statement.close();
            con.close();
            System.out.println("Sucess!");
        }catch(Exception ex){
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE,null, ex);
        }
    }
    public void updateAfterLoginGoogle(String role, String email){
        String sql = "UPDATE [dbo].[Users] SET role = ? WHERE email = ?";
        ResultSet rs = null;
        try{
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, role);
            statement.setString(2, email);
            statement.executeQuery();
            statement.close();
            con.close();
        }catch(Exception ex){
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE,null, ex);
        }
    }
    public static void main(String[] args) {
        UserDAO u = new UserDAO();

//        System.out.println(u.getAllUSer());
//        System.out.println(u.checkExistEmail("vtmyduyen3103@gmail.com"));
//        User user = new User("Duyên", "duyenvtmde180048@fpt.edu.vn", "Google", "12221", "12", true);
//        u.addUserByLoginGoogle(user);
    }
=======
  
   
>>>>>>> 63c4f861897eeb26e51c807df21cd8098232d704
}