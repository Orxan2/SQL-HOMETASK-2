CREATE DATABASE School

USE School

CREATE TABLE Student
(
[Id] int primary key identity,
[Name] nvarchar(50) not null,
[Surname] nvarchar(50),
[Phone] nvarchar(20) unique,
[Score] int default(50),
[Comment] text,
[IsGraduated] bit default('false'),
)

INSERT INTO [dbo].Student
VALUES (N'Orxan',N'İbrahimov','+994557482600',100,'Woow','true')

INSERT INTO [dbo].Student(Name,Surname,Phone,Score)
VALUES (N'Elşən',N'Kərimov','+994513635555',61)

INSERT INTO [dbo].Student(Name,Surname,Phone,Score)
VALUES (N'Xəyal',N'Binnətov','+9942222222',36),
(N'Semih',N'Şentürk','+9943333333',75),
(N'Lionel',N'Messi','+9940000000',1),
(N'Lenardo',N'Da Vinçi','+9941111111',92),
(N'Eldar',N'Seyidov','+9944328686',86),
(N'Alim',N'Əkbərov','+9942563232',32),
(N'Xaliq',N'Xaliqov','+9945555555',68),
(N'Əmrah',N'Qasımov','+9947777777',48)

UPDATE [dbo].Student
SET Comment = 'Congratulations',IsGraduated = 'True'
WHERE Score > 50

UPDATE [dbo].Student
SET Comment = 'So bad',IsGraduated = 'False'
WHERE Score < 50

USE School

CREATE TABLE GraduatedStudents
(
[Id] int primary key identity,
[Name] nvarchar(50) not null,
[Surname] nvarchar(50),
[Phone] nvarchar(20) unique,
[Score] int default(50),
[Comment] text,
[IsGraduated] bit default('false'),
)

INSERT INTO dbo.GraduatedStudents(Name,Surname,Phone,Score,Comment,IsGraduated)
SELECT Name,Surname,Phone,Score,Comment,IsGraduated FROM dbo.Student WHERE IsGraduated = 'True'

DELETE FROM Student 
WHERE IsGraduated = 'True'

SELECT * FROM dbo.GraduatedStudents
SELECT * FROM dbo.Student
