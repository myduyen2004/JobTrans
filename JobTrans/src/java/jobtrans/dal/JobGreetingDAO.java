package jobtrans.dal;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import jobtrans.model.JobGreeting;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static jobtrans.controller.web.home.HomeServlet.BUFFER_SIZE;
import jobtrans.utils.DBConnection;

/**
 *
 * @author admin
 */
public class JobGreetingDAO {

    private final DBConnection dbConnection;

    public JobGreetingDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public List<JobGreeting> getJobGreetingBySeekerId(int jobSeekerId) throws Exception {
        List<JobGreeting> greetings = new ArrayList<>();
        String query = "SELECT * FROM JobGreetings WHERE job_seeker_id = ?";
        
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, jobSeekerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                JobGreeting greeting = new JobGreeting();
                greeting.setGreetingId(rs.getInt("greeting_id"));
                greeting.setJobSeekerId(rs.getInt("job_seeker_id"));
                greeting.setJobId(rs.getInt("job_id"));
                greeting.setIntroduction(rs.getString("introduction"));
                greeting.setAttachment(rs.getString("attachment"));
                greeting.setPrice(rs.getInt("price"));
                greeting.setStatus(rs.getString("status"));
                greeting.setExpectedDay(rs.getInt("expectedDay"));
                greeting.setCvId(rs.getInt("cv_id"));
                greetings.add(greeting);
            }
        } catch (SQLException e) {
            Logger.getLogger(JobGreetingDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return greetings;
    }
    
    public List<JobGreeting> getJobGreetingByJobId(int jobId) throws Exception {
        List<JobGreeting> greetings = new ArrayList<>();
        String query = "SELECT * FROM JobGreetings WHERE job_id = ?";

        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                JobGreeting greeting = new JobGreeting();
                greeting.setGreetingId(rs.getInt("greeting_id"));
                greeting.setJobSeekerId(rs.getInt("job_seeker_id"));
                greeting.setJobId(rs.getInt("job_id"));
                greeting.setIntroduction(rs.getString("introduction"));
                greeting.setAttachment(rs.getString("attachment"));
                greeting.setPrice(rs.getInt("price"));
                greeting.setStatus(rs.getString("status"));
                greeting.setExpectedDay(rs.getInt("expectedDay"));
                greeting.setCvId(rs.getInt("cv_id"));
                greetings.add(greeting);
            }
        } catch (SQLException e) {
            Logger.getLogger(JobGreetingDAO.class.getName()).log(Level.SEVERE, null, e);
            
        }
        return greetings;
    }
     
    public boolean addJobGreeting(JobGreeting jobGreeting) throws Exception {
        String query = "INSERT INTO JobGreetings (job_seeker_id, job_id, introduction, attachment, price, status, expectedDay, cv_id) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, jobGreeting.getJobSeekerId());
            ps.setInt(2, jobGreeting.getJobId());
            ps.setNString(3, jobGreeting.getIntroduction());
            ps.setNString(4, jobGreeting.getAttachment());
            ps.setInt(5, jobGreeting.getPrice());
            ps.setNString(6, jobGreeting.getStatus());
            ps.setInt(7, jobGreeting.getExpectedDay());
            ps.setInt(8, jobGreeting.getCvId());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            Logger.getLogger(JobGreetingDAO.class.getName()).log(Level.SEVERE, null, e);
            throw new Exception("Error adding job greeting", e);
        }
    }
    
    public boolean updateStatus(int greetingId, String status) throws Exception {
        String query = "UPDATE JobGreetings SET status = ? WHERE greeting_id = ?";
        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setNString(1, status);
            ps.setInt(2, greetingId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            Logger.getLogger(JobGreetingDAO.class.getName()).log(Level.SEVERE, null, e);
            throw new Exception("Error updating status for greeting ID: " + greetingId, e);
        }
    }
    
    public double getAveragePriceByJobId(int jobId) throws Exception {
        double averagePrice = 0;
        String sql = "SELECT AVG(price) AS average_price FROM JobGreetings WHERE job_id = ?";
        
        try (Connection con = dbConnection.openConnection();
            PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, jobId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    averagePrice = rs.getDouble("average_price");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return averagePrice;
    }
    
    public void deleteJobGreetingByJobId(int jobId) throws Exception {
        String sql = "DELETE FROM JobGreetings WHERE job_id = ?";

        try (Connection connection = dbConnection.openConnection(); 
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, jobId);
            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("JobGreeting(s) deleted successfully.");
            } else {
                System.out.println("No JobGreeting found with the given jobId.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean checkJobHasAcceptedGreeting(int jobId) throws Exception {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean hasAcceptedGreeting = false;

        try {
            // Câu truy vấn SQL
            String sql = "SELECT COUNT(*) FROM JobGreetings WHERE job_id = ? AND status = N'Được chấp nhận'";
            pstmt = dbConnection.openConnection().prepareStatement(sql);
            pstmt.setInt(1, jobId); // Gán giá trị job_id
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                hasAcceptedGreeting = count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return hasAcceptedGreeting;
    }
    
    public JobGreeting getJobGreetingsByJobIdAndStatus(int jobId, String status) throws Exception {
        String query = "SELECT * " +
                       "FROM [dbo].[JobGreetings] " +
                       "WHERE job_id = ? AND status = ?";
        JobGreeting jobGreeting = new JobGreeting();

        try (Connection connection = dbConnection.openConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, jobId);
            preparedStatement.setString(2, status);

            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                jobGreeting.setGreetingId(resultSet.getInt("greeting_id"));
                jobGreeting.setJobSeekerId(resultSet.getInt("job_seeker_id"));
                jobGreeting.setJobId(resultSet.getInt("job_id"));
                jobGreeting.setIntroduction(resultSet.getString("introduction"));
                jobGreeting.setAttachment(resultSet.getString("attachment"));
                jobGreeting.setPrice(resultSet.getInt("price"));
                jobGreeting.setStatus(resultSet.getString("status"));
                jobGreeting.setExpectedDay(resultSet.getInt("expectedDay"));
                jobGreeting.setCvId(resultSet.getInt("cv_id"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return jobGreeting;
    }
    
    public JobGreeting getJobGreetingBySeekerAndJob(int jobSeekerId, int jobId) throws Exception {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        JobGreeting jobGreeting = null;

        try {
            String sql = "SELECT * FROM JobGreetings WHERE job_seeker_id = ? AND job_id = ?";

            // Chuẩn bị câu truy vấn
            pstmt = dbConnection.openConnection().prepareStatement(sql);
            pstmt.setInt(1, jobSeekerId); // Gán giá trị job_seeker_id
            pstmt.setInt(2, jobId); // Gán giá trị job_id

            // Thực hiện truy vấn
            rs = pstmt.executeQuery();

            // Nếu tìm thấy kết quả
            if (rs.next()) {
                jobGreeting = new JobGreeting();
                jobGreeting.setGreetingId(rs.getInt("greeting_id"));
                jobGreeting.setJobSeekerId(rs.getInt("job_seeker_id"));
                jobGreeting.setJobId(rs.getInt("job_id"));
                jobGreeting.setIntroduction(rs.getString("introduction"));
                jobGreeting.setAttachment(rs.getString("attachment"));
                jobGreeting.setPrice(rs.getInt("price"));
                jobGreeting.setStatus(rs.getString("status"));
                jobGreeting.setExpectedDay(rs.getInt("expectedDay"));
                jobGreeting.setCvId(rs.getInt("cv_id"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } 

        return jobGreeting;
    }
    
    public JobGreeting getJobGreetingBySeekerID(int jobSeekerId) throws Exception {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        JobGreeting jobGreeting = null;

        try {
            String sql = "SELECT * FROM JobGreetings WHERE job_seeker_id = ?";

            // Chuẩn bị câu truy vấn
            pstmt = dbConnection.openConnection().prepareStatement(sql);
            pstmt.setInt(1, jobSeekerId);

            // Thực hiện truy vấn
            rs = pstmt.executeQuery();

            // Nếu tìm thấy kết quả
            if (rs.next()) {
                jobGreeting = new JobGreeting();
                jobGreeting.setGreetingId(rs.getInt("greeting_id"));
                jobGreeting.setJobSeekerId(rs.getInt("job_seeker_id"));
                jobGreeting.setJobId(rs.getInt("job_id"));
                jobGreeting.setIntroduction(rs.getString("introduction"));
                jobGreeting.setAttachment(rs.getString("attachment"));
                jobGreeting.setPrice(rs.getInt("price"));
                jobGreeting.setStatus(rs.getString("status"));
                jobGreeting.setExpectedDay(rs.getInt("expectedDay"));
                jobGreeting.setCvId(rs.getInt("cv_id"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } 

        return jobGreeting;
    }
    
    
    
    public static void main(String[] args) throws Exception {
        JobGreeting j = new JobGreeting(3, 1, "ahjajfsj", "hjssd", 10000000, "Đang tuyển", 5, 1);
        JobGreetingDAO dao = new JobGreetingDAO();
       
        System.out.println( dao.getJobGreetingBySeekerAndJob(3, 2));
    }

}
