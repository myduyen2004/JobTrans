/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.util.ArrayList;
import jobtrans.dal.JobDAO;

/**
 *
 * @author admin
 */
public class JobCategory {
    private int categoryId;        // category_id
    private String categoryName;   // category_name
    private String description;     // description

    // Constructor
    public JobCategory() {
    }

<<<<<<< HEAD:JobTrans/src/java/jobtrans/model/JobCategory.java
    public JobCategory(int categoryId, String categoryName, String description) {
=======
    public Category(int categoryId, String categoryName, String description) {
>>>>>>> 72ac6630f53865b5681c0ae8befb6375603639c1:JobTrans/src/java/jobtrans/model/Category.java
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.description = description;
    }
<<<<<<< HEAD:JobTrans/src/java/jobtrans/model/JobCategory.java

    // Getters and Setters
=======
    
>>>>>>> 72ac6630f53865b5681c0ae8befb6375603639c1:JobTrans/src/java/jobtrans/model/Category.java
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
<<<<<<< HEAD:JobTrans/src/java/jobtrans/model/JobCategory.java

    // toString() method for easy display
    @Override
    public String toString() {
        return "Category{" +
                "categoryId=" + categoryId +
                ", categoryName='" + categoryName + '\'' +
                ", description='" + description + '\'' +
                '}';
=======
    
    public String getCategoryNameById(int id){
        JobDAO jdao = new JobDAO();
        Category cate = jdao.getCateById(id);
        
        return cate.getCategoryName();
    }
    
    public ArrayList<String> getCategoryName(ArrayList<Category> cateList){
        ArrayList<String> nameList = new ArrayList<>();
        for(Category cate : cateList){
            String name = cate.getCategoryName();
            nameList.add(name);
        }
        return nameList;
>>>>>>> 72ac6630f53865b5681c0ae8befb6375603639c1:JobTrans/src/java/jobtrans/model/Category.java
    }
}

