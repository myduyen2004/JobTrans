/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.util.Date;

/**
 *
 * @author mac
 */
public class JobInFor {
    private int userId;
    private int jobId;
    private String avatarUrl;
    private String userName;
    private String address;
    private String jobTitle;
    private int budget;
    private Date dueDate;
    private int categoryId;

    public JobInFor(int userId, int jobId, String avatarUrl, String userName, String address, String jobTitle, int budget, Date dueDate, int categoryId) {
        this.userId = userId;
        this.jobId = jobId;
        this.avatarUrl = avatarUrl;
        this.userName = userName;
        this.address = address;
        this.jobTitle = jobTitle;
        this.budget = budget;
        this.dueDate = dueDate;
        this.categoryId = categoryId;
    }

    public JobInFor() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public int getBudget() {
        return budget;
    }

    public void setBudget(int budget) {
        this.budget = budget;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "JobInFor{" + "userId=" + userId + ", jobId=" + jobId + ", avatarUrl=" + avatarUrl + ", userName=" + userName + ", address=" + address + ", jobTitle=" + jobTitle + ", budget=" + budget + ", dueDate=" + dueDate + ", categoryId=" + categoryId + '}';
    }
}