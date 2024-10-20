/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;


/**
 *
 * @author admin
 */
import java.util.Date;

public class Job {
    private int jobId;
    private int userId;
    private String jobTitle;
    private int budget;
    private String description;
    private Date dueDate;
    private String status;
    private int categoryId;
    private String employerFeedback;
    private String seekerFeedback;
    private int secureWallet;
    private String docUrl;
    private String interviewUrl;
    private Date interviewDate;
    private String address;
    private String labelVerify;

    
    // Getter và Setter
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

    public int getBudget() {
        return budget;
    }

    public void setBudget(int budget) {
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

    public String getEmployerFeedback() {
        return employerFeedback;
    }

    public void setEmployerFeedback(String employerFeedback) {
        this.employerFeedback = employerFeedback;
    }

    public String getSeekerFeedback() {
        return seekerFeedback;
    }

    public void setSeekerFeedback(String seekerFeedback) {
        this.seekerFeedback = seekerFeedback;
    }

    public int getSecureWallet() {
        return secureWallet;
    }

    public void setSecureWallet(int secureWallet) {
        this.secureWallet = secureWallet;
    }

    public String getDocUrl() {
        return docUrl;
    }

    public void setDocUrl(String docUrl) {
        this.docUrl = docUrl;
    }

    public String getInterviewUrl() {
        return interviewUrl;
    }

    public void setInterviewUrl(String interviewUrl) {
        this.interviewUrl = interviewUrl;
    }

    public Date getInterviewDate() {
        return interviewDate;
    }

    public void setInterviewDate(Date interviewDate) {
        this.interviewDate = interviewDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLabelVerify() {
        return labelVerify;
    }

    public void setLabelVerify(String labelVerify) {
        this.labelVerify = labelVerify;
    }
    

    @Override
    public String toString() {
        return "Job{" + "jobId=" + jobId + ", userId=" + userId + ", jobTitle=" + jobTitle + ", budget=" + budget + ", description=" + description + ", dueDate=" + dueDate + ", status=" + status + ", categoryId=" + categoryId + ", employerFeedback=" + employerFeedback + ", seekerFeedback=" + seekerFeedback + ", secureWallet=" + secureWallet + ", docUrl=" + docUrl + ", interviewUrl=" + interviewUrl + ", interviewDate=" + interviewDate + ", address=" + address + '}';
    }
    
    public int calcPrepayFee(JobGreeting jobGreeting){
        int prepayFee = jobGreeting.getPrice();
        return prepayFee;
    }
    public int calcSecureWallet(JobGreeting jobGreeting){
        int totalSecureWallet = (int) (jobGreeting.getPrice()*0.1+jobGreeting.getPrice());
        return totalSecureWallet;
    }
    
}
