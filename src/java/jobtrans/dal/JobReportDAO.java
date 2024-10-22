/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

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
import jobtrans.model.JobReport;
/**
 *
 * @author ADM
 */
public class JobReportDAO {
    private final DBConnection dbConnection;

    public JobReportDAO() {
        dbConnection = DBConnection.getInstance();
    }
    
    public List<JobReport> getAllReportByJobId(int jid){
        List<JobReport> rl = new ArrayList<>();
        
        String sql = "SELECT * FROM JobReport WHERE reported_job = ?";
        
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, jid);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                JobReport jr = new JobReport();
                
                jr.setJobReportId(rs.getInt(1));
                jr.setReportedJob(rs.getInt(2));
                jr.setReportBy(rs.getInt(3));
                jr.setContentReport(rs.getNString(4));
                jr.setAttachment(rs.getNString(5));
                jr.setStatus(rs.getNString(6));
                
                rl.add(jr);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return rl;
    }
    
    public JobReport getJobReportByReportId(int rid){
        JobReport jr = new JobReport();
        
        String sql = "SELECT * FROM JobReport WHERE job_report_id = ?";
        
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, rid);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                jr.setJobReportId(rs.getInt(1));
                jr.setReportedJob(rs.getInt(2));
                jr.setReportBy(rs.getInt(3));
                jr.setContentReport(rs.getNString(4));
                jr.setAttachment(rs.getNString(5));
                jr.setStatus(rs.getNString(6));
            }
        } catch (Exception ex) {
            Logger.getLogger(JobReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return jr;
    }
    
    public void denyJobReportByReportId(int rid){
        String sql = "UPDATE JobReport SET status = ? WHERE job_report_id = ?";
        
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setNString(1, "Đã Từ Chối");
            ps.setInt(2, rid);
            ps.execute();
        } catch (Exception e) {
            Logger.getLogger(JobReportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    public static void main(String[] args) {
        JobReportDAO dao = new JobReportDAO();

        System.out.println(dao.getAllReportByJobId(5));
    }
}
