Create Database ElectionManagement
Go
Use Database ElectionManagement
Go
Create Table  Candidate(CandidateId int primary key identity(1,1),
CandidateName varchar(100),
CandidateContact varchar(100),
EmailId  varchar(100),
Address varchar(100),
Profile varchar(100),
City varchar(100),
Description varchar(100)
)
Go
Create Table Register(UserId int primary key identity(1,1), 
FullName varchar(100),
Username varchar(100),
Password varchar(100),
Contact varchar(100),
Address varchar(100)
)
GO
Create Table ElectionMaster(ElectionId int primary key identity(1,1),
ElectionName varchar(100),
NoOfCandidate varchar(100),
ElectionDate varchar(100)
)
GO
Create Table ElectionDetails(ElectiondetailId int primary key identity(1,1),ElectionId int,CandidateId int)
GO
Create Table Voting(VotingId int primary key identity(1,1), ElectionId int,CandidateId int,VoterId int)