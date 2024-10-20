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
import jobtrans.model.CV;
import jobtrans.model.Certification;
import jobtrans.model.Education;
import jobtrans.model.Experience;
import jobtrans.model.Skill;
import jobtrans.utils.DBConnection;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class CVDAO {

    private final DBConnection dbConnection;

    public CVDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public ArrayList<CV> getCVByUserId(int userId) {
        ArrayList<CV> cvList = new ArrayList<>();
        String sql = "SELECT * FROM CV WHERE user_id = ?";

        try (PreparedStatement statement = dbConnection.openConnection().prepareStatement(sql)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int cvId = resultSet.getInt("cv_id");
                String title = resultSet.getString("job_position");
                String summary = resultSet.getString("summary");
                Date createdAt = resultSet.getDate("created_at");

                CV cv = new CV(cvId, title, summary, createdAt, userId);
                cv.setListEdu(getEducationByCVId(cvId));
                cv.setListCertification(getListCertificationByCvId(cvId));
                cv.setListExperience(getListExperienceByCvId(cvId));
                cv.setListSkill(getListSkillByCvId(cvId));

                cvList.add(cv);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cvList;
    }
    
    // education, school
    public CV getCvById(int cvId) throws Exception {
        CV cv = null;
        String query = "SELECT [cv_id], [job_position], [summary], [created_at], [user_id] "
                     + "FROM [JOBTRANS].[dbo].[CV] WHERE [cv_id] = ?";

        try (PreparedStatement preparedStatement = dbConnection.openConnection().prepareStatement(query)) {
            preparedStatement.setInt(1, cvId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                cv = new CV();
                cv.setCvId(resultSet.getInt("cv_id"));
                cv.setTitle(resultSet.getString("job_position"));
                cv.setSummary(resultSet.getString("summary"));
                cv.setCreatedAt(resultSet.getTimestamp("created_at"));
                cv.setUserId(resultSet.getInt("user_id"));
                cv.setListExperience(getListExperienceByCvId(cvId));
                cv.setListCertification(getListCertificationByCvId(cvId));
                cv.setListSkill(getListSkillByCvId(cvId));
                cv.setListEdu(getEducationByCVId(cvId));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi
        }

        return cv;
    }

    public ArrayList<Education> getEducationByCVId(int cvId) {
        ArrayList<Education> educationList = new ArrayList<>();
        String sql = "SELECT * FROM CV_Education WHERE cv_id = ?";

        try (PreparedStatement statement = dbConnection.openConnection().prepareStatement(sql)) {
            statement.setInt(1, cvId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int educationId = resultSet.getInt("education_id");
                Date startDate = resultSet.getDate("start_date");
                Date endDate = resultSet.getDate("end_date");
                String fieldOfStudy = resultSet.getNString("field_of_study");
                String degree = resultSet.getNString("degree");
                String schoolCustom = resultSet.getNString("school_custom");
                Education edu = new Education(cvId, educationId, fieldOfStudy, startDate, endDate, degree, schoolCustom);
                edu.setSchoolName(getSchoolNameById(educationId));
                educationList.add(edu);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return educationList;
    }
    
    public String getSchoolNameById(int educationId) throws Exception {
        String schoolName = null;
        String sql = "SELECT school_name FROM School WHERE education_id = ?";

        try (Connection conn = dbConnection.openConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, educationId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                schoolName = rs.getString("school_name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schoolName;
    }
    
    public List<String> getAllSchoolNames() throws Exception {
    List<String> schoolNames = new ArrayList<>();
    String sql = "SELECT school_name FROM School"; // Câu lệnh SQL để lấy tất cả tên trường học

    try (Connection conn = dbConnection.openConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        while (rs.next()) {
            String schoolName = rs.getString("school_name");
            schoolNames.add(schoolName); // Thêm tên trường học vào danh sách
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Xử lý lỗi
    }
    return schoolNames; // Trả về danh sách tên trường học
}
    
    // company
    
    public ArrayList<Experience> getListExperienceByCvId(int cvId) {
        ArrayList<Experience> experiences = new ArrayList<>();
        String sql = "SELECT [cv_id], [experience_id], [job_position], [address], [description], [start_at], [end_at], [company_custom] "
                + "FROM [CV_Experience] WHERE cv_id = ?";

        try (PreparedStatement statement = dbConnection.openConnection().prepareStatement(sql)) {
            statement.setInt(1, cvId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int experienceId = resultSet.getInt("experience_id");
                String jobPosition = resultSet.getString("job_position");
                String address = resultSet.getString("address");
                String description = resultSet.getString("description");
                Date startAt = resultSet.getDate("start_at");
                Date endAt = resultSet.getDate("end_at");
                String companyCustom = resultSet.getString("company_custom");

                Experience experience = new Experience(cvId, experienceId, jobPosition, address, description, startAt, endAt, companyCustom);
                experience.setExperienceName(getCompanyNameById(experienceId));
                experiences.add(experience);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return experiences;
    }
    
    public String getCompanyNameById(int experienceId) throws Exception {
        String companyName = null;
        String sql = "SELECT company_name FROM Company WHERE experience_id = ?";

        try (Connection conn = dbConnection.openConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, experienceId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                companyName = rs.getString("company_name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return companyName;
    }
    
    public List<String> getAllCompanyNames() throws Exception {
    List<String> companyNames = new ArrayList<>();
    String sql = "SELECT company_name FROM Company"; // Câu lệnh SQL để lấy tất cả tên công ty

    try (Connection conn = dbConnection.openConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        while (rs.next()) {
            String companyName = rs.getString("company_name");
            companyNames.add(companyName); // Thêm tên công ty vào danh sách
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Xử lý lỗi
    }
    return companyNames; // Trả về danh sách tên công ty
}
    
    //certification
    
    public ArrayList<Certification> getListCertificationByCvId(int cvId) {
        ArrayList<Certification> certifications = new ArrayList<>();
        String sql = "SELECT [cv_id], [certification_id], [year], [description], [certification_custom] "
                + "FROM [CV_Certification] WHERE cv_id = ?";

        try (PreparedStatement statement = dbConnection.openConnection().prepareStatement(sql)) {
            statement.setInt(1, cvId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int certificationId = resultSet.getInt("certification_id");
                Date year = resultSet.getDate("year");
                String description = resultSet.getString("description");
                String certificationCustom = resultSet.getString("certification_custom");

                Certification certification = new Certification(cvId, certificationId, year, description, certificationCustom);
                certification.setCertificationName(getCertificationNameById(certificationId));
                certifications.add(certification);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return certifications;
    }
    
    public String getCertificationNameById(int certificationId) throws Exception {
        String certificationName = null;
        String sql = "SELECT certification_name FROM Certification WHERE certification_id = ?";

        try (Connection conn = dbConnection.openConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, certificationId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                certificationName = rs.getString("certification_name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return certificationName;
    }
    
    public List<String> getAllCertificationNames() throws Exception {
    List<String> certificationNames = new ArrayList<>();
    String sql = "SELECT certification_name FROM Certification"; // Câu lệnh SQL để lấy tất cả tên chứng chỉ

    try (Connection conn = dbConnection.openConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        while (rs.next()) {
            String certificationName = rs.getString("certification_name");
            certificationNames.add(certificationName); // Thêm tên chứng chỉ vào danh sách
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Xử lý lỗi
    }
    return certificationNames; // Trả về danh sách tên chứng chỉ
}
    
    //skill
    
    public ArrayList<Skill> getListSkillByCvId(int cvId) {
        ArrayList<Skill> skills = new ArrayList<>();
        String sql = "SELECT [cv_id], [skill_id], [skill_custom] FROM [CV_Skill] WHERE cv_id = ?";

        try (PreparedStatement statement = dbConnection.openConnection().prepareStatement(sql)) {
            statement.setInt(1, cvId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int skillId = resultSet.getInt("skill_id");
                String skillCustom = resultSet.getString("skill_custom");

                Skill skill = new Skill(cvId, skillId, skillCustom);
                skill.setSkillName(getSkillNameById(skillId));
                skills.add(skill);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return skills;
    }

    public String getSkillNameById(int skillId) throws Exception {
        String skillName = null;
        String sql = "SELECT skill_name FROM Skill WHERE skill_id = ?";

        try (Connection conn = dbConnection.openConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, skillId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                skillName = rs.getString("skill_name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return skillName;
    }
    
    public List<String> getAllSkillNames() throws Exception {
    List<String> skillNames = new ArrayList<>();
    String sql = "SELECT skill_name FROM Skill"; 

    try (Connection conn = dbConnection.openConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        while (rs.next()) {
            String skillName = rs.getString("skill_name");
            skillNames.add(skillName); // Thêm tên kỹ năng vào danh sách
        }
    } catch (Exception e) {
        e.printStackTrace(); // Xử lý lỗi
    }
    return skillNames; // Trả về danh sách tên kỹ năng
}

    //delete CV
    public boolean deleteCvByCvId(int cvId) throws SQLException, Exception {
    Connection conn = null;
    PreparedStatement stmt = null;
    
    try {
        conn = dbConnection.openConnection();
        conn.setAutoCommit(false);  // Bắt đầu transaction

        if (getListSkillByCvId(cvId) != null) {
            deleteSkillByCvId(cvId);
        }
        
        if (getListExperienceByCvId(cvId) != null) {
            deleteExperienceByCvId(cvId);
        }
        
        if (getEducationByCVId(cvId) != null) {
            deleteEducationByCvId(cvId);
        }

        if (getListCertificationByCvId(cvId) != null) {
            deleteCertificationByCvId(cvId);
        }

        String queryDeleteCv = "DELETE FROM CV WHERE cv_id = ?";
        stmt = conn.prepareStatement(queryDeleteCv);
        stmt.setInt(1, cvId);
        int rowsAffected = stmt.executeUpdate();
        
        if (rowsAffected > 0) {
            conn.commit();  
            return true;
        } else {
            conn.rollback(); 
            return false;
        }

    } catch (SQLException e) {
        if (conn != null) {
            try {
                conn.rollback();  // Rollback trong trường hợp có lỗi
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        e.printStackTrace();
        return false;
    } 
}

    public boolean deleteSkillByCvId(int cvId) throws Exception {
    String query = "DELETE FROM CV_Skill WHERE cv_id = ?"; // Câu truy vấn SQL

    try (Connection conn = dbConnection.openConnection(); 
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setInt(1, cvId); // Đặt giá trị cvId cho tham số `?` trong query

        int rowsAffected = stmt.executeUpdate(); // Thực thi câu lệnh DELETE
        return rowsAffected > 0; // Trả về true nếu xóa thành công

    } catch (SQLException e) {
        e.printStackTrace();
        return false; // Trả về false nếu có lỗi
    }
}
   
    public boolean deleteExperienceByCvId(int cvId) throws Exception {
    String query = "DELETE FROM CV_Experience WHERE cv_id = ?"; // Câu truy vấn SQL

    try (Connection conn = dbConnection.openConnection(); 
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setInt(1, cvId); // Đặt giá trị cvId cho tham số `?`

        int rowsAffected = stmt.executeUpdate(); 
        return rowsAffected > 0; 

    } catch (SQLException e) {
        e.printStackTrace();
        return false; 
    }
}
   
    public boolean deleteEducationByCvId(int cvId) throws Exception {
    String query = "DELETE FROM CV_Education WHERE cv_id = ?"; // Câu truy vấn SQL

    try (Connection conn = dbConnection.openConnection(); 
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setInt(1, cvId); 

        int rowsAffected = stmt.executeUpdate(); 
        return rowsAffected > 0; 

    } catch (SQLException e) {
        e.printStackTrace();
        return false; 
    }
}
   
    public boolean deleteCertificationByCvId(int cvId) throws Exception {
    String query = "DELETE FROM CV_Certification WHERE cv_id = ?"; // Câu truy vấn SQL

    try (Connection conn = dbConnection.openConnection(); 
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setInt(1, cvId); 

        int rowsAffected = stmt.executeUpdate(); 
        return rowsAffected > 0; 

    } catch (SQLException e) {
        e.printStackTrace();
        return false; 
    }
}
    
    //add CV
    
    public int addCV(CV cv) throws SQLException, Exception {
    String queryAddCV = "INSERT INTO CV (job_position, summary, created_at, user_id) OUTPUT INSERTED.cv_id VALUES (?, ?, ?, ?)";
    PreparedStatement stmt = null;
    int cvId = 0;

    try {
        Connection conn = dbConnection.openConnection();
        stmt = conn.prepareStatement(queryAddCV);
        stmt.setNString(1, cv.getTitle());
        stmt.setNString(2, cv.getSummary());
        stmt.setDate(3, new java.sql.Date(cv.getCreatedAt().getTime()));
        stmt.setInt(4, cv.getUserId());
        
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            cvId = rs.getInt(1);
        }
        if (cvId > 0) {
            addSkillsForCV(cvId, cv.getListSkill(), conn);
            addExperiencesForCV(cvId, cv.getListExperience(), conn);
            addEducationsForCV(cvId, cv.getListEdu(), conn);
            addCertificationsForCV(cvId, cv.getListCertification(), conn);
        }
        
    } finally {
        if (stmt != null) {
            stmt.close();
        }
    }

    return cvId; 
}

    public void addSkillsForCV(int cvId, List<Skill> skills, Connection conn) throws SQLException {
    String queryAddSkill = "INSERT INTO CV_Skill (cv_id, skill_id, skill_custom) VALUES (?, ?, ?)";
    PreparedStatement stmt = null;

    try {
        stmt = conn.prepareStatement(queryAddSkill);
        for (Skill skill : skills) {
            stmt.setInt(1, cvId);
            stmt.setInt(2, skill.getSkillId());  // ID của skill
            stmt.setNString(3, skill.getSkillCustom());  // Nếu skill có thể tùy chỉnh, lưu ở skill_custom
            stmt.executeUpdate();
        }
    } finally {
        if (stmt != null) {
            stmt.close();
        }
    }
}
    
    public void addExperiencesForCV(int cvId, List<Experience> experiences, Connection conn) throws SQLException {
    String queryAddExperience = "INSERT INTO CV_Experience (cv_id, experience_id, job_position, address, description, start_at, end_at, company_custom) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement stmt = null;

    try {
        stmt = conn.prepareStatement(queryAddExperience);
        for (Experience experience : experiences) {
            stmt.setInt(1, cvId);
            stmt.setInt(2, experience.getExperienceId());  // ID của company
            stmt.setNString(3, experience.getJobPosition());
            stmt.setNString(4, experience.getAddress());
            stmt.setNString(5, experience.getDescription());
            stmt.setDate(6, new java.sql.Date (experience.getStartAt().getTime()));
            stmt.setDate(7, new java.sql.Date (experience.getEndAt().getTime()));
            stmt.setNString(8, experience.getCompanyCustom());  // company_custom
            stmt.executeUpdate();
        }
    } finally {
        if (stmt != null) {
            stmt.close();
        }
    }
}
    
    public void addEducationsForCV(int cvId, List<Education> educations, Connection conn) throws SQLException {
    String queryAddEducation = "INSERT INTO CV_Education (cv_id, education_id, start_date, end_date, field_of_study, degree, school_custom) VALUES (?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement stmt = null;

    try {
        stmt = conn.prepareStatement(queryAddEducation);
        for (Education education : educations) {
            stmt.setInt(1, cvId);
            stmt.setInt(2, education.getEducationId());  // ID của school
            stmt.setDate(3, new java.sql.Date(education.getStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(education.getEndDate().getTime()));
            stmt.setNString(5, education.getFieldOfStudy());
            stmt.setNString(6, education.getDegree());
            stmt.setNString(7, education.getSchoolName());  // school_custom
            stmt.executeUpdate();
        }
    } finally {
        if (stmt != null) {
            stmt.close();
        }
    }
}
    
    public void addCertificationsForCV(int cvId, List<Certification> certifications, Connection conn) throws SQLException {
    String queryAddCertification = "INSERT INTO CV_Certification (cv_id, certification_id, year, description, certification_custom) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement stmt = null;

    try {
        stmt = conn.prepareStatement(queryAddCertification);
        for (Certification certification : certifications) {
            stmt.setInt(1, cvId);
            stmt.setInt(2, certification.getCertificationId());  // ID của certification
            stmt.setDate(3, new java.sql.Date(certification.getYear().getTime()));
            stmt.setNString(4, certification.getDescription());
            stmt.setNString(5, certification.getCertificationName());  // certification_custom
            stmt.executeUpdate();
        }
    } finally {
        if (stmt != null) {
            stmt.close();
        }
    }
}

    //updateCV
    
    public void updateCV(CV cv) throws Exception {
    String query = "UPDATE CV SET job_position = ?, summary = ?, created_at = ? WHERE cv_id = ?";
    PreparedStatement stmt = null;

    try {
        stmt = dbConnection.openConnection().prepareStatement(query);
        stmt.setNString(1, cv.getTitle());
        stmt.setNString(2, cv.getSummary());
        stmt.setDate(3, new java.sql.Date(cv.getCreatedAt().getTime()));
        stmt.setInt(4, cv.getCvId());
        stmt.executeUpdate();
        
        updateSkillsForCV(cv.getCvId(), cv.getListSkill());
        updateExperienceForCV(cv.getCvId(), cv.getListExperience());
        updateEducationForCV(cv.getCvId(), cv.getListEdu());
        updateCertificationsForCV(cv.getCvId(), cv.getListCertification());
    } finally {
        if (stmt != null) {
            stmt.close();
        }
    }
}
    
    public void updateSkillsForCV(int cvId, List<Skill> skills) throws Exception {
    String deleteQuery = "DELETE FROM CV_Skill WHERE cv_id = ?";
    String insertQuery = "INSERT INTO CV_Skill (cv_id, skill_id, skill_custom) VALUES (?, ?, ?)";
    PreparedStatement stmt = null;

    try {
        // Xóa tất cả skill cũ
        stmt = dbConnection.openConnection().prepareStatement(deleteQuery);
        stmt.setInt(1, cvId);
        stmt.executeUpdate();

        // Thêm các skill mới
        stmt = dbConnection.openConnection().prepareStatement(insertQuery);
        for (Skill skill : skills) {
            stmt.setInt(1, cvId);
            stmt.setInt(2, skill.getSkillId());  // Cập nhật skill_id mới
            stmt.setNString(3, skill.getSkillName());  // Cập nhật skill_custom mới
            stmt.executeUpdate();
        }
    } finally {
        if (stmt != null) {
            stmt.close();
        }
    }
}
    
    public void updateExperienceForCV(int cvId, List<Experience> experiences) throws Exception {
    String deleteQuery = "DELETE FROM CV_Experience WHERE cv_id = ?";
    String insertQuery = "INSERT INTO CV_Experience (cv_id, experience_id, job_position, address, description, start_at, end_at, company_custom) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement stmt = null;

    try {
        // Xóa tất cả experience cũ
        stmt = dbConnection.openConnection().prepareStatement(deleteQuery);
        stmt.setInt(1, cvId);
        stmt.executeUpdate();

        // Thêm các experience mới
        stmt = dbConnection.openConnection().prepareStatement(insertQuery);
        for (Experience experience : experiences) {
            stmt.setInt(1, cvId);
            stmt.setInt(2, experience.getExperienceId());  // Cập nhật experience_id mới
            stmt.setNString(3, experience.getJobPosition());
            stmt.setNString(4, experience.getAddress());
            stmt.setNString(5, experience.getDescription());
            stmt.setDate(6, new java.sql.Date(experience.getStartAt().getTime()));
            stmt.setDate(7, new java.sql.Date(experience.getEndAt().getTime()));
            stmt.setNString(8, experience.getCompanyCustom());
            stmt.executeUpdate();
        }
    } finally {
        if (stmt != null) {
            stmt.close();
        }
    }
}
    
    public void updateEducationForCV(int cvId, List<Education> educations) throws Exception {
    String deleteQuery = "DELETE FROM CV_Education WHERE cv_id = ?";
    String insertQuery = "INSERT INTO CV_Education (cv_id, education_id, start_date, end_date, field_of_study, degree, school_custom) VALUES (?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement stmt = null;

    try {
        // Xóa tất cả education cũ
        stmt = dbConnection.openConnection().prepareStatement(deleteQuery);
        stmt.setInt(1, cvId);
        stmt.executeUpdate();

        // Thêm các education mới
        stmt = dbConnection.openConnection().prepareStatement(insertQuery);
        for (Education education : educations) {
            stmt.setInt(1, cvId);
            stmt.setInt(2, education.getEducationId());  // Cập nhật education_id mới
            stmt.setDate(3, new java.sql.Date(education.getStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(education.getEndDate().getTime()));
            stmt.setNString(5, education.getFieldOfStudy());
            stmt.setNString(6, education.getDegree());
            stmt.setNString(7, education.getSchoolCustom());
            stmt.executeUpdate();
        }
    } finally {
        if (stmt != null) {
            stmt.close();
        }
    }
}
    
    public void updateCertificationsForCV(int cvId, List<Certification> certifications) throws Exception {
    String deleteQuery = "DELETE FROM CV_Certification WHERE cv_id = ?";
    String insertQuery = "INSERT INTO CV_Certification (cv_id, certification_id, year, description, certification_custom) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement stmt = null;

    try {
        stmt = dbConnection.openConnection().prepareStatement(deleteQuery);
        stmt.setInt(1, cvId);
        stmt.executeUpdate();

        stmt = dbConnection.openConnection().prepareStatement(insertQuery);
        for (Certification certification : certifications) {
            stmt.setInt(1, cvId);
            stmt.setInt(2, certification.getCertificationId());  // Cập nhật certification_id mới
            stmt.setDate(3, new java.sql.Date(certification.getYear().getTime()));
            stmt.setNString(4, certification.getDescription());
            stmt.setNString(5, certification.getCertificationCustom());
            stmt.executeUpdate();
        }
    } finally {
        if (stmt != null) {
            stmt.close();
        }
    }
}
    
    public Integer getSchoolIdByName(String schoolName) throws Exception {
        String sql = "SELECT education_id FROM [JOBTRANS].[dbo].[School] WHERE school_name = ?";
        Integer id = null;

        try (PreparedStatement preparedStatement = dbConnection.openConnection().prepareStatement(sql)) {
            preparedStatement.setString(1, schoolName);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("education_id"); // Lấy ID từ cột education_id
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi
        }

        return id;
    }

    // Hàm lấy ID của kỹ năng theo tên
    public Integer getSkillIdByName(String skillName) throws Exception {
        String sql = "SELECT skill_id FROM [JOBTRANS].[dbo].[Skill] WHERE skill_name = ?";
        Integer id = null;

        try (PreparedStatement preparedStatement = dbConnection.openConnection().prepareStatement(sql)) {
            preparedStatement.setString(1, skillName);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("skill_id"); // Lấy ID từ cột skill_id
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi
        }

        return id;
    }

    // Hàm lấy ID của chứng chỉ theo tên
    public Integer getCertificationIdByName(String certificationName) throws Exception {
        String sql = "SELECT certification_id FROM [JOBTRANS].[dbo].[Certification] WHERE certification_name = ?";
        Integer id = null;

        try (PreparedStatement preparedStatement = dbConnection.openConnection().prepareStatement(sql)) {
            preparedStatement.setString(1, certificationName);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("certification_id"); // Lấy ID từ cột certification_id
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi
        }

        return id;
    }

    // Hàm lấy ID của công ty theo tên
    public Integer getCompanyIdByName(String companyName) throws Exception {
        String sql = "SELECT experience_id FROM [JOBTRANS].[dbo].[Company] WHERE company_name = ?";
        Integer id = null;

        try (PreparedStatement preparedStatement = dbConnection.openConnection().prepareStatement(sql)) {
            preparedStatement.setString(1, companyName);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("experience_id"); // Lấy ID từ cột experience_id
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi
        }

        return id;
    }
     public int getCvIdByTitleAndUserId(String jobPosition, int userId) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int cvId = -1; 

        String sql = "SELECT [cv_id] FROM [CV] WHERE [job_position] = ? AND [user_id] = ?";

        try {
            conn = dbConnection.openConnection();  // Kết nối tới database
            ps = conn.prepareStatement(sql);
            ps.setString(1, jobPosition); // Set giá trị job_position
            ps.setInt(2, userId);         // Set giá trị user_id

            rs = ps.executeQuery();

            if (rs.next()) {
                cvId = rs.getInt("cv_id"); // Lấy cv_id từ kết quả truy vấn
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cvId; // Trả về cv_id, -1 nếu không tìm thấy
    }
    
    public static void main(String[] args) throws Exception {
        CVDAO dao = new CVDAO();
        System.out.println(dao.getCertificationIdByName("Chứng chỉ Quản lý rủi ro"));
    }
}
