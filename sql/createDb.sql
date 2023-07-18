CREATE DATABASE subd;
GO
USE subd;
CREATE TABLE StuffTable
(
    Id INT IDENTITY PRIMARY KEY,
    Code NVARCHAR(30) NOT NULL,
   
)
CREATE TABLE Developers
(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(30) NOT NULL,
    StuffTAbleId INT REFERENCES StuffTAble (Id),
   
)
CREATE TABLE Projects
(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(30) NOT NULL,
    ParentId INT 
   
)
CREATE TABLE ProjectDeveloper
(

		Primary Key (DeveloperId, ProjectId),
        DeveloperId INT REFERENCES Developers (Id),
        ProjectId INT REFERENCES Projects (Id)
)

insert StuffTable values ('Project Manager', 'Team Leader', 'Developer', 'Tester')
insert Developers values 
('Ivanov Ivan', 1),
('Pavel Volya', 2),
('Tom Claim', 2),
('Jorik Vartanov', 3),
('Sidorov Ivan', 3),
('Prokopenko Artem', 4),
('Hans van Nek', 4),
('Nikita Askerov', 3),
('Robert de Niro', 3)

insert ProjectDeveloper values

(3,1),
(4,1),
(6,1),
(7,1),
(8,1),
(3,2),
(5,2),
(9,2),
(10,2),
(3,3),
(5,3),
(7,3),
(11,3)

insert Projects (Name, ParentId) values 
('Tax Administration', 1),
('Risk based audit', NULL),
('Mobile Billing System', NULL),
('Oil monitoring system', NULL),
('Operator control', 4)
