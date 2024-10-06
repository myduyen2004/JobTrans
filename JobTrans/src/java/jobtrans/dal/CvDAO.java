/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.model.CV;
import jobtrans.model.CV_Skill;
import jobtrans.model.CV_education;
import jobtrans.model.CV_experience;
import jobtrans.model.JobInFor;
import jobtrans.model.User;
import jobtrans.utils.DBConnection;

/**
 *
 * @author mac
 */
public class CvDAO {
        private final DBConnection dbConnection;
        public CvDAO() {
        dbConnection = DBConnection.getInstance();      
        }
        
    public List<CV> getCVByID(String cid) {
    List<CV> cvlist = new ArrayList<>();
    DBConnection db = DBConnection.getInstance();
    String sql = "SELECT * FROM [dbo].[CV] WHERE user_id = ?";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert cid to integer
        int userId = Integer.parseInt(cid);
        statement.setInt(1, userId); // Bind the integer userId to the SQL query

        ResultSet rs = statement.executeQuery();

        // Use a while loop to handle multiple CV records for the user
        while (rs.next()) {
            CV cv = new CV(
                rs.getInt("cv_id"),            // Get cv_id if needed
                rs.getString("title"), 
                rs.getString("summary"), 
                rs.getDate("created_at"),
                    // Ensure the column name is correct                
                userId                         // This is the parsed user ID
            );
            cvlist.add(cv);
        }
        rs.close();
    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid user ID format: " + cid, e);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    return cvlist;  // Return the list of CVs
}
    public List<CV_experience> getCV_experiencesByID(String cv_id) {
    List<CV_experience> cv = new ArrayList<>();
    DBConnection db = DBConnection.getInstance();
    String sql = "SELECT \n" +
"    ce.cv_id,\n" +
"    ce.experience_id,\n" +
"    ce.years_of_experience,\n" +
"    ce.achievement,\n" +
"    c.company_name,\n" +
"    c.description\n" +
"FROM \n" +
"    CV_Experience ce\n" +
"JOIN \n" +
"    Company c ON ce.experience_id = c.experience_id\n" +
"WHERE \n" +
"    ce.cv_id = ? ";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert cid to integer
        int cvid = Integer.parseInt(cv_id);
        statement.setInt(1, cvid); // Bind the integer userId to the SQL query

        ResultSet rs = statement.executeQuery();

        // Use a while loop to handle multiple CV records for the user
        while (rs.next()) {
         
           CV_experience cvl = new CV_experience(
        cvid, // cv_id
        rs.getInt("experience_id"), // experience_id
        rs.getNString("company_name"), // company_name
        rs.getString("description"), // description
        rs.getInt("years_of_experience"), // years_of_experience
        rs.getString("achievement") // achievement
    );
         cv.add(cvl);
        }
        rs.close();
    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid user ID format: " + cv_id, e);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    return cv;  // Return the list of CVs
}
    
    /// học vấn
    public List<CV_education> getCV_educationsByID(String cv_id) {
    List<CV_education> cvList = new ArrayList<>();
    DBConnection db = DBConnection.getInstance();
    
    // Ensure education_id is selected
    String sql = "SELECT CE.cv_id, CE.education_id, CE.start_date, CE.end_date, CE.degree, S.field_of_study, S.school_name " +
                 "FROM CV_Education CE " +
                 "JOIN School S ON CE.education_id = S.education_id " +
                 "WHERE CE.cv_id = ?";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert cv_id to integer and set it in the query
        int cvid = Integer.parseInt(cv_id);
        statement.setInt(1, cvid);

        ResultSet rs = statement.executeQuery();

        // Use while loop to retrieve multiple education records
        while (rs.next()) {
            CV_education cvEducation = new CV_education(
                cvid,          // cv_id
                rs.getInt("education_id"),   // education_id
                rs.getNString("field_of_study"), // field_of_study
                rs.getString("school_name"), // school_name
                rs.getDate("start_date"),    // start_date
                rs.getDate("end_date"),      // end_date
                rs.getString("degree")       // degree
            );
            cvList.add(cvEducation); // Add to list
        }
        
        rs.close();
    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid cv_id format: " + cv_id, e);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    return cvList;  // Return the list of CV education records
}

