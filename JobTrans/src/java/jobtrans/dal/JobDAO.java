/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.model.Job;
import jobtrans.model.JobInFor;
import jobtrans.utils.DBConnection;

/**
 *
 * @author admin
 */
public class JobDAO {
    private final DBConnection dbConnection;

    public JobDAO() {
        dbConnection = DBConnection.getInstance();
    }
    public Job getJobByID(String cjd) {
    DBConnection db = DBConnection.getInstance();
    Job job = null;
    String sql = "SELECT * FROM Job WHERE job_id = ?;";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert cjd to an integer
        int jobId = Integer.parseInt(cjd);

        // Bind the integer jobId to the SQL query
        statement.setInt(1, jobId);  // Fix: setInt uses 1, not 2

        ResultSet rs = statement.executeQuery();

        if (rs.next()) {
            // Extract data from result set and create Job object
            int userId = rs.getInt("user_id");
            String jobTitle = rs.getString("job_title");
            int budget = rs.getInt("budget");
            String description = rs.getString("description");
            Date dueDate = rs.getDate("due_date");
            boolean status = rs.getBoolean("status");
            int categoryId = rs.getInt("category_id");
            String employerFeedback = rs.getString("employer_feedback");
            String seekerFeedback = rs.getString("seeker_feedback");

            // Create a Job object using the data
            job = new Job(userId, jobId, jobTitle, budget, description, dueDate, status, categoryId, employerFeedback, seekerFeedback);
        }

        rs.close();
    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid job ID format: " + cjd, e);
    } catch (SQLException ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "SQL error while fetching job by ID", ex);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Unexpected error while fetching job by ID", ex);
    }

    return job;
}
    public List<Job> getAllJobs() {
    DBConnection db = DBConnection.getInstance();
    List<Job> jobs = new ArrayList<>();
    String sql = "SELECT * FROM Job;";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql);
         ResultSet rs = statement.executeQuery()) {

        while (rs.next()) {
            // Extract data from each row and create a Job object
            int jobId = rs.getInt("job_id");
            int userId = rs.getInt("user_id");
            String jobTitle = rs.getString("job_title");
            int budget = rs.getInt("budget");
            String description = rs.getString("description");
            Date dueDate = rs.getDate("due_date");
            boolean status = rs.getBoolean("status");
            int categoryId = rs.getInt("category_id");
            String employerFeedback = rs.getString("employer_feedback");
            String seekerFeedback = rs.getString("seeker_feedback");

            // Add the Job object to the list
            Job job = new Job(userId, jobId, jobTitle, budget, description, dueDate, status, categoryId, employerFeedback, seekerFeedback);
            jobs.add(job);
        }

    } catch (SQLException ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "SQL error while fetching all jobs", ex);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Unexpected error while fetching all jobs", ex);
    }

    return jobs;
}
  public List<Job> getJobsByCategoryIdExcludingJobId(String categoryIdStr, String excludeJobIdStr) {
    DBConnection db = DBConnection.getInstance();
    List<Job> jobs = new ArrayList<>();
    String sql = "SELECT * FROM Job WHERE category_id = ? AND job_id != ?;";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert categoryIdStr and excludeJobIdStr to integers
        int categoryId = Integer.parseInt(categoryIdStr);
        int excludeJobId = Integer.parseInt(excludeJobIdStr);

        // Bind categoryId and excludeJobId to the SQL query
        statement.setInt(1, categoryId);
        statement.setInt(2, excludeJobId);

        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            // Extract data from result set and create Job object
            int userId = rs.getInt("user_id");
            int jobId = rs.getInt("job_id");
            String jobTitle = rs.getString("job_title");
            int budget = rs.getInt("budget");
            String description = rs.getString("description");
            Date dueDate = rs.getDate("due_date");
            boolean status = rs.getBoolean("status");
            String employerFeedback = rs.getString("employer_feedback");
            String seekerFeedback = rs.getString("seeker_feedback");

            // Create a Job object using the data
            Job job = new Job(userId, jobId, jobTitle, budget, description, dueDate, status, categoryId, employerFeedback, seekerFeedback);
            jobs.add(job); // Add job to the list
        }

        rs.close();
    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid ID format: categoryId=" + categoryIdStr + ", excludeJobId=" + excludeJobIdStr, e);
    } catch (SQLException ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "SQL error while fetching jobs by category ID, excluding job ID", ex);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Unexpected error while fetching jobs by category ID, excluding job ID", ex);
    }

    return jobs;
}


 public static void main(String[] args) {
         JobDAO userDAO = new JobDAO();
        
        List<Job> s = userDAO.getJobsByCategoryIdExcludingJobId("1", "5");
        
         for (Job user : s) {
             System.out.println(user);
         }
         
     }
}
    

