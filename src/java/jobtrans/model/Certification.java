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
public class Certification {
    private int cvId;            // cv_id
    private int certificationId;
    private Date year;            // year
    private String description; 
    private String certificationCustom;
    private String certificationName;

    public Certification() {
    }

    public Certification(int cvId, int certificationId, Date year, String description, String certificationCustom) {
        this.cvId = cvId;
        this.certificationId = certificationId;
        this.year = year;
        this.description = description;
        this.certificationCustom = certificationCustom;
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public int getCertificationId() {
        return certificationId;
    }

    public void setCertificationId(int certificationId) {
        this.certificationId = certificationId;
    }

    public Date getYear() {
        return year;
    }

    public void setYear(Date year) {
        this.year = year;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCertificationCustom() {
        return certificationCustom;
    }

    public void setCertificationCustom(String certificationCustom) {
        this.certificationCustom = certificationCustom;
    }

    public String getCertificationName() {
        return certificationName;
    }

    public void setCertificationName(String certificationName) {
        this.certificationName = certificationName;
    }
    

    @Override
    public String toString() {
        return "Certification{" + "cvId=" + cvId + ", certificationId=" + certificationId + ", year=" + year + ", description=" + description + ", certificationCustom=" + certificationCustom + '}';
    }

    
    

}
