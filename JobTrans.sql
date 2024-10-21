CREATE DATABASE JOBTRANS

USE JOBTRANS
CREATE TABLE Users (
    user_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    user_name NVARCHAR(50),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(32),
    oauth_provider VARCHAR(100),
    oauth_id VARCHAR(MAX),
    role VARCHAR(15),
    balance INT,
    description NVARCHAR(MAX),
    specification NVARCHAR(100),
    address NVARCHAR(100),
    avatar_url NVARCHAR(MAX),
	date_of_birth DATE,
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
	address NVARCHAR(MAX),
	label_verify NVARCHAR(100)
);
GO
CREATE TABLE CV (
    cv_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,   
    job_position NVARCHAR(200),
    summary NVARCHAR(MAX),
    created_at DATE,
	user_id INT FOREIGN KEY REFERENCES Users(user_id) 
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
	cv_id INT,
	FOREIGN KEY (cv_id) REFERENCES CV(cv_id),
    FOREIGN KEY (job_seeker_id) REFERENCES Users(user_id),
    FOREIGN KEY (job_id) REFERENCES Job(job_id)
);
GO
CREATE TABLE School(
	 education_id INT not null IDENTITY(1,1) primary key ,
	 school_name Nvarchar(100)
);
GO
CREATE TABLE CV_Education (
    cv_id INT NOT NULL,               
    education_id INT NOT NULL,        
    start_date DATE,                  
    end_date DATE, 
	field_of_study Nvarchar(100),
    degree NVARCHAR(50),              
    PRIMARY KEY (cv_id, education_id),
    
    CONSTRAINT FK_cv_education_cv_id FOREIGN KEY (cv_id) REFERENCES CV(cv_id),
    
    CONSTRAINT FK_cv_education_education_id FOREIGN KEY (education_id) REFERENCES School(education_id),
	school_custom NVARCHAR(200)
);
GO
CREATE TABLE Skill(
	 skill_id INT not null IDENTITY(1,1) primary key ,
	 skill_name Nvarchar(100),
);
GO
CREATE TABLE CV_Skill (
    cv_id INT NOT NULL,              
    skill_id INT NOT NULL,            
    PRIMARY KEY (cv_id, skill_id),    
    CONSTRAINT FK_cv_id FOREIGN KEY (cv_id) REFERENCES CV(cv_id), 
    CONSTRAINT FK_skill_id FOREIGN KEY (skill_id) REFERENCES Skill(skill_id),
	skill_custom NVARCHAR(200)
);
GO
CREATE TABLE Company(
	 experience_id INT not null IDENTITY(1,1) primary key ,
	 company_name Nvarchar(100),
	 description Nvarchar(max)
);
GO
CREATE TABLE CV_Experience (
    cv_id INT NOT NULL,              
    experience_id INT NOT NULL,       
    --years_of_experience INT,         
    job_position NVARCHAR(100),  
	address NVARCHAR(100),
	description NVARCHAR(MAX),
    PRIMARY KEY (cv_id, experience_id),
    CONSTRAINT FK_cv_experience_cv_id FOREIGN KEY (cv_id) REFERENCES CV(cv_id),
    CONSTRAINT FK_cv_experience_experience_id FOREIGN KEY (experience_id) REFERENCES Company(experience_id),
	start_at DATE,
	end_at DATE,
	company_custom NVARCHAR(200)
);
GO
CREATE TABLE Certification(
	 certification_id INT not null IDENTITY(1,1) primary key ,
	 certification_name Nvarchar(100),
);
GO
CREATE TABLE CV_Certification(
	 cv_id INT NOT NULL,
	 certification_id INT NOT NULL ,
	 year DATE,
	 description NVARCHAR(MAX),
	 certification_custom NVARCHAR(200)
);
GO
CREATE TABLE dConversation(
 conversation_id INT primary key,
 job_id INT FOREIGN KEY REFERENCES Job(job_id) ,
 start_date DATETIME ,
 );
GO
CREATE TABLE dMESSAGE(
 message_id INT IDENTITY(1,1) PRIMARY KEY, 
 conversation_id INT not null foreign key references dConversation(conversation_id) ,
 sender_id INT FOREIGN KEY REFERENCES Users(user_id),
 attachment varchar(MAX),
 content nvarchar(MAX),
 sent_time DATETIME
 );
GO
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
GO
CREATE TABLE Shipment (
    shipmentId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	jobId INT FOREIGN KEY REFERENCES Job(job_id),
	senderId INT FOREIGN KEY REFERENCES Users(user_id),
	receiverId INT FOREIGN KEY REFERENCES Users(user_id),
    status NVARCHAR(100),
    shipmentDate DATE,
	province NVARCHAR(200),
	district NVARCHAR(200),
	ward NVARCHAR(200),
	detail_address NVARCHAR(MAX),
	description NVARCHAR(MAX)
);
GO
CREATE TABLE UserReport(
	user_report_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	reported_user INT FOREIGN KEY REFERENCES Users(user_id),
	report_by INT FOREIGN KEY REFERENCES Users(user_id),
	content_report NVARCHAR(MAX),
	attachment NVARCHAR(MAX),
	status NVARCHAR(100)
);
GO
CREATE TABLE JobReport(
	job_report_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	reported_job INT FOREIGN KEY REFERENCES Job(job_id),
	report_by INT FOREIGN KEY REFERENCES Users(user_id),
	content_report NVARCHAR(MAX),
	attachment NVARCHAR(MAX),
	status NVARCHAR(100)
);
GO

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

--Thêm Constraint cho Transaction
ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT chk_transaction_description CHECK (description IN (N'Nộp vào ví',N'Đặt cọc nhận việc',N'Rút tiền',N'Trả trước',N'Hoàn tiền',N'Nhận lương'));
GO

ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT chk_transaction_type CHECK (transactionType IN (N'Thêm tiền',N'Trừ tiền'));
GO

--Thêm Constraint cho JobGreeting
ALTER TABLE JobGreetings
ADD CONSTRAINT chk_jobgreeting_status CHECK (status IN (N'Bị từ chối',N'Được chấp nhận',N'Chưa phản hồi',N'Chờ phỏng vấn'));
GO

--Thêm Constraint cho Job
ALTER TABLE Job
ADD CONSTRAINT chk_job_status CHECK (status IN (N'Đã trả lương',N'Đã hoàn tiền',N'Đã hoàn thành',N'Đã nộp sản phẩm',N'Bị khiếu nại',N'Đang làm việc',N'Chờ đặt cọc',N'Đang tuyển'));
GO

CREATE PROCEDURE UpdateJobGreetingsStatus
AS
BEGIN
    -- Cập nhật status của JobGreetings thành 'Bị từ chối' khi Job đã quá hạn
    UPDATE JobGreetings
    SET status = N'Bị từ chối'
    FROM JobGreetings JG
    INNER JOIN Job J ON JG.job_id = J.job_id
    WHERE J.due_date < GETDATE() AND JG.status != N'Bị từ chối';
END;
GO

INSERT INTO Users (user_name, email, password, oauth_provider, oauth_id, role, balance, description, specification, address, avatar_url, date_of_birth, status)
VALUES 
('Nguyen Van A', 'nguyenvana@example.com', '25d55ad283aa400af464c76d713c07ad', null, null, 'Employer', 10000, 'User description A', null, '123 Main St', null, '1990-05-10', 1);
GO

ALTER TABLE [dbo].[Users]
ALTER COLUMN password VARCHAR(32);