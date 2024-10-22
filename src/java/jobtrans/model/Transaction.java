/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.time.LocalDateTime;
import jobtrans.utils.DateTimeUtils;

/**
 *
 * @author admin
 */
import java.util.Date;

public class Transaction {
    private int transactionId;
    private int senderId;
    private int receiverId;
    private int adminId;
    private int amount;
    private Date createdDate;
    private boolean status; // sử dụng boolean cho BIT
    private String transactionType;
    private String description;
    private int jobId;

    public Transaction() {
    }

    public Transaction(int senderId, int amount, Date createdDate, boolean status, String transactionType, String description, int jobId) {
        this.senderId = senderId;
        this.amount = amount;
        this.createdDate = createdDate;
        this.status = status;
        this.transactionType = transactionType;
        this.description = description;
        this.jobId = jobId;
    }
    
    
    // Getters and Setters
    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    @Override
    public String toString() {
        return "Transaction{" + "transactionId=" + transactionId + ", senderId=" + senderId + ", receiverId=" + receiverId + ", adminId=" + adminId + ", amount=" + amount + ", createdDate=" + createdDate + ", status=" + status + ", transactionType=" + transactionType + ", description=" + description + ", jobId=" + jobId + '}';
    }
    
    
}
