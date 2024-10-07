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
public class CV_education {
        private int cvId;
        private int educationId;
        private String fieldOfStudy;
        private String schoolName;
        private Date startDate;
        private Date endDate;
        private String degree;

    public CV_education() {
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

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
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

    public CV_education(int cvId, int educationId, String fieldOfStudy, String schoolName, Date startDate, Date endDate, String degree) {
        this.cvId = cvId;
        this.educationId = educationId;
        this.fieldOfStudy = fieldOfStudy;
        this.schoolName = schoolName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.degree = degree;
    }

    @Override
    public String toString() {
        return "CV_education{" + "cvId=" + cvId + ", educationId=" + educationId + ", fieldOfStudy=" + fieldOfStudy + ", schoolName=" + schoolName + ", startDate=" + startDate + ", endDate=" + endDate + ", degree=" + degree + '}';
    }

}