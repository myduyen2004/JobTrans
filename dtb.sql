CREATE DATABASE JOBTRANS

USE JOBTRANS
CREATE TABLE Users (
    user_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    user_name NVARCHAR(50),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(20),
    oauth_provider VARCHAR(100),
    oauth_id VARCHAR(MAX),
    role VARCHAR(15),
    balance INT,
    description NVARCHAR(MAX),
    specification NVARCHAR(100),
    address NVARCHAR(100),
    avatar_url NVARCHAR(MAX),
    status BIT NOT NULL
);
GO
CREATE TABLE Notifications (
    notification_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    noti_title NVARCHAR(200),
    content NVARCHAR(MAX),
    created_time DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
GO
CREATE TABLE JobCategory(
	category_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	category_name NVARCHAR(50),
	description NVARCHAR(200)
);
GO
CREATE TABLE Job(
	job_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	user_id INT FOREIGN KEY REFERENCES Users(user_id),
	job_title NVARCHAR(150),
	budget INT,
	description NVARCHAR(MAX),
	due_date DATE,
	status NVARCHAR(100),
	category_id INT FOREIGN KEY REFERENCES JobCategory(category_id),
	employer_feedback NVARCHAR(MAX),
	seeker_feedback NVARCHAR(MAX),
	secure_wallet INT,
	doc_URL VARCHAR(MAX),
	interview_URL VARCHAR(MAX),
	interview_Date DATE,
	address VARCHAR(MAX)
);
GO
CREATE TABLE JobGreetings (
    greeting_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    job_seeker_id INT,
    job_id INT,
    introduction NVARCHAR(MAX),
    attachment NVARCHAR(MAX),
    price INT,
    status NVARCHAR(100),
	expectedDay int,
    FOREIGN KEY (job_seeker_id) REFERENCES Users(user_id),
    FOREIGN KEY (job_id) REFERENCES Job(job_id)
);
GO
CREATE TABLE CV (
    cv_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,   
    title NVARCHAR(100),
    summary NVARCHAR(MAX),
    created_at DATE,
	user_id INT FOREIGN KEY REFERENCES Users(user_id) 
  );
GO
 create table School(
	 education_id INT not null IDENTITY(1,1) primary key ,
	 school_name Nvarchar(100)
);
GO
 create table Skill(
	 skill_id INT not null IDENTITY(1,1) primary key ,
	 skill_name Nvarchar(100),
);
GO
create table Company(
	 experience_id INT not null IDENTITY(1,1) primary key ,
	 company_name Nvarchar(100),
	 description Nvarchar(max)
);
GO

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
	field_of_study Nvarchar(100),
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
Create table dConversation(
 conversation_id varchar primary key,
 job_id INT FOREIGN KEY REFERENCES Job(job_id) ,
 start_date Date ,
 )
 
 CREATE TABLE dMESSAGE(
 message_id INT IDENTITY(1,1) PRIMARY KEY, 
 conversation_id varchar not null foreign key references dConversation(conversation_id) ,
 sender_id INT FOREIGN KEY REFERENCES Users(user_id),
 attachment varchar(MAX),
 content nvarchar(MAX),
 sent_time DATETIME
 )
CREATE TABLE [Transaction] (
    transactionId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	senderId INT FOREIGN KEY REFERENCES Users(user_id),
	receiverId INT FOREIGN KEY REFERENCES Users(user_id),
	adminId INT FOREIGN KEY REFERENCES Users(user_id),
    amount INT,
    createdDate DATETIME,
	status BIT,
    transactionType NVARCHAR(50),
	description NVARCHAR(MAX),
    jobId INT FOREIGN KEY REFERENCES Job(job_id)
);

CREATE TABLE Shipment (
    shipmentId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	jobId INT FOREIGN KEY REFERENCES Job(job_id),
	senderId INT FOREIGN KEY REFERENCES Users(user_id),
	receiverId INT FOREIGN KEY REFERENCES Users(user_id),
    status NVARCHAR(100),
    shipmentDate DATE,
	description NVARCHAR(MAX)
);

ALTER TABLE Users
ADD CONSTRAINT chk_role CHECK (role IN ('Seeker', 'Employer', 'Admin'));
GO

INSERT INTO JobCategory(category_name) values
(N'Hỗ Trợ Quản Trị'),
(N'Dịch Vụ Khách Hàng'),
(N'Phân Tích Dữ Liệu'),
(N'Thiết Kế & Sáng Tạo'),
(N'Pháp Lý'),
(N'Phát Triển Phần Mềm'),
(N'Công Nghệ Thông Tin & Mạng'),
(N'Soạn Thảo Văn Bản'),
(N'Biên Dịch'),
(N'Bán Hàng & Tiếp Thị'),
(N'Không xác định');

GO
INSERT INTO Company (company_name, description)
VALUES 
    ('VinGroup', 'Conglomerate in real estate, retail, and technology'),
    ('Viettel', 'Telecommunications company and defense contractor'),
    ('FPT Corporation', 'Technology and IT services company'),
    ('PetroVietnam', 'State-owned petroleum company'),
    ('Vinamilk', 'Dairy and beverage company'),
    ('Masan Group', 'Consumer goods and retail conglomerate'),
    ('Hoa Phat Group', 'Steel production and construction materials'),
    ('BIDV', 'State-owned commercial bank'),
    ('Vietcombank', 'Commercial bank and financial services company'),
    ('Techcombank', 'Private commercial bank'),
    ('Vietnam Airlines', 'National flag carrier of Vietnam'),
    ('Thaco', 'Automobile manufacturer and distributor'),
    ('Sabeco', 'Brewing company famous for Saigon Beer'),
    ('Habeco', 'Beer production company'),
    ('Novaland', 'Real estate development company'),
    ('Sovico Group', 'Investment company in aviation, real estate, and banking'),
    ('VPBank', 'Vietnam Prosperity Joint Stock Commercial Bank'),
    ('Kido Group', 'Food production company'),
    ('Vingroup Retail', 'Retail arm of Vingroup with malls and supermarkets'),
    ('Saigon Co.op', 'Retail cooperative and supermarket chain');

GO

INSERT INTO Skill (skill_name)
VALUES
('Java Programming'),
('SQL Server'),
('HTML/CSS'),
('JavaScript'),
('Python Programming'),
('Angular'),
('React'),
('Node.js'),
('Spring Framework'),
('Docker'),
('Kubernetes'),
('Git'),
('Linux Administration'),
('AWS Cloud'),
('Azure Cloud'),
('Agile Methodology'),
('Machine Learning'),
('Data Analysis'),
('UI/UX Design'),
('Cybersecurity');
GO
INSERT INTO School (school_name)
VALUES
('Vietnam National University Hanoi'),
('Vietnam National University Ho Chi Minh City'),
('Hanoi University of Science and Technology'),
('University of Danang'),
('Hue University'),
('Foreign Trade University'),
('University of Economics Ho Chi Minh City'),
('University of Transport and Communications'),
('Can Tho University'),
('University of Medicine and Pharmacy Ho Chi Minh City'),
('Hanoi Medical University'),
('University of Social Sciences and Humanities Hanoi'),
('University of Social Sciences and Humanities Ho Chi Minh City'),
('Ton Duc Thang University'),
('University of Law Ho Chi Minh City'),
('University of Architecture Ho Chi Minh City'),
('Ho Chi Minh City University of Technology'),
('Ho Chi Minh City University of Education'),
('FPT University'),
('RMIT University Vietnam');



