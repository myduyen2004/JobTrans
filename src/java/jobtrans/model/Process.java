package jobtrans.model;

import java.util.Date;

/**
 *
 * @author qn407
 */
public class Process {
    private int processId;
    private String stageName;
    private Date endDate;
    private String requirements;
    private String descriptionResult;
    private String resultUrl;
    private String status;
    private String comments;
    private int jobId;

    public Process() {
    }

    public Process(int processId, String stageName, Date endDate, String requirements, 
                   String descriptionResult, String resultUrl, String status, 
                   String comments, int jobId) {
        this.processId = processId;
        this.stageName = stageName;
        this.endDate = endDate;
        this.requirements = requirements;
        this.descriptionResult = descriptionResult;
        this.resultUrl = resultUrl;
        this.status = status;
        this.comments = comments;
        this.jobId = jobId;
    }

    // Getters and Setters
    public int getProcessId() {
        return processId;
    }

    public void setProcessId(int processId) {
        this.processId = processId;
    }

    public String getStageName() {
        return stageName;
    }

    public void setStageName(String stageName) {
        this.stageName = stageName;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getDescriptionResult() {
        return descriptionResult;
    }

    public void setDescriptionResult(String descriptionResult) {
        this.descriptionResult = descriptionResult;
    }

    public String getResultUrl() {
        return resultUrl;
    }

    public void setResultUrl(String resultUrl) {
        this.resultUrl = resultUrl;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    @Override
    public String toString() {
        return "Process{" + "processId=" + processId + ", stageName=" + stageName + ", endDate=" + endDate + ", requirements=" + requirements + ", descriptionResult=" + descriptionResult + ", resultUrl=" + resultUrl + ", status=" + status + ", comments=" + comments + ", jobId=" + jobId + '}';
    }
    
    
}

