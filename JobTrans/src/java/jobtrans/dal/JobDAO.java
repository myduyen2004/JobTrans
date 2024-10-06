package jobtrans.dal;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jobtrans.model.Job;
import jobtrans.model.JobGreetings;
import jobtrans.model.User;
import jobtrans.utils.DBConnection;

public class JobDAO {

    private static final Logger logger = Logger.getLogger(JobDAO.class.getName());

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
