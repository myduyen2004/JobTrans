/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

/**
 *
 * @author ADM
 */
public class JobReport {
    private int jobReportId;
    private int reportedJob;
    private int reportBy;
    private String contentReport;
    private String attachment;
    private String status;

    public JobReport() {
    }

    public JobReport(int jobReportId, int reportedJob, int reportBy, String contentReport, String attachment, String status) {
        this.jobReportId = jobReportId;
        this.reportedJob = reportedJob;
        this.reportBy = reportBy;
        this.contentReport = contentReport;
        this.attachment = attachment;
        this.status = status;
    }

    public int getJobReportId() {
        return jobReportId;
    }

    public void setJobReportId(int jobReportId) {
        this.jobReportId = jobReportId;
    }

    public int getReportedJob() {
        return reportedJob;
    }

    public void setReportedJob(int reportedJob) {
        this.reportedJob = reportedJob;
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
        return "JobReport{" + "jobReportId=" + jobReportId + ", reportedJob=" + reportedJob + ", reportBy=" + reportBy + ", contentReport=" + contentReport + ", attachment=" + attachment + ", status=" + status + '}';
    }
}
