/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.model.Job;
import jobtrans.model.JobGreetings;
import jobtrans.utils.DBConnection;

/**
 *
 * @author admin
 */
public class JobGreetingDAO {

    private final DBConnection dbConnection;

    public JobGreetingDAO() {
        dbConnection = DBConnection.getInstance();
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
}
