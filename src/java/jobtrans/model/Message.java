/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

/**
 *
 * @author admin
 */
import java.sql.Timestamp;

public class Message {
    private int messageId;
    private int senderId;
    private int receiverId;
    private String attachment;
    private String content;
    private Timestamp sentTime;
    private int jobId;

    // Getters và Setters cho từng thuộc tính
    
    public Message() {
    }

    public Message(int senderId, int receiverId, String attachment, String content, Timestamp sentTime, int jobId) {
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.attachment = attachment;
        this.content = content;
        this.sentTime = sentTime;
        this.jobId = jobId;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
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

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getSentTime() {
        return sentTime;
    }

    public void setSentTime(Timestamp sentTime) {
        this.sentTime = sentTime;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    @Override
    public String toString() {
        return "Message{" + "messageId=" + messageId + ", senderId=" + senderId + ", receiverId=" + receiverId + ", attachment=" + attachment + ", content=" + content + ", sentTime=" + sentTime + ", jobId=" + jobId + '}';
    }
    
}
