/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class JobGreetings {
    private int greetingId;
    private int jobSeekerId;
    private int jobId;
    private String introduction;
    private String attachment;
    private double price;
    private String status;
private int expectedDay;
    // Constructors
    public JobGreetings() {
    }

    public JobGreetings(int jobSeekerId, int jobId, String introduction, String attachment, double price, String status, int expectedDay) {
        this.jobSeekerId = jobSeekerId;
        this.jobId = jobId;
        this.introduction = introduction;
        this.attachment = attachment;
        this.price = price;
        this.status = status;
        this.expectedDay = expectedDay;
    }

  

    public JobGreetings(int greetingId, int jobSeekerId, int jobId, String introduction, String attachment, double price, String status) {
        this.greetingId = greetingId;
        this.jobSeekerId = jobSeekerId;
        this.jobId = jobId;
        this.introduction = introduction;
        this.attachment = attachment;
        this.price = price;
        this.status = status;
    }

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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
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
    
    

    @Override
    public String toString() {
        return "JobGreeting{" + "greetingId=" + greetingId + ", jobSeekerId=" + jobSeekerId + ", jobId=" + jobId + ", introduction=" + introduction + ", attachment=" + attachment + ", price=" + price + ", status=" + status + '}';
    }

    public double getSumPrice(ArrayList<JobGreetings> greetings){
        double sum = 0;
        for (JobGreetings greeting : greetings) {
            sum += greeting.getPrice();
        }
        return sum;
    }
    
    public double getDepositSeeker(){
        double deposit = 0;
        deposit = this.price * 0.1;
        return deposit;
    }
}
