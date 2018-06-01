


--create database OrchestraDB
--use OrchestraDB
--create schema Core

--drop table Core.Orchestra

--create table Core.Orchestra(
--ID int not null primary key IDENTITY(1,1),
--OfficialName nvarchar(200) not null,
--Alias nvarchar(200) null,
--URL nvarchar(200) null,
--[Address] nvarchar(200) null,
--ZipCode nvarchar(10) null,
--TelNO nvarchar(50) null,
--FaxNo nvarchar(50) null,
--ConductorName nvarchar(100) null,
--Since int null
--)

--select * from Core.Orchestra

--insert into Core.Orchestra (OfficialName) values('henock')

--drop table Core.Instrument

--create table Core.Instrument(
--ID int not null primary key IDENTITY(1,1),
--EnglishName varchar(200) not null,
--KoreanName nvarchar(200) not null,
--Alias nvarchar(200) null,
--Player nvarchar(200) null,
--[Group] nvarchar(200) null,
--Explanation nvarchar(1000) null,
--SoundClipLocation nvarchar(200) null,
--VideoClipLocation nvarchar(200) null,
--PhotoLocation nvarchar(200) null,
--Remarks nvarchar(200) null
--) 

--insert into Core.Instrument (EnglishName,KoreanName) values('henock','henock')

--select * from  Core.Instrument

--drop table Core.Artist

--create table Core.Artist(
--ID int not null primary key IDENTITY(1,1),
--FirstName varchar(200) not null,
--FamilyName varchar(200) not null,
--MiddleName varchar(200)  null,
--BirthDate date not null,
--[Address] nvarchar(200) null,
--ZipCode nvarchar(10) null,
--TelNO nvarchar(50) null,
--MobileNO nvarchar(50) null,
--FaxNo nvarchar(50) null,
--Remar nvarchar(2000) null,
--)


--insert into Core.Artist (FirstName,FamilyName,BirthDate) values('henock','henock','1991-12-12')

--select * from  Core.Artist

--drop table Core.[User]

--create table Core.[User](
--ID int not null primary key IDENTITY(1,1),
--EnglishName varchar(200) null,
--KoreanName nvarchar(200) null,
--UserID nvarchar(200) not null UNIQUE,
--[Password] nvarchar(200) not null,
--Email nvarchar(100) not null,
--Address nvarchar(100) not null,
--ZipCode nvarchar(10) null,
--)

--drop table Core.Bulletin

--create table Core.Bulletin(
--ID int not null primary key IDENTITY(1,1),
--MSG varchar(200) null,
--URL varchar(200) null,
--ImageUrl varchar(200) null,
--TimeStamp datetime DEFAULT GETDATE()
--)

insert into Core.bulletin(MSG,URL,ImageUrl)
values( 'test','test','test')
