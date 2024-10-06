/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

/**
 *
 * @author mac
 */
public class CV_experience {
        private int cvId;
        private int experienceId;
        private String companyName;
        private String description;
        private int yearsOfExperience;
        private String achievement;

    public CV_experience() {
    }

    public CV_experience(int cvId, int experienceId, String companyName, String description, int yearsOfExperience, String achievement) {
        this.cvId = cvId;
        this.experienceId = experienceId;
        this.companyName = companyName;
        this.description = description;
        this.yearsOfExperience = yearsOfExperience;
        this.achievement = achievement;
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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getYearsOfExperience() {
        return yearsOfExperience;
    }

    public void setYearsOfExperience(int yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }

    public String getAchievement() {
        return achievement;
    }

    public void setAchievement(String achievement) {
        this.achievement = achievement;
    }

    @Override
    public String toString() {
        return "CV_experience{" + "cvId=" + cvId + ", experienceId=" + experienceId + ", companyName=" + companyName + ", description=" + description + ", yearsOfExperience=" + yearsOfExperience + ", achievement=" + achievement + '}';
    }
        
    
}
