/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.util.Date;

public class CV{
    private int cvId;
    private String title;
    private String summary;
    private Date createdAt;
    private int userId;

    public CV() {
    }

    public CV(int cvId, String title, String summary, Date createdAt, int userId) {
        this.cvId = cvId;
        this.title = title;
        this.summary = summary;
        this.createdAt = createdAt;
        this.userId = userId;
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "CV{" + "cvId=" + cvId + ", title=" + title + ", summary=" + summary + ", createdAt=" + createdAt + ", userId=" + userId + '}';
    }
    
}