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
public class Education {
        private int cvId;
        private int educationId;
        private String fieldOfStudy;
        private Date startDate;
        private Date endDate;
        private String degree;
        private String schoolCustom;
        private String schoolName;

    public Education() {
    }

    public Education(int cvId, int educationId, String fieldOfStudy, Date startDate, Date endDate, String degree, String schoolCustom) {
        this.cvId = cvId;
        this.educationId = educationId;
        this.fieldOfStudy = fieldOfStudy;
        this.startDate = startDate;
        this.endDate = endDate;
        this.degree = degree;
        this.schoolCustom = schoolCustom;
    }

    public Education(int educationId, String fieldOfStudy, Date startDate, Date endDate, String degree, String schoolCustom) {
        this.educationId = educationId;
        this.fieldOfStudy = fieldOfStudy;
        this.startDate = startDate;
        this.endDate = endDate;
        this.degree = degree;
        this.schoolCustom = schoolCustom;
    }
    

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public int getEducationId() {
        return educationId;
    }

    public void setEducationId(int educationId) {
        this.educationId = educationId;
    }

    public String getFieldOfStudy() {
        return fieldOfStudy;
    }

    public void setFieldOfStudy(String fieldOfStudy) {
        this.fieldOfStudy = fieldOfStudy;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getSchoolCustom() {
        return schoolCustom;
    }

    public void setSchoolCustom(String schoolCustom) {
        this.schoolCustom = schoolCustom;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }
    
    @Override
    public String toString() {
        return "Education{" + "cvId=" + cvId + ", educationId=" + educationId + ", fieldOfStudy=" + fieldOfStudy + ", startDate=" + startDate + ", endDate=" + endDate + ", degree=" + degree + ", schoolCustom=" + schoolCustom + '}';
    }

    
   
}