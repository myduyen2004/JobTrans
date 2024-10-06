/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author admin
 */
public class Job {
    private int jobId;
    private int userId;
    private String jobTitle;
    private float budget;
    private String description;
    private Date dueDate;
    private String status;
    private int categoryId;
    private String empFeedback;
    private String seekerFeedback;
    private double secureWallet;
    
    public Job() {
    }

    public Job(int jobId, int userId, String jobTitle, float budget, String description, Date dueDate, String status, int categoryId, String empFeedback, String seekerFeedback, double secureWallet) {
        this.jobId = jobId;
        this.userId = userId;
        this.jobTitle = jobTitle;
        this.budget = budget;
        this.description = description;
        this.dueDate = dueDate;
        this.status = status;
        this.categoryId = categoryId;
        this.empFeedback = empFeedback;
        this.seekerFeedback = seekerFeedback;
        this.secureWallet = secureWallet;
    }

    
    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public float getBudget() {
        return budget;
    }

    public void setBudget(float budget) {
        this.budget = budget;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getEmpFeedback() {
        return empFeedback;
    }

    public void setEmpFeedback(String empFeedback) {
        this.empFeedback = empFeedback;
    }

    public String getSeekerFeedback() {
        return seekerFeedback;
    }

    public void setSeekerFeedback(String seekerFeedback) {
        this.seekerFeedback = seekerFeedback;
    }

    public double getSecureWallet() {
        return secureWallet;
    }

    public void setSecureWallet(double secureWallet) {
        this.secureWallet = secureWallet;
    }

    @Override
    public String toString() {
        return "Job{" + "jobId=" + jobId + ", userId=" + userId + ", jobTitle=" + jobTitle + ", budget=" + budget + ", description=" + description + ", dueDate=" + dueDate + ", status=" + status + ", categoryId=" + categoryId + ", empFeedback=" + empFeedback + ", seekerFeedback=" + seekerFeedback + ", secureWallet=" + secureWallet + '}';
    }
    
    public double calcTotalDeposit(double price, ArrayList<JobGreetings> list){
        double totalDeposit = 0;
        totalDeposit = price + (0.1 * price)*list.size();
        return totalDeposit;
    }
    
    public double getDepositEmployer(double price){
        double depositEmployer = 0;
        depositEmployer = price;
        return depositEmployer;
    }
}
