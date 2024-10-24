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
import jobtrans.model.Process;
import jobtrans.utils.DBConnection;

public class JobProcessDAO {

    private final DBConnection dbConnection;

    // Constructor to initialize DBConnection instance
    public JobProcessDAO() {
        dbConnection = DBConnection.getInstance();
    }
   
   public Process getProcessById(int processId) {
    Process process = null;
    String query = "SELECT * FROM process WHERE process_id = ?";
    try (
         Connection con = dbConnection.openConnection();
         PreparedStatement ps = con.prepareStatement(query)){
        ps.setInt(1, processId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            process = new Process();  // No need to re-declare 'process', just instantiate it
            
            process.setProcessId(rs.getInt("process_id"));
            process.setStageName(rs.getString("stage_name"));
            process.setEndDate(rs.getDate("end_date"));
            process.setRequirements(rs.getString("requirements"));
            process.setRequirementUrl(rs.getString("requirement_url"));
            process.setDescription(rs.getString("description_result"));
            process.setResultUrl(rs.getString("result_url"));
            process.setStatus(rs.getString("status"));
            process.setComments(rs.getString("comments"));
            process.setJobId(rs.getInt("job_id"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return process;
}

    // Method to get all processes by greeting_id
    public List<Process> getProcessesByJobId(int jobId) {
        List<Process> processList = new ArrayList<>();
        String query = "SELECT * FROM process WHERE job_id = ?";

        try (
                Connection con = dbConnection.openConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            // Set the greeting_id parameter for the query
            ps.setInt(1, jobId);

            // Execute the query and retrieve the result set
            ResultSet rs = ps.executeQuery();

            // Iterate through the result set and map each row to a Process object
            while (rs.next()) {
                Process process = new Process();
                process.setProcessId(rs.getInt("process_id"));
                process.setStageName(rs.getString("stage_name"));
                process.setEndDate(rs.getDate("end_date"));
                process.setRequirements(rs.getString("requirements"));
                process.setRequirementUrl(rs.getString("requirement_url"));
                process.setDescription(rs.getString("description_result"));
                process.setResultUrl(rs.getString("result_url"));
                process.setStatus(rs.getString("status"));
                process.setComments(rs.getString("comments"));
                process.setJobId(rs.getInt("job_id"));

                processList.add(process);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print exception details for debugging
        }

        // Return the list of Process objects
        return processList;
    }

    public boolean updateProcessDescription(int processId, String description) {
        String query = "UPDATE process SET description_result = ? WHERE process_id = ?";

        try (
                Connection con = dbConnection.openConnection(); // Mở kết nối cơ sở dữ liệu
                 PreparedStatement ps = con.prepareStatement(query) // Chuẩn bị câu truy vấn SQL
                ) {
            // Đặt tham số cho câu truy vấn
            ps.setString(1, description); // Tham số đầu tiên là giá trị mới cho "result"
            ps.setInt(2, processId);    // Tham số thứ hai là giá trị của "process_id"

            // Thực thi câu lệnh cập nhật
            int rowsAffected = ps.executeUpdate();

            // Nếu có ít nhất một hàng được cập nhật, trả về true
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace(); // In chi tiết lỗi ra để kiểm tra
        }

        // Trả về false nếu cập nhật không thành công
        return false;
    }

    public boolean updateProcessFile(int processId, String resultUrl) {
        String query = "UPDATE process SET result_url = ? WHERE process_id = ?";

        try (
                Connection con = dbConnection.openConnection(); // Mở kết nối cơ sở dữ liệu
                 PreparedStatement ps = con.prepareStatement(query) // Chuẩn bị câu truy vấn SQL
                ) {
            // Đặt tham số cho câu truy vấn
            ps.setString(1, resultUrl); // Tham số đầu tiên là giá trị mới cho "result"
            ps.setInt(2, processId);    // Tham số thứ hai là giá trị của "process_id"

            // Thực thi câu lệnh cập nhật
            int rowsAffected = ps.executeUpdate();

            // Nếu có ít nhất một hàng được cập nhật, trả về true
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace(); // In chi tiết lỗi ra để kiểm tra
        }

        // Trả về false nếu cập nhật không thành công
        return false;
    }

    public Job getJobByProcessId(int processId) {
        Job job = null;
        String sql = "SELECT TOP 1 j.* "
                + "FROM Job j "
                + "JOIN JobGreetings jg ON j.job_id = jg.job_id "
                + "JOIN process p ON jg.greeting_id = p.greeting_id "
                + "WHERE p.process_id = ?";

        try (
                PreparedStatement preparedStatement = dbConnection.openConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, processId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                job = new Job();
                job.setJobId(resultSet.getInt("job_id"));
                job.setJobTitle(resultSet.getString("job_title"));
                job.setBudget(resultSet.getInt("budget"));
                job.setDescription(resultSet.getString("description"));
                job.setDueDate(resultSet.getDate("due_date"));
                job.setStatus(resultSet.getString("status"));
                job.setCategoryId(resultSet.getInt("category_id"));
                // Add other fields as necessary
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
        return job; // Return the job or null if not found
    }

    public static void main(String[] args) {
        JobProcessDAO jobProcessDAO = new JobProcessDAO();

        int processId = 12; // Replace with the process ID you want to test

        // Retrieve the job associated with the given process ID
        Job job = jobProcessDAO.getJobByProcessId(processId);

        // Check if a job was found and print the details
        if (job != null) {
            System.out.println("Job ID: " + job.getJobId());
            System.out.println("Job Title: " + job.getJobTitle());
            System.out.println("Budget: " + job.getBudget());
            System.out.println("Description: " + job.getDescription());
            System.out.println("Due Date: " + job.getDueDate());
            System.out.println("Status: " + job.getStatus());
            System.out.println("Category ID: " + job.getCategoryId());
            // Print other fields as necessary
        } else {
            System.out.println("No job found for process ID: " + processId);
        }
    }

    public Process getProcessByProcessId(int processId) throws Exception {
        jobtrans.model.Process process = null;
        String query = "SELECT * FROM Process WHERE process_id = ?"; // Giả sử tên bảng là Process

        try (Connection con = dbConnection.openConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, processId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                process = new jobtrans.model.Process();
                process.setProcessId(rs.getInt("process_id")); // Giả sử cột tên là process_id
                process.setJobId(rs.getInt("job_id")); // Giả sử cột tên là job_id
                process.setStageName(rs.getString("stage_name")); // Giả sử cột tên là stage_name
                process.setDescription(rs.getString("description_result")); // Giả sử cột tên là description_result
                process.setEndDate(rs.getDate("end_date")); // Giả sử cột tên là end_date
                process.setResultUrl(rs.getString("result_url")); // Giả sử cột tên là result_url
            }
        } catch (SQLException e) {
            Logger.getLogger(JobProcessDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return process;
    }

    public Process createProcess(jobtrans.model.Process process) {
        int newProcessId = -1;
        String query = "INSERT INTO Process (job_id, stage_"
                + "name, requirements, end_date, requirement_url, status) "
                + "VALUES (?, ?, ?, ?, ?, ?)"; // Câu lệnh SQL để chèn dữ liệu vào bảng Process

        try (Connection con = dbConnection.openConnection(); PreparedStatement ps = con.prepareStatement(query, java.sql.Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, process.getJobId());
            ps.setString(2, process.getStageName());
            ps.setString(3, process.getRequirements());
            ps.setDate(4, new java.sql.Date(process.getEndDate().getTime()));
            ps.setString(5, process.getRequirementUrl());
            ps.setString(6, "Chưa hoàn thành"); // Trạng thái mặc định

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    newProcessId = generatedKeys.getInt(1);
                }
            }

        } catch (Exception e) {
            // Bỏ qua phần xử lý lỗi
        }
        return null;
    }
   public boolean updateProcessStatus(int processId) {
    String query = "UPDATE process SET status = N'Đã nộp' WHERE process_id = ?";

    try (
            Connection con = dbConnection.openConnection(); // Mở kết nối cơ sở dữ liệu
            PreparedStatement ps = con.prepareStatement(query) // Chuẩn bị câu truy vấn SQL
        ) {
        // Chỉ cần thiết lập tham số cho "process_id"
        ps.setInt(1, processId);   // Tham số thứ nhất là giá trị của "process_id"

        // Thực thi câu lệnh cập nhật
        int rowsAffected = ps.executeUpdate();

        // Nếu có ít nhất một hàng được cập nhật, trả về true
        return rowsAffected > 0;
    } catch (Exception e) {
        e.printStackTrace(); // In chi tiết lỗi ra để kiểm tra
    }

    // Trả về false nếu cập nhật không thành công
    return false;
}
}
