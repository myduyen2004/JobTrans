/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.util.Date;

/**
 *
 * @author mac
 */
public class Experience {
        private int cvId;
        private int experienceId;
        private String jobPosition;
        private String address;
        private String description;
        private Date startAt;
        private Date endAt;
        private String companyCustom;
        private String experienceName;

    public Experience() {
    }

    public Experience(int cvId, int experienceId, String jobPosition, String address, String description, Date startAt, Date endAt, String companyCustom) {
        this.cvId = cvId;
        this.experienceId = experienceId;
        this.jobPosition = jobPosition;
        this.address = address;
        this.description = description;
        this.startAt = startAt;
        this.endAt = endAt;
        this.companyCustom = companyCustom;
    }

    public Experience(int experienceId, String jobPosition, String address, String description, Date startAt, Date endAt, String companyCustom) {
        this.experienceId = experienceId;
        this.jobPosition = jobPosition;
        this.address = address;
        this.description = description;
        this.startAt = startAt;
        this.endAt = endAt;
        this.companyCustom = companyCustom;
    }
    

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public int getExperienceId() {
        return experienceId;
    }

    public void setExperienceId(int experienceId) {
        this.experienceId = experienceId;
    }

    public String getJobPosition() {
        return jobPosition;
    }

    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartAt() {
        return startAt;
    }

    public void setStartAt(Date startAt) {
        this.startAt = startAt;
    }

    public Date getEndAt() {
        return endAt;
    }

    public void setEndAt(Date endAt) {
        this.endAt = endAt;
    }

    public String getCompanyCustom() {
        return companyCustom;
    }

    public void setCompanyCustom(String companyCustom) {
        this.companyCustom = companyCustom;
    }

    public String getExperienceName() {
        return experienceName;
    }

    public void setExperienceName(String experienceName) {
        this.experienceName = experienceName;
    }

    @Override
    public String toString() {
        return "Experience{" + "cvId=" + cvId + ", experienceId=" + experienceId + ", jobPosition=" + jobPosition + ", address=" + address + ", description=" + description + ", startAt=" + startAt + ", endAt=" + endAt + ", companyCustom=" + companyCustom + ", experienceName=" + experienceName + '}';
    }
    
    
    
    
}
