
----create schema Main 
--create schema [Lookup]

--create table lookup.UserType(
--ID int not null primary key IDENTITY(1,1),
--Name Nvarchar(100) not null,
--IsActive BIT null
--)

--alter table lookup.userType
--add Iscompany bit not null

--create table Main.UserCommonTable(
--ID int not null primary key IDENTITY(1,1),
--Email nvarchar(100) not null,
--[Password] nvarchar(200) not null,
--MobileNumber nvarchar(50) null,
--isVerified BIT null,
--isActive BIT null,
--)

--create table Drived.User_UserType(
--ID int not null primary key IDENTITY(1,1),
--UserID int FOREIGN KEY REFERENCES Main.UserCommonTable(ID),
--UserTypeID int FOREIGN KEY REFERENCES lookup.UserType(ID)
----)
--alter table Drived.User_UserType
--add UserTypeName nvarchar(50) null

--create table lookup.CompanyType(
--ID int not null primary key IDENTITY(1,1),
--Name Nvarchar(100) not null,
--IsActive BIT null
--)
--drop table lookup.CompanyType

--create table Main.UserCompany(
--ID int not null primary key IDENTITY(1,1),
--UserID int FOREIGN KEY REFERENCES Main.UserCommonTable(ID),
--CompanyName nvarchar(50) not null,
--BussinessNo nvarchar(50) not null,
--ZipCode nvarchar(10) not null,
--Address nvarchar(50) not null,
--TelephoneNo nvarchar(20) not null,
--FaxNo nvarchar(20) null,
--CEOName nvarchar(20) not null,
--AdminEmail nvarchar(30) not null,
--AdminName nvarchar(20) not null,
--AdminMobileNo nvarchar(15) not null,
--CompanyHomeUrl nvarchar(40)  null,
--OtherInfo nvarchar(400)  null
--)

--create table Main.UserPersonalInfo(
--ID int not null primary key IDENTITY(1,1),
--UserID int FOREIGN KEY REFERENCES Main.UserCommonTable(ID),
--Name nvarchar(50) not null,
--Affiliation nvarchar(30) null,
--ZipCode nvarchar(10)  null,
--Address nvarchar(40)  null,
--MobileNumber nvarchar(20) null,
--FacebookAddress nvarchar(40) null,
--TwitterAddress nvarchar(40) null,
--KakaoTalkAddress nvarchar(40) null,
--MajorInstrument1 nvarchar(40) null,
--MajorInstrument2 nvarchar(40) null,
--Photo1  nvarchar(80) null,
--Photo2  nvarchar(80) null,
--ProfilePage  nvarchar(400) null,
--Repertory  nvarchar(200) null,
--EndorsorEmailID1  nvarchar(30) null,
--EndorsorName1  nvarchar(30) null,
--EndorsorComments1  nvarchar(100) null,
--EndorsorEmailID2  nvarchar(30) null,
--EndorsorName2  nvarchar(30) null,
--EndorsorComments2  nvarchar(100) null,
--EndorsorEmailID3  nvarchar(30) null,
--EndorsorName3  nvarchar(30) null,
--EndorsorComments3  nvarchar(100) null,
--EndorsorEmailID4  nvarchar(30) null,
--EndorsorName4  nvarchar(30) null,
--EndorsorComments4  nvarchar(100) null,
--EndorsorEmailID5  nvarchar(30) null,
--EndorsorName5  nvarchar(30) null,
--EndorsorComments5  nvarchar(100) null,
--)



--select * from lookup.UserType

--Insert into lookup.userType(Name,isActive,Iscompany)
--values('Composer',1,0),
--('Conductor',1,0),
--('Teacher/Professor',1,0),
--('Student',1,0),
--('Audience',1,0),
--('Other Individual',1,0),
--('Orchestra',1,1),
--('Promoter',1,1),
--('Agent',1,1),
--('Shop Owner',1,1),
--('Other - Company',1,1)


select * from Core.Artist

--Alter table Core.Artist
--add
--FacebookAddress nvarchar(40) null,
--TwitterAddress nvarchar(40) null,
--KakaoTalkAddress nvarchar(40) null,
----MajorInstrument1 nvarchar(40) null,
----MajorInstrument2 nvarchar(40) null,
--Photo1  nvarchar(80) null,
--Photo2  nvarchar(80) null,
--ProfilePage  nvarchar(400) null,
--Repertory  nvarchar(200) null,
--EndorsorEmailID1  nvarchar(30) null,
--EndorsorName1  nvarchar(30) null,
--EndorsorComments1  nvarchar(100) null,
--EndorsorEmailID2  nvarchar(30) null,
--EndorsorName2  nvarchar(30) null,
--EndorsorComments2  nvarchar(100) null,
--EndorsorEmailID3  nvarchar(30) null,
--EndorsorName3  nvarchar(30) null,
--EndorsorComments3  nvarchar(100) null,
--EndorsorEmailID4  nvarchar(30) null,
--EndorsorName4  nvarchar(30) null,
--EndorsorComments4  nvarchar(100) null,
--EndorsorEmailID5  nvarchar(30) null,
--EndorsorName5  nvarchar(30) null,
--EndorsorComments5  nvarchar(100) null


--create table lookup.ArtistType(
--ID int not null primary key IDENTITY(1,1),
--Name Nvarchar(100) not null,
--IsActive BIT null
--)

--Insert into lookup.ArtistType(Name)
--values('Composer'),
--('Conductor'),
--('Teacher/Professor'),
--('Student'),
--('Player')

--create table Drived.Artist_ArtistType(
--ID int not null primary key IDENTITY(1,1),
--Artist int FOREIGN KEY REFERENCES [Core].[Artist](ID),
--ArtistTypeID int FOREIGN KEY REFERENCES lookup.ArtistType(ID)
--)


--create table Main.Performance
--(
--ID int not null primary key IDENTITY(1,1),
--PerformanceDate datetime not null,
--PerformanceDay Nvarchar(32) not null,
--PerformanceTitle Nvarchar(64) not null,
--Orchestra Nvarchar(32) not null,
--Location Nvarchar(32) not null,
--ConcertHall Nvarchar(32) not null
--)

--alter table Main.Performance
--add
----UserID int FOREIGN KEY REFERENCES Main.UserCommonTable(ID)
----TimeStamp datetime DEFAULT GETDATE(),
----UserID int FOREIGN KEY REFERENCES Main.UserCommonTable(ID),
----ExpiryDate datetime null
--OrchestraID int FOREIGN KEY REFERENCES [Core].[Orchestra](ID)

--create table Main.PerformanceDetail
--(
--ID int not null primary key IDENTITY(1,1),
--PerformanceID int FOREIGN KEY REFERENCES Main.Performance(ID),
--Title Nvarchar(128) not null,
--Orchestra Nvarchar(64) not null,
--Instrument Nvarchar(64) not null,
--Conductor Nvarchar(64) not null,
--Player Nvarchar(64) not null,
--Composer Nvarchar(64) not null
--)


select * from Main.Performance