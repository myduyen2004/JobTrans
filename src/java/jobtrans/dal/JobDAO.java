package jobtrans.dal;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import jobtrans.model.Job;
import jobtrans.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jobtrans.model.User;

/**
 *
 * @author admin
 */
public class JobDAO {

    private final DBConnection dbConnection;
    private UserDAO userDao = new UserDAO();
    private JobGreetingDAO jobGreetingDao = new JobGreetingDAO();

    public JobDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public List<Job> getAllJob() {
        List<Job> jobs = new ArrayList<>();
        String query = "SELECT * FROM Job";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
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
                job.setEmployerFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocUrl(rs.getString("doc_URL"));
                job.setInterviewUrl(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                job.setLabelVerify(rs.getString("label_verify"));
                jobs.add(job);
            }
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return jobs;
    }

    public Job getJobByJobId(int jobId) {
        Job job = null;
        String query = "SELECT * FROM Job WHERE job_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();
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
                job.setEmployerFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocUrl(rs.getString("doc_URL"));
                job.setInterviewUrl(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                job.setLabelVerify(rs.getString("label_verify"));
            }
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return job;
    }

    public List<Job> getJobByUserId(int userId) {
        List<Job> jobs = new ArrayList<>();
        String query = "SELECT * FROM Job WHERE user_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
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
                job.setEmployerFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocUrl(rs.getString("doc_URL"));
                job.setInterviewUrl(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                job.setLabelVerify(rs.getString("label_verify"));
                jobs.add(job);
            }
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return jobs;
    }

    public List<Job> getJobByCategory(int categoryId) {
        List<Job> jobs = new ArrayList<>();
        String query = "SELECT * FROM Job WHERE category_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
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
                job.setEmployerFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocUrl(rs.getString("doc_URL"));
                job.setInterviewUrl(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                job.setLabelVerify(rs.getString("label_verify"));
                jobs.add(job);
            }
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return jobs;
    }

