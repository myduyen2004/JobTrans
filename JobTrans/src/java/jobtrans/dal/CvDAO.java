/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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
    String sql = "SELECT CE.cv_id, CE.education_id, CE.start_date, CE.end_date, CE.degree, CE.field_of_study, S.school_name " +
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

   ///////////////////////////////////insert
}
    public boolean insertCV(String title, String summary, Date createdAt, int userId) {
         DBConnection db = DBConnection.getInstance();
        String sql = "INSERT INTO CV (title, summary, created_at, user_id) VALUES (?, ?, ?, ?)";
        
     try (Connection con = db.openConnection();
         PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, title);                // Đặt giá trị cho title
            stmt.setString(2, summary);              // Đặt giá trị cho summary
            stmt.setDate(3, (java.sql.Date) createdAt);            // Đặt giá trị cho created_at
            stmt.setInt(4, userId);                  // Đặt giá trị cho user_id
            
            int rowsAffected = stmt.executeUpdate(); // Thực thi câu lệnh
            return rowsAffected > 0;                 // Trả về true nếu thêm thành công
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean insertCVExperience(int cvId, String experienceId, String yearsOfExperience, String achievement) {
    DBConnection db = DBConnection.getInstance();
    String sql = "INSERT INTO CV_Experience (cv_id, experience_id, years_of_experience, achievement) VALUES (?, ?, ?, ?)";

    try (
        Connection con = db.openConnection();
        PreparedStatement stmt = con.prepareStatement(sql)
    ) {  
        
        int experienceIdInt = Integer.parseInt(experienceId);
        int yearsOfExperienceInt = Integer.parseInt(yearsOfExperience);
        // Đặt các giá trị cho các tham số trong câu lệnh SQL
        stmt.setInt(1, cvId);                     // Đặt giá trị cho cv_id
        stmt.setInt(2, experienceIdInt);             // Đặt giá trị cho experience_id
        stmt.setInt(3, yearsOfExperienceInt);        // Đặt giá trị cho years_of_experience
        stmt.setString(4, achievement);           // Đặt giá trị cho achievement

        int rowsAffected = stmt.executeUpdate();  // Thực thi câu lệnh
        return rowsAffected > 0;                  // Trả về true nếu có ít nhất 1 hàng được chèn
    } catch (Exception e) {
        e.printStackTrace();  // In ra lỗi nếu xảy ra
    }

    return false;  // Trả về false nếu có lỗi
}

////// insert 
    /////
     public boolean insertCVSkill(int cvId, String skillId, String proficiency) {
        DBConnection db = DBConnection.getInstance();
        String sql = "INSERT INTO CV_Skill (cv_id, skill_id, proficiency) VALUES (?, ?, ?)";
        
        try (
            Connection con = db.openConnection();          
            PreparedStatement stmt = con.prepareStatement(sql)
        ) {
            // Bắt đầu chèn vào bảng Skill
            

                        
                        int skillIdInt = Integer.parseInt(skillId);
        
                        stmt.setInt(1, cvId);                 // Đặt giá trị cho cv_id
                        stmt.setInt(2, skillIdInt);              // Đặt giá trị cho skill_id
                        stmt.setString(3, proficiency);       // Đặt giá trị cho proficiency

                        int rowsAffectedCVSkill = stmt.executeUpdate();
                        
                        return rowsAffectedCVSkill > 0; // Trả về true nếu thêm vào CV_Skill thành công
                    
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false; // Trả về false nếu có lỗi
    }

    public boolean insertCVEducation(int cvId, String educationId, 
                                               String startDate, String endDate,String field_of_study,String degree) {
        DBConnection db = DBConnection.getInstance();
        String insertCVEducationSQL = "INSERT INTO CV_Education (cv_id, education_id, start_date, end_date,field_of_study, degree) VALUES (?, ?, ?, ?, ?,?)";

        try (
            Connection con = db.openConnection();
            PreparedStatement stmt = con.prepareStatement(insertCVEducationSQL)
        ) {
                        
                        int educationIdInt = Integer.parseInt(educationId);

                        // Bắt đầu chèn vào bảng CV_Education
                        stmt.setInt(1, cvId);                     // Đặt giá trị cho cv_id
                        stmt.setInt(2, educationIdInt);              // Đặt giá trị cho education_id
                        stmt.setString(3, startDate);             // Đặt giá trị cho start_date
                        stmt.setString(4, endDate); 
                        stmt.setString(5, field_of_study);
                        stmt.setString(6, degree);                // Đặt giá trị cho degree

                        int rowsAffectedCVEducation = stmt.executeUpdate();
                        
                        return rowsAffectedCVEducation > 0; // Trả về true nếu thêm vào CV_Education thành công
                    
                
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false; // Trả về false nếu có lỗi
    }
    
    public int getLastInsertedCVId() {
    DBConnection db = DBConnection.getInstance();
    String sql = "SELECT MAX(cv_id) AS last_cv_id FROM CV"; // Câu lệnh SQL lấy ID cuối cùng

    try (Connection con = db.openConnection();
         PreparedStatement stmt = con.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        if (rs.next()) {
            return rs.getInt("last_cv_id"); // Trả về giá trị cv_id cuối cùng
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return -1; // Trả về -1 nếu có lỗi
    
}
//    public boolean insertCompanyAndCVExperience(int cvId, String companyName, String description, int yearsOfExperience, String achievement) {
//         DBConnection db = DBConnection.getInstance();
//         
//            String insertCompanySQL = "INSERT INTO Company (company_name, description) VALUES (?, ?)";
//        String insertCVExperienceSQL = "INSERT INTO CV_Experience (cv_id, experience_id, years_of_experience, achievement) VALUES (?, ?, ?, ?)";
//        
//        try (
//            Connection con = db.openConnection();
//            PreparedStatement companyStmt = con.prepareStatement(insertCompanySQL, PreparedStatement.RETURN_GENERATED_KEYS);
//            PreparedStatement cvExperienceStmt = con.prepareStatement(insertCVExperienceSQL)
//        ) {
//            // Bắt đầu chèn vào bảng Company
//            companyStmt.setString(1, companyName);
//            companyStmt.setString(2, description);
//            int rowsAffectedCompany = companyStmt.executeUpdate();
//
//            if (rowsAffectedCompany > 0) {
//                // Lấy experience_id từ Company mới được tạo
//                try (ResultSet generatedKeys = companyStmt.getGeneratedKeys()) {
//                    if (generatedKeys.next()) {
//                        int experienceId = generatedKeys.getInt(1); // Lấy experience_id
//
//                        // Bắt đầu chèn vào bảng CV_Experience
//                        cvExperienceStmt.setInt(1, cvId);                  // Đặt giá trị cho cv_id
//                        cvExperienceStmt.setInt(2, experienceId);           // Đặt giá trị cho experience_id
//                        cvExperienceStmt.setInt(3, yearsOfExperience);      // Đặt giá trị cho years_of_experience
//                        cvExperienceStmt.setString(4, achievement);         // Đặt giá trị cho achievement
//
//                        int rowsAffectedCVExperience = cvExperienceStmt.executeUpdate();
//                        
//                        return rowsAffectedCVExperience > 0; // Trả về true nếu thêm vào CV_Experience thành công
//                    }
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
//        return false; // Trả về false nếu có lỗi
//    }
//       public boolean insertSchoolAndCVEducation(int cvId, String fieldOfStudy, String schoolName, 
//                                               String startDate, String endDate, String degree) {
//        DBConnection db = DBConnection.getInstance();
//        String insertSchoolSQL = "INSERT INTO School (field_of_study, school_name) VALUES (?, ?)";
//        String insertCVEducationSQL = "INSERT INTO CV_Education (cv_id, education_id, start_date, end_date, degree) VALUES (?, ?, ?, ?, ?)";
//
//        try (
//            Connection con = db.openConnection();
//            PreparedStatement schoolStmt = con.prepareStatement(insertSchoolSQL, PreparedStatement.RETURN_GENERATED_KEYS);
//            PreparedStatement cvEducationStmt = con.prepareStatement(insertCVEducationSQL)
//        ) {
//            // Bắt đầu chèn vào bảng School
//            schoolStmt.setString(1, fieldOfStudy);
//            schoolStmt.setString(2, schoolName);
//            int rowsAffectedSchool = schoolStmt.executeUpdate();
//
//            if (rowsAffectedSchool > 0) {
//                // Lấy education_id từ School mới được tạo
//                try (ResultSet generatedKeys = schoolStmt.getGeneratedKeys()) {
//                    if (generatedKeys.next()) {
//                        int educationId = generatedKeys.getInt(1); // Lấy education_id
//
//                        // Bắt đầu chèn vào bảng CV_Education
//                        cvEducationStmt.setInt(1, cvId);                     // Đặt giá trị cho cv_id
//                        cvEducationStmt.setInt(2, educationId);              // Đặt giá trị cho education_id
//                        cvEducationStmt.setString(3, startDate);             // Đặt giá trị cho start_date
//                        cvEducationStmt.setString(4, endDate);               // Đặt giá trị cho end_date
//                        cvEducationStmt.setString(5, degree);                // Đặt giá trị cho degree
//
//                        int rowsAffectedCVEducation = cvEducationStmt.executeUpdate();
//                        
//                        return rowsAffectedCVEducation > 0; // Trả về true nếu thêm vào CV_Education thành công
//                    }
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
//        return false; // Trả về false nếu có lỗi
//    }
//    public void deleteCV_SkillByID(String cv_id) {
//    DBConnection db = DBConnection.getInstance();
//    String sql = "DELETE FROM CV_Skill WHERE cv_id = ?;\n" +
//"DELETE FROM Skill WHERE skill_id NOT IN (SELECT skill_id FROM CV_Skill)";
//
//    try (Connection con = db.openConnection();
//         PreparedStatement statement = con.prepareStatement(sql)) {
//
//        // Convert cv_id to integer
//        int cvid = Integer.parseInt(cv_id);
//        statement.setInt(1, cvid); // Bind the integer cv_id to the SQL query
//
//        // Execute the delete statement
//        statement.executeUpdate(); // This performs the delete operation
//
//    } catch (NumberFormatException e) {
//        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Invalid CV ID format: " + cv_id, e);
//    } catch (Exception ex) {
//        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//    }
//    
//    // No return value needed, as the method is void
//}
    public static void main(String[] args) {
         CvDAO CvDAO = new CvDAO();
        
        List<CV_Skill> s = CvDAO.getCV_SkillsByID("2");
       
//         for (CV_Skill user : s) {
//             System.out.println(user);
//         }
        CV c =CvDAO.getCVByCVId("2");
        System.out.println(c);
        int cvId = 1; // Giả sử bạn có CV với id là 1
        int educationId = 2; // Giả sử bạn có education với id là 2
        String startDate = "2020-09-01"; // Ngày bắt đầu học, định dạng chuỗi yyyy-MM-dd
        String endDate = "2024-06-01"; // Ngày kết thúc học, định dạng chuỗi yyyy-MM-dd
        String fieldOfStudy = "Computer Science"; // Chuyên ngành học
        String degree = "Bachelor's"; // Bằng cấp đạt được

        // Gọi phương thức insertCVEducation và kiểm tra kết quả
      //  boolean success = CvDAO.insertCVEducation(cvId, educationId, startDate, endDate, fieldOfStudy, degree);

        // In kết quả ra màn hình
      
    }
        
    
}
