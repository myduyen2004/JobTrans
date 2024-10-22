/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM Users";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUserName(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setOauthProvider(rs.getString("oauth_provider"));
                user.setOauthId(rs.getString("oauth_id"));
                user.setRole(rs.getString("role"));
                user.setBalance(rs.getInt("balance"));
                user.setDescription(rs.getString("description"));
                user.setSpecification(rs.getString("specification"));
                user.setAddress(rs.getString("address"));
                user.setAvatarUrl(rs.getString("avatar_url"));
                user.setDateOfBirth(rs.getDate("date_of_birth"));
                user.setStatus(rs.getBoolean("status"));
                users.add(user);
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);

        }
        return users;
    }

    public User getUserById(int id) {
        User user = null;
        String query = "SELECT * FROM Users WHERE user_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUserName(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setOauthProvider(rs.getString("oauth_provider"));
                user.setOauthId(rs.getString("oauth_id"));
                user.setRole(rs.getString("role"));
                user.setBalance(rs.getInt("balance"));
                user.setDescription(rs.getString("description"));
                user.setSpecification(rs.getString("specification"));
                user.setAddress(rs.getString("address"));
                user.setAvatarUrl(rs.getString("avatar_url"));
                user.setDateOfBirth(rs.getDate("date_of_birth"));
                user.setStatus(rs.getBoolean("status"));
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return user;
    }

    public User getUserByEmail(String email) {
    User user = null;
    String query = "SELECT * FROM Users WHERE email = ?";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            user = new User();
            user.setUserId(rs.getInt("user_id"));
            user.setUserName(rs.getString("user_name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setOauthProvider(rs.getString("oauth_provider"));
            user.setOauthId(rs.getString("oauth_id"));
            user.setRole(rs.getString("role"));
            user.setBalance(rs.getInt("balance"));
            user.setDescription(rs.getString("description"));
            user.setSpecification(rs.getString("specification"));
            user.setAddress(rs.getString("address"));
            user.setAvatarUrl(rs.getString("avatar_url"));
            user.setDateOfBirth(rs.getDate("date_of_birth"));
            user.setStatus(rs.getBoolean("status"));
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    return user;
}
    
    public int getNumberOfUsers() {
    int count = 0;
    String query = "SELECT COUNT(*) FROM Users";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt(1);
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    return count;
}

    public User checkLogin(String email, String password) {
    User user = null;
    String query = "SELECT * FROM Users WHERE email = ? AND password = ?";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, password);
        
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
                // Kiểm tra status trước khi tạo đối tượng User
            boolean status = rs.getBoolean("status");
            if (!status) {
                // Nếu status bằng false (0), đăng nhập thất bại
                return null;
            }
            user = new User();
            user.setUserId(rs.getInt("user_id"));
            user.setUserName(rs.getString("user_name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setOauthProvider(rs.getString("oauth_provider"));
            user.setOauthId(rs.getString("oauth_id"));
            user.setRole(rs.getString("role"));
            user.setBalance(rs.getInt("balance"));
            user.setDescription(rs.getString("description"));
            user.setSpecification(rs.getString("specification"));
            user.setAddress(rs.getString("address"));
            user.setAvatarUrl(rs.getString("avatar_url"));
            user.setDateOfBirth(rs.getDate("date_of_birth"));
            user.setStatus(rs.getBoolean("status"));
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return user;
    }
    
    public boolean checkExistEmail(String email) {
    String query = "SELECT * FROM Users WHERE email = ?";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, email);
        
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return true;
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return false;
}

    public boolean changePassword(String email, String newPassword) {
    String query = "UPDATE Users SET password = ? WHERE email = ?";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, newPassword); 
        ps.setString(2, email); 
        
        int rowsUpdated = ps.executeUpdate();
        if (rowsUpdated > 0) {
            return true; 
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return false;
    }

    public boolean addUserByRegister(User user) {
    String query = "INSERT INTO Users (user_name, email, password, role, balance, avatar_url, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        
        ps.setString(1, user.getUserName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPassword());
        ps.setString(4, user.getRole());
        ps.setInt(5, user.getBalance());
        ps.setString(6, user.getAvatarUrl());
        ps.setBoolean(7, user.isStatus());
        
        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            return true; 
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return false;
}

    public boolean addUserByLoginGoogle(User user) {
    String query = "INSERT INTO Users (user_name, email, oauth_provider, oauth_id, balance, avatar_url, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        
        ps.setString(1, user.getUserName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getOauthProvider());
        ps.setString(4, user.getOauthId());
        ps.setInt(5, user.getBalance());
        ps.setString(6, user.getAvatarUrl());
        ps.setBoolean(7, user.isStatus());
        
        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            return true; 
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return false; 
}

    public boolean updateRole(String role, String email) {
    String query = "UPDATE Users SET role = ? WHERE email = ?";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        
        ps.setString(1, role);
        ps.setString(2, email);
        
        int rowsUpdated = ps.executeUpdate();
        if (rowsUpdated > 0) {
            return true; 
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return false; 
}

    public boolean editProfile(User user) {
    String query = "UPDATE Users SET user_name = ?, description = ?, specification = ?, address = ?, avatar_url = ?, date_of_birth = ? WHERE email = ?";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        
        ps.setString(1, user.getUserName());
        ps.setString(2, user.getDescription());
        ps.setString(3, user.getSpecification());
        ps.setString(4, user.getAddress());
        ps.setString(5, user.getAvatarUrl());
        ps.setDate(6, new java.sql.Date(user.getDateOfBirth().getTime())); // Chuyển đổi sang java.sql.Date
        ps.setString(7, user.getEmail()); 
        
        int rowsUpdated = ps.executeUpdate();
        if (rowsUpdated > 0) {
            return true; 
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    
    return false; 
}

    public List<User> getAllEmployers() {
    List<User> employers = new ArrayList<>();
    String query = "SELECT * FROM Users WHERE role = 'Employer'";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            User user = new User();
            user.setUserId(rs.getInt("user_id"));
            user.setUserName(rs.getString("user_name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setOauthProvider(rs.getString("oauth_provider"));
            user.setOauthId(rs.getString("oauth_id"));
            user.setRole(rs.getString("role"));
            user.setBalance(rs.getInt("balance"));
            user.setDescription(rs.getString("description"));
            user.setSpecification(rs.getString("specification"));
            user.setAddress(rs.getString("address"));
            user.setAvatarUrl(rs.getString("avatar_url"));
            user.setDateOfBirth(rs.getDate("date_of_birth"));
            user.setStatus(rs.getBoolean("status"));
            employers.add(user);
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    return employers;
}
public List<User> getAllSeeker() {
    List<User> employers = new ArrayList<>();
    String query = "SELECT * FROM Users WHERE role = 'Seeker'";
    
    try {
        Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            User user = new User();
            user.setUserId(rs.getInt("user_id"));
            user.setUserName(rs.getString("user_name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setOauthProvider(rs.getString("oauth_provider"));
            user.setOauthId(rs.getString("oauth_id"));
            user.setRole(rs.getString("role"));
            user.setBalance(rs.getInt("balance"));
            user.setDescription(rs.getString("description"));
            user.setSpecification(rs.getString("specification"));
            user.setAddress(rs.getString("address"));
            user.setAvatarUrl(rs.getString("avatar_url"));
            user.setDateOfBirth(rs.getDate("date_of_birth"));
            user.setStatus(rs.getBoolean("status"));
            employers.add(user);
        }
    } catch (Exception e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    return employers;
}
    ///Xem xét

    public int getQuantityOfAppliedJob(User u) {
        String sql = """
                     SELECT COUNT(*) AS TotalApplications FROM JobGreetings
                     WHERE job_seeker_id = ?;""";
        int quantityOfAppliedJob = 0;
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, u.getUserId());
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                quantityOfAppliedJob = rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quantityOfAppliedJob;
    }

    public int getQuantityOfPostedJob(User u) {
        String sql = """
                     SELECT COUNT(*) AS TotalPost FROM Job
                     WHERE user_id = ?;""";
        int quantityOfPostedJob = 0;
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, u.getUserId());
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                quantityOfPostedJob = rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quantityOfPostedJob;

    }
    
    public boolean updateBalance(User user) {
        String sql = "UPDATE Users SET balance = ? WHERE email = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user.getBalance()); // Đặt giá trị mới cho balance
            ps.setString(2, user.getEmail()); // Đặt email để tìm người dùng

            int rowsUpdated = ps.executeUpdate(); // Thực hiện cập nhật
            return rowsUpdated > 0; // Trả về true nếu cập nhật thành công
        } catch (Exception e) {
            e.printStackTrace(); // In ra thông báo lỗi
            return false; // Trả về false nếu có lỗi
        }
    }
    
    public static String getMd5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    
    public boolean updateStatus(User user){
        String sql = "UPDATE Users SET status = ? WHERE user_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setBoolean(1, user.isStatus()); // Đặt giá trị mới cho status
            ps.setInt(2, user.getUserId()); // Đặt email để tìm người dùng

            int rowsUpdated = ps.executeUpdate(); // Thực hiện cập nhật
            return rowsUpdated > 0; // Trả về true nếu cập nhật thành công
        } catch (Exception e) {
            e.printStackTrace(); // In ra thông báo lỗi
            return false; // Trả về false nếu có lỗi
        }
    }
      public List<User> getAllBanUser() {

        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM Users WHERE STATUS = 0";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUserName(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setOauthProvider(rs.getString("oauth_provider"));
                user.setOauthId(rs.getString("oauth_id"));
                user.setRole(rs.getString("role"));
                user.setBalance(rs.getInt("balance"));
                user.setDescription(rs.getString("description"));
                user.setSpecification(rs.getString("specification"));
                user.setAddress(rs.getString("address"));
                user.setAvatarUrl(rs.getString("avatar_url"));
                user.setDateOfBirth(rs.getDate("date_of_birth"));
                user.setStatus(rs.getBoolean("status"));
                users.add(user);
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);

        }
        return users;
    }
    
    public static void main(String[] args) {
        UserDAO u = new UserDAO();
      User user = new User(7, true);
      u.updateStatus(user);
       
        System.out.println("hehe");
    }

}
