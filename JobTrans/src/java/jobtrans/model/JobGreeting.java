/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

/**
 *
 * @author admin
 */
public class JobGreeting {
    private int greetingId;
    private int jobSeekerId;
    private int jobId;
    private String introduction;
    private String attachment;
    private int price;
    private String status;
    private int expectedDay;
    private int cvId;

    public JobGreeting() {
    }
    public JobGreeting(int jobSeekerId, int jobId, String introduction, String attachment, int price, String status, int expectedDay, int cvId) {
        this.jobSeekerId = jobSeekerId;
        this.jobId = jobId;
        this.introduction = introduction;
        this.attachment = attachment;
        this.price = price;
        this.status = status;
        this.expectedDay = expectedDay;
        this.cvId = cvId;
    }
    // Getters and Setters
    public int getGreetingId() {
        return greetingId;
    }

    
    

    public void setGreetingId(int greetingId) {
        this.greetingId = greetingId;
    }

    public int getJobSeekerId() {
        return jobSeekerId;
    }

    public void setJobSeekerId(int jobSeekerId) {
        this.jobSeekerId = jobSeekerId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getExpectedDay() {
        return expectedDay;
    }

    public void setExpectedDay(int expectedDay) {
        this.expectedDay = expectedDay;
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    @Override
    public String toString() {
        return "JobGreeting{" + "greetingId=" + greetingId + ", jobSeekerId=" + jobSeekerId + ", jobId=" + jobId + ", introduction=" + introduction + ", attachment=" + attachment + ", price=" + price + ", status=" + status + ", expectedDay=" + expectedDay + ", cvId=" + cvId + '}';
    }
    
    public int calcDepositFee(){
        int depositFee = (int) (price * 0.1);
        return depositFee;
    }
    
}

