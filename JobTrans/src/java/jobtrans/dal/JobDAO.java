package jobtrans.dal;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
    private static final Logger logger = Logger.getLogger(JobDAO.class.getName());
    private final DBConnection dbConnection;
    private UserDAO userDao = new UserDAO();
    private JobGreetingDAO jobGreetingDao = new JobGreetingDAO();

    public JobDAO() {
        dbConnection = DBConnection.getInstance();
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
            java.sql.Date dueDate = rs.getDate("due_date");
            String status = rs.getString("status");
            int categoryId = rs.getInt("category_id");
            String employerFeedback = rs.getString("employer_feedback");
            String seekerFeedback = rs.getString("seeker_feedback");
            double secureWallet = rs.getInt(11);
            // Add the Job object to the list
            Job job = new Job(userId, jobId, jobTitle, budget, description, dueDate, status, categoryId, employerFeedback, seekerFeedback,secureWallet);
            jobs.add(job);
        }

    } catch (SQLException ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "SQL error while fetching all jobs", ex);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Unexpected error while fetching all jobs", ex);
    }

    return jobs;
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
                job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setUserId(rs.getInt("user_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setBudget(rs.getInt("budget"));
                job.setDescription(rs.getString("description"));
                job.setDueDate(rs.getDate("due_date"));
                job.setStatus(rs.getString("status"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setEmpFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocURL(rs.getString("doc_URL"));
                job.setInterviewURL(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return job;
    }
    public List<Job> getJobsByUserId(int userId) {
        List<Job> listJob = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM [dbo].[Job] WHERE user_id = ?";

        try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setUserId(rs.getInt("user_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setBudget(rs.getInt("budget"));
                job.setDescription(rs.getString("description"));
                job.setDueDate(rs.getDate("due_date"));
                job.setStatus(rs.getString("status"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setEmpFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocURL(rs.getString("doc_URL"));
                job.setInterviewURL(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                
                listJob.add(job); // Thêm job vào danh sách
            }
            rs.close();
            statement.close();
            con.close();
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error while fetching jobs for user ID " + userId, ex);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "An unexpected error occurred while fetching jobs for user ID " + userId, ex);
        }

        return listJob;
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
            java.sql.Date dueDate = rs.getDate("due_date");
            String  status = rs.getString("status");
            String employerFeedback = rs.getString("employer_feedback");
            String seekerFeedback = rs.getString("seeker_feedback");
            double secureWallet = rs.getInt(11);
            // Create a Job object using the data
            Job job = new Job(userId, jobId, jobTitle, budget, description, dueDate, status, categoryId, employerFeedback, seekerFeedback,secureWallet);
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

    public int findJobIdByUserId(int userId) {
        int jobId = 0;  // Nếu không có job, trả về 0
        DBConnection db = DBConnection.getInstance(); // Lấy instance của kết nối DB
        String sql = "SELECT job_id FROM Job WHERE user_id = ?;"; // SQL lấy job_id theo user_id

        try (Connection con = db.openConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {
            preStatement.setInt(1, userId); // Set tham số userId vào câu truy vấn
            ResultSet resultSet = preStatement.executeQuery(); // Thực hiện câu truy vấn

            // Trả về job_id nếu tìm thấy
            if (resultSet.next()) {
                jobId = resultSet.getInt("job_id");
            }
            resultSet.close(); // Đóng ResultSet sau khi sử dụng
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error while fetching jobs for user ID " + userId, ex);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "An unexpected error occurred while fetching jobs for user ID " + userId, ex);
        }

        return jobId; // Trả về jobId
    }

   
    public List<Object> getJobAndGreetingsByJobId(int jobId) {
        List<Object> combinedList = new ArrayList<>();

        // Lấy Job bằng jobId và thêm vào danh sách
        Job job = getJobById(jobId);
        if (job != null) {
            combinedList.add(job);
        }

        // Lấy danh sách JobGreetings bằng jobId và thêm tất cả vào danh sách
        List<JobGreetings> greetingsList = jobGreetingDao.getJobGreetingByJobId(jobId);
        combinedList.addAll(greetingsList);

        return combinedList;
    }
    public List<Job> getJobsConfirmedByUserId(int userId) {
        List<Job> listJob = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM [dbo].[Job] WHERE user_id = ? AND status IS NOT NULL";
        try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                 Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setUserId(rs.getInt("user_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setBudget(rs.getInt("budget"));
                job.setDescription(rs.getString("description"));
                job.setDueDate(rs.getDate("due_date"));
                job.setStatus(rs.getString("status"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setEmpFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocURL(rs.getString("doc_URL"));
                job.setInterviewURL(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                
                listJob.add(job); // Thêm job vào danh sách
            }
            rs.close();
            statement.close();
            con.close();
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error while fetching jobs for user ID " + userId, ex);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "An unexpected error occurred while fetching jobs for user ID " + userId, ex);
        }

        return listJob;
    }
    
}
