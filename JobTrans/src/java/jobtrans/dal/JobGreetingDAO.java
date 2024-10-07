/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.model.JobGreetings;
import jobtrans.utils.DBConnection;

/**
 *
 * @author ADM
 */
public class JobGreetingDAO {
    
    private final DBConnection dbConnection;

    public JobGreetingDAO() {
        dbConnection = DBConnection.getInstance();
    }
    public ArrayList<JobGreetings> getJobGreetingByJobId(int id){
        ArrayList<JobGreetings> jgList = new ArrayList<>();
        
        String sql = "SELECT * FROM JobGreetings WHERE job_id=?";
        
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                int greetingId = rs.getInt(1);
                int seekerId = rs.getInt(2);
                int jobId = rs.getInt(3);
                String introduction = rs.getNString(4);
                String attachment = rs.getString(5);
                float price = rs.getInt(6);
                String status = rs.getNString(7); 
                
                JobGreetings jg = new JobGreetings(greetingId, seekerId, jobId, introduction, attachment, price, status);
                jgList.add(jg);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return jgList;
    }
}
