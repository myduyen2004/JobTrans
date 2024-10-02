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
    private int seekerId;
    private int jobId;
    private String introduction;
    private String attachment;
    private float price;
    private boolean status;

    public JobGreetings(int greetingId, int seekerId, int jobId, String introduction, String attachment, float price, boolean status) {
        this.greetingId = greetingId;
        this.seekerId = seekerId;
        this.jobId = jobId;
        this.introduction = introduction;
        this.attachment = attachment;
        this.price = price;
        this.status = status;
    }
    
    
    public JobGreetings() {
    }

    
    public int getGreetingId() {
        return greetingId;
    }

    public void setGreetingId(int greetingId) {
        this.greetingId = greetingId;
    }

    public int getSeekerId() {
        return seekerId;
    }

    public void setSeekerId(int seekerId) {
        this.seekerId = seekerId;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public int getNumberOfBidder(ArrayList<JobGreetings> jgList){
        return jgList.size();
    }
    
    public float getAveragePrice(ArrayList<JobGreetings> jgList){
        float total = 0;
        for(JobGreetings jg : jgList){
            total += jg.getPrice();
        }
        
        int num = getNumberOfBidder(jgList);
        return total/num;
    }
}
