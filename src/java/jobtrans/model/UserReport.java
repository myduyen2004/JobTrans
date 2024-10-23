/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

/**
 *
 * @author NGUYENVU
 */
public class UserReport {
    private int userReportId; 
    private int reportedUser;
    private int reportBy;
    private String contentReport;
    private String attachment;
    private String status;

    public UserReport(int userReportId, int reportedUser, int reportBy, String contentReport, String attachment, String status) {
        this.userReportId = userReportId;
        this.reportedUser = reportedUser;
        this.reportBy = reportBy;
        this.contentReport = contentReport;
        this.attachment = attachment;
        this.status = status;
    }

    public UserReport(int userReportId) {
        this.userReportId = userReportId;
    }

 

    public UserReport() {
    }

    public UserReport(int reportedUser, int reportBy, String contentReport, String attachment, String status) {
        this.reportedUser = reportedUser;
        this.reportBy = reportBy;
        this.contentReport = contentReport;
        this.attachment = attachment;
        this.status = status;
    }

    public int getUserReportId() {
        return userReportId;
    }

    public void setUserReportId(int userReportId) {
        this.userReportId = userReportId;
    }

    public int getReportedUser() {
        return reportedUser;
    }

    public void setReportedUser(int reportedUser) {
        this.reportedUser = reportedUser;
    }

    public int getReportBy() {
        return reportBy;
    }

    public void setReportBy(int reportBy) {
        this.reportBy = reportBy;
    }

    public String getContentReport() {
        return contentReport;
    }

    public void setContentReport(String contentReport) {
        this.contentReport = contentReport;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserReport{" + "userReportId=" + userReportId + ", reportedUser=" + reportedUser + ", reportBy=" + reportBy + ", contentReport=" + contentReport + ", attachment=" + attachment + ", status=" + status + '}';
    }
    
}
