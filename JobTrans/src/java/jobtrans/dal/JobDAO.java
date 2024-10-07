package jobtrans.dal;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

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
    private final DBConnection dbConnection;
    private UserDAO userDao = new UserDAO();

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
            java.sql.Date dueDate = rs.getDate("due_date");
            String status = rs.getString("status");
            int categoryId = rs.getInt("category_id");
            String employerFeedback = rs.getString("employer_feedback");
            String seekerFeedback = rs.getString("seeker_feedback");
            double secureWallet = rs.getInt(11);
            // Create a Job object using the data
            job = new Job(userId, jobId, jobTitle, budget, description, dueDate, status, categoryId, employerFeedback, seekerFeedback,secureWallet);
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

//    private static final Logger logger = Logger.getLogger(JobDAO.class.getName());

//    public int findJobIdByUserId(int userId) {
//        int jobId = 0;  // Nếu không có job, trả về 0
//        DBConnection db = DBConnection.getInstance(); // Lấy instance của kết nối DB
//        String sql = "SELECT job_id FROM Job WHERE user_id = ?;"; // SQL lấy job_id theo user_id
//
//        try (Connection con = db.openConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {
//            preStatement.setInt(1, userId); // Set tham số userId vào câu truy vấn
//            ResultSet resultSet = preStatement.executeQuery(); // Thực hiện câu truy vấn
//
//            // Trả về job_id nếu tìm thấy
//            if (resultSet.next()) {
//                jobId = resultSet.getInt("job_id");
//            }
//            resultSet.close(); // Đóng ResultSet sau khi sử dụng
//        } catch (SQLException ex) {
//            logger.log(Level.SEVERE, "Error while fetching jobs for user ID " + userId, ex);
//        } catch (Exception ex) {
//            logger.log(Level.SEVERE, "An unexpected error occurred while fetching jobs for user ID " + userId, ex);
//        }
//
//        return jobId; // Trả về jobId
//    }
    public List<Job> getJobsByUserId(int userId) {
        List<Job> listJob = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM [dbo].[Job] WHERE user_id = ?";

        try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int jobId = rs.getInt("job_id");
                String jobTitle = rs.getString("job_title");
                int budget = rs.getInt("budget");
                String description = rs.getString("description");
                Date dueDate = rs.getDate("due_date");
                boolean status = rs.getBoolean("status"); // Chuyển đổi sang boolean
                int categoryId = rs.getInt("category_id");
                String employerFeedback = rs.getString("employer_feedback");
                String seekerFeedback = rs.getString("seeker_feedback");

                // Khởi tạo Job object với các tham số đúng
                Job job = new Job(jobId, userId, jobTitle, budget, description, dueDate, status, categoryId, employerFeedback, seekerFeedback);
                listJob.add(job);
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

    public Job getJobByJobId(int jobId) {
        Job job = null;
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT job_id, user_id, job_title, budget, description, due_date, status, category_id, employer_feedback, seeker_feedback "
                + "FROM Job WHERE job_id = ?";

        try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, jobId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setUserId(rs.getInt("user_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setBudget(rs.getFloat("budget")); // Thay đổi từ getInt sang getFloat cho budget
                job.setDescription(rs.getString("description"));
                job.setDueDate(rs.getDate("due_date"));
                job.setStatus(rs.getBoolean("status")); // Thay đổi getString thành getBoolean
                job.setCategoryId(rs.getInt("category_id"));
                job.setEmpFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));

            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return job;
    }

    public List<JobGreetings> getJobGreetingsByJobId(int jobId) {
        List<JobGreetings> greetingsList = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT greeting_id, job_seeker_id, job_id, introduction, attachment, price, status "
                + "FROM JobGreetings WHERE job_id = ?";

        try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, jobId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                JobGreetings jobGreetings = new JobGreetings();
                jobGreetings.setGreetingId(rs.getInt("greeting_id"));
                jobGreetings.setSeekerId(rs.getInt("job_seeker_id"));
                jobGreetings.setJobId(rs.getInt("job_id"));
                jobGreetings.setIntroduction(rs.getString("introduction"));
                jobGreetings.setAttachment(rs.getString("attachment"));
                jobGreetings.setPrice(rs.getFloat("price")); // getFloat cho price
                jobGreetings.setStatus(rs.getBoolean("status")); // getBoolean cho status

                greetingsList.add(jobGreetings); // Thêm vào danh sách
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return greetingsList;
    }

    public User getUserByJobGreeting(JobGreetings jobGreeting) {
        User user = null;
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT u.user_id, u.user_name, u.email FROM [Users] u "
                + "JOIN JobGreetings jg ON u.user_id = jg.job_seeker_id "
                + "WHERE jg.job_seeker_id = ?"; // Sử dụng tham số để truyền vào seekerId

        try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, jobGreeting.getSeekerId()); // Lấy seekerId từ jobGreeting
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUserName(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public List<Object> getJobAndGreetingsByJobId(int jobId) {
        List<Object> combinedList = new ArrayList<>();

        // Lấy Job bằng jobId và thêm vào danh sách
        Job job = getJobByJobId(jobId);
        if (job != null) {
            combinedList.add(job);
        }

        // Lấy danh sách JobGreetings bằng jobId và thêm tất cả vào danh sách
        List<JobGreetings> greetingsList = getJobGreetingsByJobId(jobId);
        combinedList.addAll(greetingsList);

        return combinedList;
    }

    public void confirmSeekerForJob(int greetingId, int jobId) {
        // Câu lệnh SQL để cập nhật bảng JobGreetings
        String updateJobGreetingsSQL = "UPDATE JobGreetings SET status = 1 WHERE greeting_id = ?";
        // Câu lệnh SQL để cập nhật bảng Job
        String updateJobStatusSQL = "UPDATE Job SET status = 'In progress' WHERE job_id = ?";

        // Khởi tạo đối tượng DBConnection
        DBConnection db = DBConnection.getInstance();

        try (Connection con = db.openConnection()) {
            // Cập nhật JobGreetings
            try (PreparedStatement updateJobGreetingsStmt = con.prepareStatement(updateJobGreetingsSQL)) {
                updateJobGreetingsStmt.setInt(1, greetingId);
                updateJobGreetingsStmt.executeUpdate();
            }

            // Cập nhật Job
            try (PreparedStatement updateJobStatusStmt = con.prepareStatement(updateJobStatusSQL)) {
                updateJobStatusStmt.setInt(1, jobId);
                updateJobStatusStmt.executeUpdate();
            }

            con.commit(); // Commit thay đổi sau khi cập nhật cả hai bảng

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Job> getJobsConfirmedByUserId(int userId) {
        List<Job> listJob = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM [dbo].[Job] WHERE user_id = ? AND status IS NOT NULL";

        try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int jobId = rs.getInt("job_id");
                String jobTitle = rs.getString("job_title");
                int budget = rs.getInt("budget");
                String description = rs.getString("description");
                Date dueDate = rs.getDate("due_date");
                boolean status = rs.getBoolean("status"); // Chuyển đổi sang boolean
                int categoryId = rs.getInt("category_id");
                String employerFeedback = rs.getString("employer_feedback");
                String seekerFeedback = rs.getString("seeker_feedback");

                // Khởi tạo Job object với các tham số đúng
                Job job = new Job(jobId, userId, jobTitle, budget, description, dueDate, status, categoryId, employerFeedback, seekerFeedback);
                listJob.add(job);
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
    
    public static void main(String[] args) {
        // Khởi tạo đối tượng JobDAO
//        JobDAO jobDao = new JobDAO();
//
//        // Giả lập userId để test (thay đổi giá trị userId theo đúng dữ liệu của bạn trong database)
//        int testUserId = 2;  // Thay số 1 bằng một user_id thực tế từ cơ sở dữ liệu
//
//        // Gọi phương thức ViewJobsByUserId
//        List<Job> listJob = jobDao.ViewJobsByUserId(testUserId);
//
//        // Kiểm tra kết quả trả về
//        if (listJob.isEmpty()) {
//            System.out.println("Không có công việc nào cho người dùng với user_id: " + testUserId);
//        } else {
//            System.out.println("Danh sách công việc cho user_id: " + testUserId);
//            for (Job job : listJob) {
//                System.out.println("ID: " + job.getJobId() + ", Tiêu đề: " + job.getJobTitle()
//                        + ", Ngân sách: " + job.getBudget() + ", Trạng thái: " + (job.isStatus() ? "Đã hoàn thành" : "Chưa hoàn thành"));
//            }
//        }

        JobDAO jobDao = new JobDAO();
        int jobId = 1;

        // Gọi phương thức getJobGreetingsByJobId để lấy danh sách JobGreetings
        List<JobGreetings> greetingsList = jobDao.getJobGreetingsByJobId(jobId);

        // Kiểm tra và in thông tin JobGreetings cùng với thông tin người dùng
        if (greetingsList != null && !greetingsList.isEmpty()) {
            for (JobGreetings greeting : greetingsList) {
                System.out.println("Greeting ID: " + greeting.getGreetingId());
                System.out.println("Job ID: " + greeting.getJobId());
                System.out.println("Introduction: " + greeting.getIntroduction());
                System.out.println("Attachment: " + greeting.getAttachment());
                System.out.println("Price: " + greeting.getPrice());

                // Lấy thông tin người dùng từ JobGreetings
                User user = jobDao.getUserByJobGreeting(greeting);
                if (user != null) {
                    System.out.println("User ID: " + user.getUserId());
                    System.out.println("User Name: " + user.getUserName());
                    System.out.println("Email: " + user.getEmail());
                } else {
                    System.out.println("Người gửi không xác định.");
                }

                System.out.println("-----------------------------------");
            }
        } else {
            System.out.println("Không tìm thấy thông tin greetings cho jobId " + jobId);
        }
    }
}
