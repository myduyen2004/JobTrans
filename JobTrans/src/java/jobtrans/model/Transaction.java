/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.time.LocalDateTime;
import java.util.Date;
import jobtrans.utils.DateTimeUtils;

/**
 *
 * @author admin
 */
public class Transaction {
    private DateTimeUtils dateTime = new DateTimeUtils();
    private int transactionId;
    private int senderId;
    private int receiverId;
    private int adminId;
    private double amount;
    private LocalDateTime createdDate;
    private boolean status;
    private String transactionType;
    private int jobId;
    private String description;

    // Constructor
    public Transaction() {
    }

    public Transaction(int transactionId, int senderId, int receiverId, int adminId, double amount, LocalDateTime createdDate, boolean status, String transactionType, int jobId, String description) {
        this.transactionId = transactionId;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.adminId = adminId;
        this.amount = amount;
        this.createdDate = createdDate;
        this.status = status;
        this.transactionType = transactionType;
        this.jobId = jobId;
        this.description = description;
    }

    public DateTimeUtils getDateTime() {
        return dateTime;
    }

    public void setDateTime(DateTimeUtils dateTime) {
        this.dateTime = dateTime;
    }

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

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
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

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
    public String getCreatedDateTime(){
        return dateTime.formatDateTime(createdDate);
    }

    @Override
    public String toString() {
        return "Transaction{" + "dateTime=" + dateTime + ", transactionId=" + transactionId + ", senderId=" + senderId + ", receiverId=" + receiverId + ", adminId=" + adminId + ", amount=" + amount + ", createdDate=" + createdDate + ", status=" + status + ", transactionType=" + transactionType + ", jobId=" + jobId + ", description=" + description + '}';
    }

    

    
}
