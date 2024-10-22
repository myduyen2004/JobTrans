/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

import java.util.ArrayList;
import java.util.Date;

public class CV {

    private int cvId;
    private String title;
    private String summary;
    private Date createdAt;
    private int userId;
    private ArrayList<Certification> listCertification;
    private ArrayList<Education> listEdu;
    private ArrayList<Skill> listSkill;
    private ArrayList<Experience> listExperience;

    public CV() {
    }

    public CV(int cvId, String title, String summary, Date createdAt, int userId) {
        this.cvId = cvId;
        this.title = title;
        this.summary = summary;
        this.createdAt = createdAt;
        this.userId = userId;
    }

    public CV(int cvId, String title, String summary, Date createdAt, int userId, ArrayList<Certification> listCertification, ArrayList<Education> listEdu, ArrayList<Skill> listSkill, ArrayList<Experience> listExperience) {
        this.cvId = cvId;
        this.title = title;
        this.summary = summary;
        this.createdAt = createdAt;
        this.userId = userId;
        this.listCertification = listCertification;
        this.listEdu = listEdu;
        this.listSkill = listSkill;
        this.listExperience = listExperience;
    }
    

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public ArrayList<Certification> getListCertification() {
        return listCertification;
    }

    public void setListCertification(ArrayList<Certification> listCertification) {
        this.listCertification = listCertification;
    }

    public ArrayList<Education> getListEdu() {
        return listEdu;
    }

    public void setListEdu(ArrayList<Education> listEdu) {
        this.listEdu = listEdu;
    }

    public ArrayList<Skill> getListSkill() {
        return listSkill;
    }

    public void setListSkill(ArrayList<Skill> listSkill) {
        this.listSkill = listSkill;
    }

    public ArrayList<Experience> getListExperience() {
        return listExperience;
    }

    public void setListExperience(ArrayList<Experience> listExperience) {
        this.listExperience = listExperience;
    }

    @Override
    public String toString() {
        return "CV{" + "cvId=" + cvId + ", title=" + title + ", summary=" + summary + ", createdAt=" + createdAt + ", userId=" + userId + ", listCertification=" + listCertification + ", listEdu=" + listEdu + ", listSkill=" + listSkill + ", listExperience=" + listExperience + '}';
    }
    
}
