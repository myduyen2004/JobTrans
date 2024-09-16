CREATE DATABASE JOBTRANS

USE JOBTRANS

CREATE TABLE JobCategory(
	categoryId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	categoryName NVARCHAR(50),
	description NVARCHAR(200)
);

CREATE TABLE Job(
	jobId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	userId INT FOREIGN KEY REFERENCES User(userId),
	jobTitle NVARCHAR(150),
	budget INT,
	description NVARCHAR(MAX),
	dueDate DATE,
	status BIT NOT NULL,
	categoryId INT FOREIGN KEY REFERENCES JobCategory(categoryId),
	employerFeedback NVARCHAR(MAX),
	seekerFeedback NVARCHAR(MAX)
);

CREATE TABLE [Transaction] (
    transactionId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	senderId INT FOREIGN KEY REFERENCES User(userId),
	receiverId INT FOREIGN KEY REFERENCES User(userId),
	adminId INT FOREIGN KEY REFERENCES User(userId),
    amount INT,
    createdDate DATE,
	status BIT,
    transactionType NVARCHAR(50),
    jobId INT FOREIGN KEY REFERENCES Job(jobId)
);

CREATE TABLE Shipment (
    shipmentId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	jobId INT FOREIGN KEY REFERENCES Job(jobId),
	senderId INT FOREIGN KEY REFERENCES User(userId),
	receiverId INT FOREIGN KEY REFERENCES User(userId),
    status BIT,
    shipmentDate DATE,
	description NVARCHAR(MAX)
);