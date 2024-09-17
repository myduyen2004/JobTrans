CREATE DATABASE JOBTRANS

USE JOBTRANS
CREATE TABLE CV (
    cv_id INT NOT NULL PRIMARY KEY,   
    user_id INT NOT NULL,             
    title NVARCHAR(100),
    summary NVARCHAR(MAX),
    created_at DATE,
    
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES User(user_id) 
);
CREATE TABLE CV_Skill (
    cv_id INT NOT NULL,              
    skill_id INT NOT NULL,            
    proficiency NVARCHAR(100),
  
    PRIMARY KEY (cv_id, skill_id),    
  
    CONSTRAINT FK_cv_id FOREIGN KEY (cv_id) REFERENCES CV(cv_id), 
  
    CONSTRAINT FK_skill_id FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);
CREATE TABLE CV_Education (
    cv_id INT NOT NULL,               
    education_id INT NOT NULL,        
    start_date DATE,                  
    end_date DATE,                   
    degree NVARCHAR(50),              
    PRIMARY KEY (cv_id, education_id),
    
    CONSTRAINT FK_cv_education_cv_id FOREIGN KEY (cv_id) REFERENCES CV(cv_id),
    
    CONSTRAINT FK_cv_education_education_id FOREIGN KEY (education_id) REFERENCES School(education_id) 
);
CREATE TABLE CV_Experience (
    cv_id INT NOT NULL,              
    experience_id INT NOT NULL,       
    years_of_experience INT,         
    achievement NVARCHAR(100),        
    PRIMARY KEY (cv_id, experience_id),
    
    CONSTRAINT FK_cv_experience_cv_id FOREIGN KEY (cv_id) REFERENCES CV(cv_id),
    
    CONSTRAINT FK_cv_experience_experience_id FOREIGN KEY (experience_id) REFERENCES Company(experience_id)
);
