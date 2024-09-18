/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class CV {
    private int cvId;
    private int educationId;
    private Date createDate;
    private String titile;
    private String summary;

    public CV() {
    }
    
    

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public int getEducationId() {
        return educationId;
    }

    public void setEducationId(int educationId) {
        this.educationId = educationId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getTitile() {
        return titile;
    }

    public void setTitile(String titile) {
        this.titile = titile;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
    
    
}
