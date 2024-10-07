/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

/**
 *
 * @author mac
 */
public class CV_Skill {
        private int cvId;
        private int skillId;
        private String skillName;
        private String proficiency;

    public CV_Skill(int cvId, int skillId, String skillName, String proficiency) {
        this.cvId = cvId;
        this.skillId = skillId;
        this.skillName = skillName;
        this.proficiency = proficiency;
    }

    public CV_Skill() {
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getProficiency() {
        return proficiency;
    }

    public void setProficiency(String proficiency) {
        this.proficiency = proficiency;
    }

    @Override
    public String toString() {
        return "CV_Skill{" + "cvId=" + cvId + ", skillId=" + skillId + ", skillName=" + skillName + ", proficiency=" + proficiency + '}';
    }

    
        
}
