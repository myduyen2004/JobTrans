package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jobtrans.model.Job;
import jobtrans.model.process;
import jobtrans.utils.DBConnection;

public class JobProcessDAO {
    private final DBConnection dbConnection;

    // Constructor to initialize DBConnection instance
    public JobProcessDAO() {
        dbConnection = DBConnection.getInstance();
    }

    // Method to get all processes by greeting_id
    public List<process> getProcessesByJobId(int jobId) {
        List<process> processList = new ArrayList<>();
        String query = "SELECT * FROM process WHERE job_id = ?";

        try (
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query)
        ) {
            // Set the greeting_id parameter for the query
            ps.setInt(1, jobId);

            // Execute the query and retrieve the result set
            ResultSet rs = ps.executeQuery();

            // Iterate through the result set and map each row to a Process object
            while (rs.next()) {
                process process = new process();
                process.setProcessId(rs.getInt("process_id"));
                process.setStageName(rs.getString("stage_name"));
                process.setEndDate(rs.getDate("end_date"));
                process.setRequirements(rs.getString("requirements"));
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
    
    public boolean updateProcessDescription(int processId, String description_result) {
    String query = "UPDATE process SET description_result = ? WHERE process_id = ?";
    
    try (
        Connection con = dbConnection.openConnection(); // Mở kết nối cơ sở dữ liệu
        PreparedStatement ps = con.prepareStatement(query) // Chuẩn bị câu truy vấn SQL
    ) {
        // Đặt tham số cho câu truy vấn
        ps.setString(1, description_result); // Tham số đầu tiên là giá trị mới cho "result"
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
    public boolean updateProcessFile(int processId, String result_url) {
    String query = "UPDATE process SET result_url = ? WHERE process_id = ?";
    
    try (
        Connection con = dbConnection.openConnection(); // Mở kết nối cơ sở dữ liệu
        PreparedStatement ps = con.prepareStatement(query) // Chuẩn bị câu truy vấn SQL
    ) {
        // Đặt tham số cho câu truy vấn
        ps.setString(1, result_url); // Tham số đầu tiên là giá trị mới cho "result"
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
    String sql = "SELECT TOP 1 j.* " +
                 "FROM Job j " +
                 "JOIN JobGreetings jg ON j.job_id = jg.job_id " +
                 "JOIN process p ON jg.greeting_id = p.greeting_id " +
                 "WHERE p.process_id = ?";

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
    
    
//         
//        int greetingId = 31;  // Replace with a valid greeting_id from your DB
//
//        // Retrieve and print the processes
//        List<process> processes = jobProcessDAO.getProcessesByGreetingId(greetingId);
//
//        if (processes.isEmpty()) {
//            System.out.println("No processes found for greeting_id: " + greetingId);
//        } else {
//            System.out.println("Processes for greeting_id: " + greetingId);
//            for (process process : processes) {
//                System.out.println(process);
//            }
//        }
//int processId = 8;
//        String newResult = "Completed successfully";
//
//        // Gọi phương thức updateProcessResult để cập nhật result
//        boolean isUpdated = jobProcessDAO.updateProcessResult(processId, newResult);
//
//        // Kiểm tra kết quả cập nhật
//        if (isUpdated) {
//            System.out.println("Cập nhật kết quả thành công cho process_id: " + processId);
//        } else {
//            System.out.println("Cập nhật thất bại hoặc không có bản ghi nào bị ảnh hưởng.");
//        }
    }


  



