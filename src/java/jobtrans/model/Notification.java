/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.util.Date;

public class Notification {
    private int notificationId;
    private int userId;
    private String notiTitle;
    private String content;
    private Date createdTime;
    private boolean readStatus;

    public Notification() {
    }
    
    
    public Notification(int notificationId, int userId, String notiTitle, String content, Date createdTime, boolean readStatus) {
        this.notificationId = notificationId;
        this.userId = userId;
        this.notiTitle = notiTitle;
        this.content = content;
        this.createdTime = createdTime;
        this.readStatus = readStatus;
    }

    public Notification(int userId, String notiTitle, String content, Date createdTime, boolean readStatus) {
        this.userId = userId;
        this.notiTitle = notiTitle;
        this.content = content;
        this.createdTime = createdTime;
        this.readStatus = readStatus;
    }
    
    
    
    // Getters and Setters
    public int getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(int notificationId) {
        this.notificationId = notificationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getNotiTitle() {
        return notiTitle;
    }

    public void setNotiTitle(String notiTitle) {
        this.notiTitle = notiTitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public boolean isReadStatus() {
        return readStatus;
    }

    public void setReadStatus(boolean readStatus) {
        this.readStatus = readStatus;
    }
    
}
