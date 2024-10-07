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
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.model.Job;
import jobtrans.model.Category;
import jobtrans.model.JobGreetings;
import jobtrans.model.User;
import jobtrans.utils.DBConnection;

/**
 *
 * @author admin
 */
public class JobDAO {
    private final DBConnection dbConnection;
    private UserDAO userDao = new UserDAO();
    private JobDAO jobDao = new JobDAO();

    public JobDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public Job getJobById(int jobId) {
        Job job = null;
        Category cat;
        String sql = "SELECT * FROM Job WHERE job_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, jobId);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int employer = rs.getInt(2);
                String jobTitle = rs.getNString(3);
                double budget = rs.getDouble(4);
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

    public Category getJobCategoryById(int categoryId) {
        Category cat = null;
        String sql = "SELECT * FROM JobCategory WHERE category_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, categoryId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                String categoryName = rs.getNString(2);
                String description = rs.getNString(3);
                cat = new Category(categoryId, categoryName, description);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cat;
    }

    public ArrayList<JobGreetings> getGreetingAcceptList(Job job) {
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

    public JobGreetings getGreetingAccept(Job job, User u) {
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

    public void updateJobStatusAndDeposit(Job job) {
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

    public void updateJobStatus(Job job) {
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

//    private final DBConnection dbConnection;
//
//    public JobDAO() {
//        dbConnection = DBConnection.getInstance();
//    }

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> cateList = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM JobCategory";

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int categoryId = rs.getInt(1);
                String categoryName = rs.getNString(2);
                String description = rs.getNString(3);

                Category cate = new Category(categoryId, categoryName, description);
                cateList.add(cate);
            }

            rs.close();
            statement.close();
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cateList;
    }

    public Category getCateByName(String name) {
        String sql = "SELECT * FROM JobCategory WHERE category_name = ?";

        Category cate = null;

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setNString(1, name);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int categoryId = rs.getInt(1);
                String categoryName = rs.getNString(2);
                String description = rs.getNString(3);

                cate = new Category(categoryId, categoryName, description);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cate;
    }

    public Category getCateById(int id) {
        String sql = "SELECT * FROM JobCategory WHERE category_id = ?";

        Category cate = null;

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int categoryId = rs.getInt(1);
                String categoryName = rs.getNString(2);
                String description = rs.getNString(3);

                cate = new Category(categoryId, categoryName, description);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cate;
    }

    public void createJob(Job j) {
        String sql = "INSERT INTO \n" +
                " Job(user_id, job_title, budget, description, due_date, status, category_id, doc_URL, address)\n" +
                " VALUES (?,?,?,?,?,?,?,?,?)";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, j.getUserId());
            statement.setNString(2, j.getJobTitle());
            statement.setInt(3, (int) j.getBudget());
            statement.setNString(4, j.getDescription());
            statement.setDate(5, new java.sql.Date(j.getDueDate().getTime()));
            statement.setNString(6, j.getStatus());
            statement.setInt(7, j.getCategoryId());
            statement.setString(8, j.getDocURL());
            statement.setNString(9, j.getAddress());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Job> getAllJob() {
        ArrayList<Job> jobList = new ArrayList<>();

        String sql = "SELECT * FORM Job";

        Connection con;
        try {
            con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int jobId = rs.getInt(1);
                int userId = rs.getInt(2);
                String title = rs.getNString(3);
                String des = rs.getNString(4);
                Date date = rs.getDate(5);
                String status = rs.getNString(6);
                int cateId = rs.getInt(7);
                String empFeedback = rs.getNString(8);
                String seekerFeedback = rs.getNString(9);
                float secureWallet = rs.getInt(10);
                String docURL = rs.getNString(11);
                float budget = rs.getInt(12);
                String inURL = rs.getString(13);
                Date inDate = rs.getDate(14);
                String address = rs.getNString(15);

                Job j = new Job(jobId, userId, title, budget, des, date, status, cateId, empFeedback, seekerFeedback,
                        docURL, secureWallet, inURL, inDate, address);

                jobList.add(j);

                rs.close();
                statement.close();
                con.close();
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return jobList;
    }

    public ArrayList<Job> getAllJobByUserEmail(String Email) {
        ArrayList<Job> jobList = new ArrayList<>();

        UserDAO userDAO = new UserDAO();

        int uId = userDAO.getUserByEmail(Email).getUserId();

        String sql = "select * from Job where user_id = ?";

        Connection con;
        try {
            con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, uId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int jobId = rs.getInt(1);
                int userId = rs.getInt(2);
                String title = rs.getNString(3);
                String des = rs.getNString(4);
                Date date = rs.getDate(5);
                String status = rs.getNString(6);
                int cateId = rs.getInt(7);
                String empFeedback = rs.getNString(8);
                String seekerFeedback = rs.getNString(9);
                float secureWallet = rs.getInt(10);
                String docURL = rs.getString(11);
                float budget = rs.getInt(12);
                String inURL = rs.getString(13);
                Date inDate = rs.getDate(14);
                String address = rs.getNString(15);
                Job j = new Job(jobId, userId, title, budget, des, date, status, cateId, empFeedback, seekerFeedback,
                        docURL, secureWallet, inURL, inDate, address);

                jobList.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return jobList;
    }

    public Job getJobByJobId(int id) {
        Job j = null;
        String sql = "select * from Job where job_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int jobId = rs.getInt(1);
                int userId = rs.getInt(2);
                String title = rs.getNString(3);
                String des = rs.getNString(4);
                Date date = rs.getDate(5);
                String status = rs.getNString(6);
                int cateId = rs.getInt(7);
                String empFeedback = rs.getNString(8);
                String seekerFeedback = rs.getNString(9);
                float secureWallet = rs.getInt(10);
                String docURL = rs.getString(11);
                float budget = rs.getInt(12);
                String inURL = rs.getString(13);
                Date inDate = rs.getDate(14);
                String address = rs.getNString(15);
                j = new Job(jobId, userId, title, budget, des, date, status, cateId, empFeedback, seekerFeedback,
                        docURL, secureWallet, inURL, inDate, address);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return j;
    }

    public void deleteJobById(int id) {
        String sql = "DELETE FROM Job WHERE job_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            statement.execute();
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateJob(Job job) {
        String sql = "UPDATE Job\n" +
                "SET job_title = ?, description = ?, due_date = ?, budget = ?, address = ?, category_id = ? \n" +
                "WHERE job_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setNString(1, job.getJobTitle());
            statement.setNString(2, job.getDescription());
            statement.setDate(3, new java.sql.Date(job.getDueDate().getTime()));
            statement.setInt(4, (int) job.getBudget());
            statement.setNString(5, job.getAddress());
            statement.setInt(6, job.getCategoryId());
            statement.setInt(7, job.getJobId());
            statement.execute();
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateJobInterview(Job job) {
        String sql = "UPDATE Job\n" +
                "SET interview_URL = ?, interview_Date = ? \n" +
                "WHERE job_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setNString(1, job.getInterviewURL());
            statement.setDate(2, new java.sql.Date(job.getInterviewDate().getTime()));
            statement.setInt(3, job.getJobId());
            statement.execute();
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<JobGreetings> getJobGreetingByJobId(int id) {
        ArrayList<JobGreetings> jgList = new ArrayList<>();

        String sql = "SELECT * FROM JobGreetings WHERE job_id=?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int greetingId = rs.getInt(1);
                int seekerId = rs.getInt(2);
                int jobId = rs.getInt(3);
                String introduction = rs.getNString(4);
                String attachment = rs.getString(5);
                double price = rs.getInt(6);
                boolean status = rs.getBoolean(7);
                JobGreetings jg = new JobGreetings(greetingId, seekerId, jobId, introduction, attachment, price, sql);
                jgList.add(jg);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return jgList;
    }

    public static void main(String[] args) {
        JobDAO jd = new JobDAO();
        Job jobList = new Job(3, "newTile", "abcde", "10-10-2024", 50000, 3, "Đà Nẵng");
        jd.updateJob(jobList);
    }
}