    public List<CV_Skill> getCV_SkillsByID(String cv_id) {
    List<CV_Skill> skillList = new ArrayList<>();
    DBConnection db = DBConnection.getInstance();

    String sql = "SELECT " +
                 "Skill.skill_id, " +
                 "Skill.skill_name, " +
                 "CV_Skill.proficiency " +
                 "FROM CV_Skill " +
                 "JOIN Skill ON CV_Skill.skill_id = Skill.skill_id " +
                 "WHERE CV_Skill.cv_id = ?";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert cv_id to integer and set it in the query
        int cvid = Integer.parseInt(cv_id);
        statement.setInt(1, cvid);

        ResultSet rs = statement.executeQuery();

        // Use while loop to retrieve multiple skill records
        while (rs.next()) {
            CV_Skill cvSkill = new CV_Skill(
                cvid,                        // cv_id
                rs.getInt("skill_id"),        // skill_id
                rs.getString("skill_name"),   // skill_name
                rs.getString("proficiency")   // proficiency
            );
            skillList.add(cvSkill); // Add to list
        }

        rs.close();
    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid cv_id format: " + cv_id, e);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }

    return skillList; // Return the list of CV skill records
}
   public CV getCVByCVId(String cv_id) {
    CV cv = null; // Initialize CV object
    DBConnection db = DBConnection.getInstance();
    String sql = "SELECT * FROM [dbo].[CV] WHERE cv_id = ?";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert cv_id to integer
        int cvId = Integer.parseInt(cv_id);
        statement.setInt(1, cvId); // Bind the integer cvId to the SQL query

        ResultSet rs = statement.executeQuery();

        // Assuming a single CV will be returned for a given cv_id
        if (rs.next()) {
            cv = new CV(
                cvId,            // Get cv_id
                rs.getString("title"), 
                rs.getString("summary"), 
                rs.getDate("created_at"),
                rs.getInt("user_id")            // Get user_id associated with the CV
            );
        }
        rs.close();
    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid CV ID format: " + cv_id, e);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    return cv;  // Return the CV object (or null if not found)
}
public void deleteCV_experiencesByID(String cv_id) {
    DBConnection db = DBConnection.getInstance();
    String sql = "DELETE FROM CV_Experience WHERE cv_id = ?;\n" +
"DELETE FROM Company WHERE experience_id NOT IN (SELECT experience_id FROM CV_Experience)";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert cv_id to integer
        int cvid = Integer.parseInt(cv_id);
        statement.setInt(1, cvid); // Bind the integer cv_id to the SQL query

        // Execute the delete statement
        statement.executeUpdate(); // This performs the delete operation

    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid CV ID format: " + cv_id, e);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    // No return value needed, as the method is void
}
public void deleteCV_educationByID(String cv_id) {
    DBConnection db = DBConnection.getInstance();
    String sql = "DELETE FROM CV_Education WHERE cv_id = ?;\n" +
"DELETE FROM School WHERE education_id NOT IN (SELECT education_id FROM CV_Education)";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert cv_id to integer
        int cvid = Integer.parseInt(cv_id);
        statement.setInt(1, cvid); // Bind the integer cv_id to the SQL query

        // Execute the delete statement
        statement.executeUpdate(); // This performs the delete operation

    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid CV ID format: " + cv_id, e);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    // No return value needed, as the method is void
}
    public void deleteCV_SkillByID(String cv_id) {
    DBConnection db = DBConnection.getInstance();
    String sql = "DELETE FROM CV_Skill WHERE cv_id = ?;\n" +
"DELETE FROM Skill WHERE skill_id NOT IN (SELECT skill_id FROM CV_Skill)";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert cv_id to integer
        int cvid = Integer.parseInt(cv_id);
        statement.setInt(1, cvid); // Bind the integer cv_id to the SQL query

        // Execute the delete statement
        statement.executeUpdate(); // This performs the delete operation

    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid CV ID format: " + cv_id, e);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    // No return value needed, as the method is void
}
    public void deleteCVByID(String cv_id) {
    DBConnection db = DBConnection.getInstance();
    String sql = "DELETE FROM CV WHERE cv_id = ?;";

    try (Connection con = db.openConnection();
         PreparedStatement statement = con.prepareStatement(sql)) {

        // Convert cv_id to integer and set it in the query
        int cvid = Integer.parseInt(cv_id);
        statement.setInt(1, cvid); // Bind the integer cv_id to the SQL query

        // Execute the delete statement
        statement.executeUpdate(); // This performs the delete operation

    } catch (NumberFormatException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid cv_id format: " + cv_id, e);
    } catch (Exception ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }

    // No return value needed, as the method is void
}

    public static void main(String[] args) {
         CvDAO CvDAO = new CvDAO();
        
        List<CV_Skill> s = CvDAO.getCV_SkillsByID("2");
       
//         for (CV_Skill user : s) {
//             System.out.println(user);
//         }
        CV c =CvDAO.getCVByCVId("2");
        System.out.println(c);
        CvDAO.deleteCV_experiencesByID("2");
       }
}
