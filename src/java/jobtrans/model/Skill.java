/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

public class Skill {
        private int cvId;
        private int skillId;
        private String skillCustom;
        private String skillName;
    public Skill() {
    }

    public Skill(int cvId, int skillId, String skillCustom) {
        this.cvId = cvId;
        this.skillId = skillId;
        this.skillCustom = skillCustom;
    }

    public Skill(int skillId, String skillCustom) {
        this.skillId = skillId;
        this.skillCustom = skillCustom;
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

    public String getSkillCustom() {
        return skillCustom;
    }

    public void setSkillCustom(String skillCustom) {
        this.skillCustom = skillCustom;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    
    @Override
    public String toString() {
        return "Skill{" + "cvId=" + cvId + ", skillId=" + skillId + ", skillCustom=" + skillCustom + '}';
    }

    
}