    public boolean updateInterview(int jobId, String interviewUrl, Date interviewDate) {
        String query = "UPDATE Job SET interview_URL = ?, interview_Date = ? WHERE job_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, interviewUrl);
            ps.setDate(2, new java.sql.Date(interviewDate.getTime()));
            ps.setInt(3, jobId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu có bản ghi được cập nhật
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    public boolean createJob(Job job) {
        String query = "INSERT INTO Job (user_id, job_title, budget, description, due_date, status, category_id, doc_URL, address) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, job.getUserId());
            ps.setString(2, job.getJobTitle());
            ps.setInt(3, job.getBudget());
            ps.setString(4, job.getDescription());
            ps.setDate(5, new java.sql.Date(job.getDueDate().getTime()));
            ps.setString(6, job.getStatus());
            ps.setInt(7, job.getCategoryId());
            ps.setString(8, job.getDocUrl());
            ps.setString(9, job.getAddress());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    public boolean updateJob(Job job) {
        String query = "UPDATE Job SET job_title = ?, budget = ?, description = ?, due_date = ?, category_id = ?, doc_URL = ?, address = ? "
                + "WHERE job_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, job.getJobTitle());
            ps.setInt(2, job.getBudget());
            ps.setString(3, job.getDescription());
            ps.setDate(4, new java.sql.Date(job.getDueDate().getTime()));
            ps.setInt(5, job.getCategoryId());
            ps.setString(6, job.getDocUrl());
            ps.setString(7, job.getAddress());
            ps.setInt(8, job.getJobId());
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu có bản ghi được cập nhật
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    public boolean updateJobStatusAndWallet(int jobId, String status, int secureWallet) {
        String query = "UPDATE Job SET status = ?, secure_wallet+=? WHERE job_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setNString(1, status);
            ps.setInt(2, secureWallet);
            ps.setInt(3, jobId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu có bản ghi được cập nhật
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    public boolean updateJobStatus(int jobId, String status) {
        String query = "UPDATE Job SET status = ? WHERE job_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, jobId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
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

    public List<Job> get5Job() {
        List<Job> jobs = new ArrayList<>();
        String query = "SELECT j.*, COUNT(jg.greeting_id) AS greeting_count "
                + "FROM Job j "
                + "LEFT JOIN JobGreetings jg ON j.job_id = jg.job_id "
                + "GROUP BY j.job_id "
                + "ORDER BY greeting_count DESC "
                + "OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;";

        try (Connection con = dbConnection.openConnection(); PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

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
                job.setEmployerFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocUrl(rs.getString("doc_URL"));
                job.setInterviewUrl(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                job.setLabelVerify(rs.getString("label_verify"));
                jobs.add(job);
            }
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return jobs;
    }

    public List<Job> getJobsByCategoryIds(List<Integer> categoryIds) {
        List<Job> jobList = new ArrayList<>();

        String sql = "SELECT * FROM Job WHERE category_id IN (" + categoryIds.stream()
                .map(String::valueOf)
                .collect(Collectors.joining(",")) + ")";

    try (Connection con = dbConnection.openConnection();
        PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setDescription(rs.getString("description"));
                job.setBudget(rs.getInt("budget"));
                job.setDueDate(rs.getDate("due_date"));
                job.setLabelVerify(rs.getString("label_verify"));

                jobList.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobList;
    }

    public List<Job> getJobsByStatuses(List<String> statuses) {
        List<Job> jobList = new ArrayList<>();

        String sql = "SELECT * FROM Job WHERE status IN (N'" + statuses.stream()
                .map(String::valueOf)
                .collect(Collectors.joining("',N'")) + "')";

        try (Connection con = dbConnection.openConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
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
                job.setEmployerFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocUrl(rs.getString("doc_URL"));
                job.setInterviewUrl(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                job.setLabelVerify(rs.getString("label_verify"));

                jobList.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobList;
    }

    public List<String> getEmployerFeedbackByUserId(int userId) {
        List<String> feedbackList = new ArrayList<>();
        String query = "SELECT employer_feedback FROM Job WHERE user_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String feedback = rs.getString("employer_feedback");
                feedbackList.add(feedback);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public int getMaxJobId() {
        int maxJobId = -1;
        String sql = "SELECT MAX(job_id) AS max_job_id FROM Job";

        try (Connection connection = dbConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                maxJobId = resultSet.getInt("max_job_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return maxJobId;
    }

    public int addJobAndGetId(Job job) throws Exception {
        int newJobId = -1;  // Khởi tạo giá trị mặc định

        // Truy vấn SQL để thêm job và lấy job_id
        String sql = "INSERT INTO Job (user_id, job_title, budget, description, due_date, status, category_id, secure_wallet, doc_URL, address) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = dbConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Thiết lập các tham số cho câu lệnh insert
            preparedStatement.setInt(1, job.getUserId());
            preparedStatement.setNString(2, job.getJobTitle());
            preparedStatement.setInt(3, job.getBudget());
            preparedStatement.setNString(4, job.getDescription());
            preparedStatement.setDate(5, new java.sql.Date(job.getDueDate().getTime()));
            preparedStatement.setNString(6, job.getStatus());
            preparedStatement.setInt(7, job.getCategoryId());
            preparedStatement.setInt(8, 0);
            preparedStatement.setNString(9, job.getDocUrl());
            preparedStatement.setNString(10, job.getAddress());
            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    newJobId = generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return newJobId;
    }

    public List<Job> selectJobsExcludingHiring(User u) throws SQLException, Exception {
        String sql = "SELECT * FROM Job WHERE status != ? AND user_id = ?";
        List<Job> jobs = new ArrayList<>();

        try (PreparedStatement preparedStatement = dbConnection.openConnection().prepareStatement(sql)) {
            preparedStatement.setNString(1, "Đang tuyển");
            preparedStatement.setInt(2, u.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                // Tạo một đối tượng Job từ kết quả truy vấn
                Job job = new Job();
                job.setJobId(resultSet.getInt("job_id"));
                job.setUserId(resultSet.getInt("user_id"));
                job.setJobTitle(resultSet.getString("job_title"));
                job.setBudget(resultSet.getInt("budget"));
                job.setDescription(resultSet.getString("description"));
                job.setDueDate(resultSet.getDate("due_date"));
                job.setStatus(resultSet.getString("status"));
                job.setCategoryId(resultSet.getInt("category_id"));
                job.setEmployerFeedback(resultSet.getString("employer_feedback"));
                job.setSeekerFeedback(resultSet.getString("seeker_feedback"));
                job.setSecureWallet(resultSet.getInt("secure_wallet"));
                job.setDocUrl(resultSet.getString("doc_URL"));
                job.setInterviewUrl(resultSet.getString("interview_URL"));
                job.setInterviewDate(resultSet.getDate("interview_Date"));
                job.setAddress(resultSet.getString("address"));
                job.setLabelVerify(resultSet.getString("label_verify"));

                jobs.add(job);
            }
        }

        return jobs;
    }

    public List<Job> getAcceptedJobOfSeeker(int jobSeekerId) throws SQLException, Exception {
        String sql = "SELECT * "
                + "FROM Job j "
                + "JOIN JobGreetings jg ON j.job_id = jg.job_id "
                + "WHERE jg.job_seeker_id = ? AND jg.status = N'Được chấp nhận'";

        PreparedStatement ps = null;
        ResultSet rs = null;
        Job job = null;
        List<Job> jobs = new ArrayList<>();

        try {
            ps = dbConnection.openConnection().prepareStatement(sql);
            ps.setInt(1, jobSeekerId);
            rs = ps.executeQuery();

            while (rs.next()) {
                job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setUserId(rs.getInt("user_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setBudget(rs.getInt("budget"));
                job.setDescription(rs.getString("description"));
                job.setDueDate(rs.getDate("due_date"));
                job.setStatus(rs.getString("status"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setEmployerFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocUrl(rs.getString("doc_URL"));
                job.setInterviewUrl(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                job.setLabelVerify(rs.getString("label_verify"));

                jobs.add(job);
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }

        return jobs;
    }

    public List<Job> searchJobsByKeyword(String keyword) throws SQLException, Exception {
        String sql = "SELECT * "
                + "FROM Job "
                + "WHERE LOWER(job_title) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)";

        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Job> jobList = new ArrayList<>();

        try {
            ps = dbConnection.openConnection().prepareStatement(sql);
            String searchKeyword = "%" + keyword.toLowerCase() + "%";  // Chuyển từ khóa về chữ thường và thêm ký tự đại diện
            ps.setString(1, searchKeyword); // Gán từ khóa cho job_title
            ps.setString(2, searchKeyword); // Gán từ khóa cho description
            rs = ps.executeQuery();

            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setBudget(rs.getInt("budget"));
                job.setDescription(rs.getString("description"));
                job.setDueDate(rs.getDate("due_date"));
                job.setStatus(rs.getString("status"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setEmployerFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocUrl(rs.getString("doc_URL"));
                job.setInterviewUrl(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                job.setLabelVerify(rs.getString("label_verify"));

                jobList.add(job);  // Thêm từng job vào danh sách kết quả
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }

        return jobList;
    }

    public List<Job> getJobsByJobSeekerId(int jobSeekerId) throws Exception {

        String sql = "SELECT J.* FROM Job J "
                + "JOIN JobGreetings JG ON J.job_id = JG.job_id "
                + "WHERE JG.job_seeker_id = ? "
                + "ORDER BY J.job_id "
                + "OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY";
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Job> completedJobs = new ArrayList<>();

        try {
            ps = dbConnection.openConnection().prepareStatement(sql);
            ps.setInt(1, jobSeekerId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setUserId(rs.getInt("user_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setBudget(rs.getInt("budget"));
                job.setDescription(rs.getString("description"));
                job.setDueDate(rs.getDate("due_date"));
                job.setStatus(rs.getString("status"));
                completedJobs.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return completedJobs;
    }

    public int getQuantityOfJobSuccessful(int seekerId) {
        int quantity = 0;
        String query = "SELECT COUNT(jg.job_id) "
                + "FROM JobGreetings jg "
                + "INNER JOIN Job j ON jg.job_id = j.job_id "
                + "WHERE jg.job_seeker_id = ? AND j.status = N'Đã hoàn thành'";

        try (Connection con = dbConnection.openConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, seekerId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                quantity = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quantity;
    }

    public int getQuantityEmployerOfSeeker(int seekerId) {
        int quantity = 0;
        String query = "SELECT COUNT(DISTINCT j.user_id) "
                + "FROM JobGreetings jg "
                + "INNER JOIN Job j ON jg.job_id = j.job_id "
                + "WHERE jg.job_seeker_id = ? AND jg.status = N'Được chấp nhận'";

        try (Connection con = dbConnection.openConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, seekerId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                quantity = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quantity;
    }

    public Integer getJobIdBySeekerId(int jobSeekerId) {
        Integer jobId = null;
        String query = "SELECT job_id FROM JobGreetings WHERE job_seeker_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, jobSeekerId); // Truyền giá trị job_seeker_id
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                jobId = rs.getInt("job_id"); // Lấy job_id
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi nếu có
        }

        return jobId; // Trả về jobId
    }

    public void verifyJob(int jid) {
        String sql = "Update Job SET label_verify = N'Được duyệt' WHERE job_id = ?";

        Connection con;
        try {
            con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, jid); // Truyền giá trị job_seeker_id
            ps.execute();
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public Integer getNumberOfRows() {
        Integer numOfRows = 0;
        String sql = "SELECT * FROM Job";
        
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                numOfRows++;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE,null, ex);
        }

        return numOfRows;
    }
    
    public Integer getNumberOfRowsByStatuses( List<String> statuses) {
        Integer numOfRows = 0;
        String sql = "SELECT * FROM Job WHERE status IN (N'" + statuses.stream()
                .map(String::valueOf)
                .collect(Collectors.joining("',N'")) + "')";
        
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                numOfRows++;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE,null, ex);
        }

        return numOfRows;
    }
    
    public List<Job> findJobs(int currentPage, int recordsPerPage) {
        
        List<Job> jobs = new ArrayList<>();
        
        String sql = "With coun AS "
            + "( SELECT job_id, user_id, job_title, budget, description, due_date, status, category_id, employer_feedback, seeker_feedback, secure_wallet, "
            + "doc_URL, interview_URL, interview_Date, address, label_verify, "
            + "ROW_NUMBER() OVER (order by job_id) as RowNumber "
            + "FROM Job) "
            + "select * "
            + "from coun "
            + " Where RowNumber Between ? and ?";
        try {
            Connection con = dbConnection.openConnection();
            
            int start = currentPage * recordsPerPage - recordsPerPage + 1;
            System.out.println("start" + start);
            
            int end = recordsPerPage * currentPage;
            System.out.println("end " + end);
            System.out.println("record" + recordsPerPage);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
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
                job.setEmployerFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocUrl(rs.getString("doc_URL"));
                job.setInterviewUrl(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                job.setLabelVerify(rs.getString("label_verify"));
                jobs.add(job);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jobs;
    }
    
    public List<Job> findJobsByStatus(int currentPage, int recordsPerPage, List<String> statuses) {
        
        List<Job> jobs = new ArrayList<>();
        
        String sql = "With coun AS "
            + "( SELECT job_id, user_id, job_title, budget, description, due_date, status, category_id, employer_feedback, seeker_feedback, secure_wallet, "
            + "doc_URL, interview_URL, interview_Date, address, label_verify, "
            + "ROW_NUMBER() OVER (order by job_id) as RowNumber "
            + "FROM Job WHERE status IN (N'"+ statuses.stream().map(String::valueOf).collect(Collectors.joining("',N'")) +"' )) "
            + "select * "
            + "from coun "
            + " Where RowNumber Between ? and ?";
        try {
            Connection con = dbConnection.openConnection();
            
            int start = currentPage * recordsPerPage - recordsPerPage + 1;
            System.out.println("start" + start);
            
            int end = recordsPerPage * currentPage;
            System.out.println("end " + end);
            System.out.println("record" + recordsPerPage);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
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
                job.setEmployerFeedback(rs.getString("employer_feedback"));
                job.setSeekerFeedback(rs.getString("seeker_feedback"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setDocUrl(rs.getString("doc_URL"));
                job.setInterviewUrl(rs.getString("interview_URL"));
                job.setInterviewDate(rs.getDate("interview_Date"));
                job.setAddress(rs.getString("address"));
                job.setLabelVerify(rs.getString("label_verify"));
                System.out.println(job);
                jobs.add(job);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jobs;
    }

    public static void main(String[] args) {
        // JobDAO dao = new JobDAO();
        
        // List<String> statuses = new ArrayList<>();
        // statuses.add("Đã trả lương");
        
        // List<Job> jlist = dao.findJobsByStatus(1, 2, statuses);
        // System.out.println(jlist);
    }

    
}
