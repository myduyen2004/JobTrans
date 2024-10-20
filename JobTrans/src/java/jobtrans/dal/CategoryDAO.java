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
import jobtrans.model.Category;
import jobtrans.utils.DBConnection;

/**
 *
 * @author admin
 */
public class CategoryDAO {

    private final DBConnection dbConnection;

    public CategoryDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> cateList = new ArrayList<>();
        DBConnection db = DBConnection.getInstance();
        String sql = "SELECT * FROM JobCategory";

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int categoryId = rs.getInt(1);
                String categoryName = rs.getNString(2);
                String description = rs.getNString(3);

                Category cate = new Category(categoryId, categoryName, description);
                cateList.add(cate);
            }

            rs.close();
            statement.close();
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cateList;
    }

    public Category getJobCategoryById(int categoryId) {
        Category cat = null;
        String sql = "SELECT * FROM JobCategory WHERE category_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, categoryId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                String categoryName = rs.getNString(2);
                String description = rs.getNString(3);
                cat = new Category(categoryId, categoryName, description);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cat;
    }
    public Category getCateByName(String name) {
        String sql = "SELECT * FROM JobCategory WHERE category_name = ?";

        Category cate = null;

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setNString(1, name);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int categoryId = rs.getInt(1);
                String categoryName = rs.getNString(2);
                String description = rs.getNString(3);

                cate = new Category(categoryId, categoryName, description);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cate;
    }
    public Category getCateById(int id) {
        String sql = "SELECT * FROM JobCategory WHERE category_id = ?";

        Category cate = null;

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int categoryId = rs.getInt(1);
                String categoryName = rs.getNString(2);
                String description = rs.getNString(3);

                cate = new Category(categoryId, categoryName, description);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cate;
    }

}
