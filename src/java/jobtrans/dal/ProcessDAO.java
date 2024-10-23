package jobtrans.dal;

import java.beans.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import jobtrans.utils.DBConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import jobtrans.model.Process;

/**
 *
 * @author qn407
 */
public class ProcessDAO {

    private final DBConnection dbConnection;

    public ProcessDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public Process getProcessByProcessId(int processId) throws Exception {
        Process process = null;
        String query = "SELECT * FROM Process WHERE process_id = ?"; // Giả sử tên bảng là Process

        try (Connection con = dbConnection.openConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, processId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                process = new Process();
                process.setProcessId(rs.getInt("process_id")); // Giả sử cột tên là process_id
                process.setJobId(rs.getInt("job_id")); // Giả sử cột tên là job_id
                process.setStageName(rs.getString("stage_name")); // Giả sử cột tên là stage_name
                process.setDescriptionResult(rs.getString("description_result")); // Giả sử cột tên là description_result
                process.setEndDate(rs.getDate("end_date")); // Giả sử cột tên là end_date
                process.setResultUrl(rs.getString("result_url")); // Giả sử cột tên là result_url
            }
        } catch (SQLException e) {
            Logger.getLogger(ProcessDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return process;
    }

    public List<Process> getProcessesByJobId(int jobId) throws Exception {

        String sql = "SELECT * FROM Process WHERE job_id = ?";

        List<Process> processes = new ArrayList<>();

        try (Connection con = dbConnection.openConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Process process = new Process();
                    process.setProcessId(rs.getInt("process_id"));
                    process.setStageName(rs.getString("stage_name"));
                    process.setEndDate(rs.getDate("end_date"));
                    process.setRequirements(rs.getString("requirements"));
                    process.setDescriptionResult(rs.getString("description_result"));
                    process.setResultUrl(rs.getString("result_url"));
                    process.setStatus(rs.getString("status"));
                    process.setComments(rs.getString("comments"));
                    process.setJobId(rs.getInt("job_id"));
                    processes.add(process);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Lỗi khi lấy quy trình từ cơ sở dữ liệu", e);
        }

        return processes;
    }

    public Process createProcess(Process process) {
        
        int newProcessId = -1;
    String query = "INSERT INTO Process (job_id, stage_"
            + "name, requirements, end_date, requirement_url, status) "
            + "VALUES (?, ?, ?, ?, ?, ?)"; // Câu lệnh SQL để chèn dữ liệu vào bảng Process

    try (Connection con = dbConnection.openConnection();
         PreparedStatement ps = con.prepareStatement(query, java.sql.Statement.RETURN_GENERATED_KEYS)) {
        
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


    public static void main(String[] args) {
        // Tạo đối tượng ProcessDAO
        ProcessDAO processDAO = new ProcessDAO();

        // Tạo đối tượng Process với các thông tin cần thiết
        Process process = new Process();
        process.setJobId(1); // Thay đổi ID công việc theo nhu cầu của bạn
        process.setStageName("Giai đoạn 1");
        process.setRequirements("Yêu cầu cho giai đoạn 1");
        process.setEndDate(new Date()); // Ngày hiện tại
        process.setResultUrl(null); // Để trống URL (có thể để null)

        // Gọi phương thức createProcess
        processDAO.createProcess(process);

        // In thông báo thành công
        System.out.println("Đã tạo quy trình thành công.");
    }
}
