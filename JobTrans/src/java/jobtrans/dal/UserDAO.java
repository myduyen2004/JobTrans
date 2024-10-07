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
import java.sql.SQLException;
import java.sql.*;

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
        String sql = "INSERT INTO Users(user_name,email,password,role,avatar_url, status)"
                + " VALUES (?,?,?,?,?,?)";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setNString(1, user.getUserName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getRole());
            statement.setString(5, user.getDefaultAvatarUrl());
            statement.setBoolean(6, user.isStatus());
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
                double balance = rs.getDouble(8);
                String description = rs.getNString(9);
                String specification = rs.getNString(10);
                String address = rs.getNString(11);
                String avatarUrl = rs.getNString(12);
                boolean status = rs.getBoolean(13);
                user = new User(userId, userName, email, password, oauthProvider, oauthId, role, balance, description, specification, address, avatarUrl, status);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
    
    public User getUserByUserId(int userId) {
        DBConnection db = DBConnection.getInstance();
        User user = null;
        String sql = "SELECT * FROM [dbo].[Users] WHERE user_id = ?";

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                userId = rs.getInt(1);
                String userName = rs.getNString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                String oauthProvider = rs.getString(5);
                String oauthId = rs.getString(6);
                String role = rs.getString(7);
                double balance = rs.getDouble(8);
                String description = rs.getNString(9);
                String specification = rs.getNString(10);
                String address = rs.getNString(11);
                String avatarUrl = rs.getNString(12);
                boolean status = rs.getBoolean(13);
                user = new User(userId, userName, email, password, oauthProvider, oauthId, role, balance, description, specification, address, avatarUrl, status);
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

    public void changePassword(String password, String email) {
        String sql = "UPDATE [dbo].[Users] SET password = ? WHERE email = ?";
        ResultSet rs = null;
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, password);
            statement.setString(2, email);
            statement.executeQuery();
            statement.close();
            con.close();
            System.out.println("Sucess!");
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAfterLoginGoogle(String role, String email) {
        String sql = "UPDATE [dbo].[Users] SET role = ? WHERE email = ?";
        ResultSet rs = null;
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, role);
            statement.setString(2, email);
            statement.executeQuery();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Cập nhật thông tin user, bao gồm cả mật khẩu mới
    public void changePassword(User user) {
        Connection con = null; // Khởi tạo Connection là null
        try {
            // Mở kết nối thông qua lớp DBConnection
            con = DBConnection.getInstance().openConnection();

            String query = "UPDATE Users SET password = ? WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getPassword());
            ps.setString(2, user.getEmail());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace(); // Bắt các lỗi khác nếu có
        } finally {
            // Đóng kết nối
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public  boolean editProfile(User user) {
       DBConnection db = DBConnection.getInstance(); 
       
    boolean isUpdated = false;
    try  {
        Connection con = db.openConnection();
        // SQL query to update the user's profile
        String query = "UPDATE Users SET user_name = ?, role = ?, description = ?, specification = ?, address = ?, avatar_url=? WHERE email = ?";
        
        PreparedStatement stmt = con.prepareStatement(query);
        // Set the parameters based on the User object
        stmt.setString(1, user.getUserName());         // user_name
        stmt.setString(2, user.getRole());              // role
        stmt.setString(3, user.getDescription());       // description
        stmt.setString(4, user.getSpecification());     // specification
        stmt.setString(5, user.getAddress());           // address
        stmt.setString(6, user.getAvatarUrl());
        stmt.setString(7, user.getEmail());              // user_id (for the WHERE condition)

        // Execute the update query
        int rowsAffected = stmt.executeUpdate();
        
        if (rowsAffected > 0) {
            isUpdated = true;  // Update was successful
        }
        
        con.close();
    } catch (IllegalArgumentException e) {
        System.out.println("Error in input parameters: " + e.getMessage());
    } catch (Exception e) {
        Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, e);
    }
    return isUpdated;  // Return true if the profile was updated, false otherwise
}
    public int getQuantityOfAppliedJob(User u){
        String sql = """
                     SELECT COUNT(*) AS TotalApplications FROM JobGreetings
                     WHERE job_seeker_id = ?;""";
        int quantityOfAppliedJob = 0;
        try{
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, u.getUserId());
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                quantityOfAppliedJob = rs.getInt(1);
            }
        }catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quantityOfAppliedJob;
    }
    public int getQuantityOfPostedJob(User u){
        String sql = """
                     SELECT COUNT(*) AS TotalPost FROM Job
                     WHERE user_id = ?;""";
        int quantityOfPostedJob = 0;
        try{
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, u.getUserId());
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                quantityOfPostedJob = rs.getInt(1);
            }
        }catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
        
    }
    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        User u =ud.getUserByEmail("tranthib@gmail.com");
        System.out.println(u);
    }

}
