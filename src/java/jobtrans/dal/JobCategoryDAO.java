package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.model.JobCategory;
import jobtrans.utils.DBConnection;

/**
 *
 * @author admin
 */
public class JobCategoryDAO {

    private final DBConnection dbConnection;

    public JobCategoryDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public List<JobCategory> getAllCategory() {
        List<JobCategory> categories = new ArrayList<>();
        String query = "SELECT * FROM JobCategory";
        
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                JobCategory category = new JobCategory();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
                category.setDescription(rs.getString("description"));
                categories.add(category);
            }
        } catch (Exception e) {
            Logger.getLogger(JobCategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return categories;
    }

    public JobCategory getJobCategoryByName(String categoryName) {
        JobCategory category = null;
        String query = "SELECT * FROM JobCategory WHERE category_name = ?";
        
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, categoryName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                category = new JobCategory();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
                category.setDescription(rs.getString("description"));
            }
        } catch (Exception e) {
            Logger.getLogger(JobCategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return category;
    }
    
    public JobCategory getCategoryById(int categoryId) {
        JobCategory category = null;
        String query = "SELECT * FROM JobCategory WHERE category_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryId); // Set giá trị cho tham số category_id
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("category_id");
                    String name = rs.getString("category_name");
                    String description = rs.getString("description");
                    category = new JobCategory(id, name, description);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }
    
    public static void main(String[] args) {
        JobCategoryDAO dao = new JobCategoryDAO();
        System.out.println(dao.getAllCategory());
    }
}
