/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.model.Job;
import jobtrans.model.JobCategory;
import jobtrans.model.JobGreetings;
import jobtrans.model.User;
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
    public ArrayList<Job> getAllJob(){
        ArrayList<Job> jobs = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM [dbo].[Job]";
        
         try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql); 
            ResultSet rs = statement.executeQuery();
            System.out.println(rs);
            while (rs.next()) {
                int jobId = rs.getInt(1);
                int userId = rs.getInt(2);
                String jobTitle = rs.getNString(3);
                float budget = rs.getFloat(4);
                String description = rs.getNString(5);
                Date date = rs.getDate(6);
                String status = rs.getNString(7);
                int category = rs.getInt(8);
                String employerFeedback = rs.getNString(9);
                String seekerFeedback = rs.getNString(10);
                double secureWallet = rs.getInt(11);
                 Job job = new Job(jobId, userId, jobTitle, budget, description, date, status, category, employerFeedback, seekerFeedback, secureWallet);
                jobs.add(job);
               
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
    ex.getMessage();
        }
        return jobs;
    }
    
    public Job getJobById(int jobId) {
        Job job = null;  
        String sql = "SELECT * FROM Job WHERE job_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, jobId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int employer = rs.getInt(2);
                String jobTitle = rs.getNString(3);
                float budget = rs.getFloat(4);
                String description = rs.getNString(5);
                Date date = rs.getDate(6);
                String status = rs.getNString(7);
                int category = rs.getInt(8);
                String employerFeedback = rs.getNString(9);
                String seekerFeedback = rs.getNString(10);
                double secureWallet = rs.getInt(11);
                job = new Job(jobId, jobId, jobTitle, budget, description, date, status, category, seekerFeedback, seekerFeedback, secureWallet);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return job;
    }
    
    public JobCategory getJobCategoryById(int categoryId) {
        JobCategory cat = null;
        String sql = "SELECT * FROM JobCategory WHERE category_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, categoryId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                String categoryName = rs.getNString(2);
                String description = rs.getNString(3);
                cat = new JobCategory(categoryId, categoryName, description);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cat;
    }
    
    
    public ArrayList<JobGreetings> getGreetingAcceptList(Job job){
        ArrayList<JobGreetings> greetings = new ArrayList<>();
        double salary = 0;
        String sql = "SELECT * FROM JobGreetings WHERE job_id = ? AND status = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, job.getJobId());
            statement.setNString(2, "accepted");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                JobGreetings greeting = new JobGreetings();
                greeting.setGreetingId(rs.getInt(1));
                greeting.setJobSeekerId(rs.getInt(2));
                greeting.setJobId(rs.getInt(3));
                greeting.setIntroduction(rs.getNString(4));
                greeting.setAttachment(rs.getNString(5));
                greeting.setPrice(rs.getDouble(6));
                greeting.setStatus(rs.getNString(7));
                greetings.add(greeting);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return greetings;
    }
    
    public JobGreetings getGreetingAccept(Job job, User u){
        JobGreetings greeting = new JobGreetings();
        double salary = 0;
        String sql = "SELECT * FROM JobGreetings WHERE job_id = ? AND status = ? AND job_seeker_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, job.getJobId());
            statement.setNString(2, "accepted");
            statement.setInt(3, u.getUserId());
            
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                greeting.setGreetingId(rs.getInt(1));
                greeting.setJobSeekerId(rs.getInt(2));
                greeting.setJobId(rs.getInt(3));
                greeting.setIntroduction(rs.getNString(4));
                greeting.setAttachment(rs.getNString(5));
                greeting.setPrice(rs.getDouble(6));
                greeting.setStatus(rs.getNString(7));
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return greeting;
    }
    
    public void updateJobStatusAndDeposit(Job job){
        String sql = "UPDATE Job SET status = ? AND secure_wallet = secure_wallet + ? WHERE job_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, job.getStatus());
            statement.setDouble(2, job.getSecureWallet());
            statement.setInt(3, job.getJobId());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void updateJobStatus(Job job){
        String sql = "UPDATE Job SET status = ? WHERE job_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, job.getStatus());
            statement.setInt(2, job.getJobId());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void insertJGreeting(JobGreetings jg){
         String sql = "INSERT INTO [dbo].[JobGreetings]\n" +
"           ([job_seeker_id]\n" +
"           ,[job_id]\n" +
"           ,[introduction]\n" +
"           ,[attachment]\n" +
"           ,[price]\n" +
"           ,[status]\n" +
"           ,[expectedDay])\n" +
"     VALUES\n" +
"           (?,?,?,?,?,?,? )";
         try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, jg.getJobSeekerId());
            statement.setInt(2, jg.getJobId());
            statement.setNString(3, jg.getIntroduction());
            statement.setString(4, jg.getAttachment());
            statement.setDouble(5, jg.getPrice());
            statement.setString(6, jg.getStatus());
            statement.setInt(7, jg.getExpectedDay());
            statement.executeUpdate();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    
    public static void main(String[] args) {
        JobDAO jdao = new JobDAO();
        JobGreetings jg = new JobGreetings(1,2,"Test","Test",1000,"Test",5);
     jdao.insertJGreeting(jg);
        System.out.println("ok");
    }
}
