


select * from Main.PerformanceDetail pd
join Drived.PerformanceDetail_Instrument_Artist pai on pai.PerformanceDetailID=pd.ID





select  * from(
select pia.PerformanceDetailID, i.EnglishName,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
 from Drived.PerformanceDetail_Instrument_Artist pia 
join Core.Artist a on a.ID = pia.ArtistID
join Core.Instrument i on i.ID = pia.InstrumentID
) x

--Group by PerformanceDetailID, FirstName,FamilyName,MiddleName


select * from(
select  distinct x.Name , x.instrument PerformanceDetailID from(
select pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
 from Drived.PerformanceDetail_Instrument_Artist pia 
join Core.Artist a on a.ID = pia.ArtistID
join Core.Instrument i on i.ID = pia.InstrumentID
) x
)y
group by PerformanceDetailID,Name


--DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
--DECLARE @ColumnName AS NVARCHAR(MAX)
 
----Get distinct values of the PIVOT Column 
--SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
--       + QUOTENAME(Name)
--FROM (
--select  distinct x.Name , x.instrument PerformanceDetailID from(
--select pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
-- from Drived.PerformanceDetail_Instrument_Artist pia 
--join Core.Artist a on a.ID = pia.ArtistID
--join Core.Instrument i on i.ID = pia.InstrumentID
--) x
--) AS Courses

--group by PerformanceDetailID

--select @ColumnName

select PerformanceDetailID, STUFF from(

select  distinct PerformanceDetailID, x.Name , x.instrument  from(
select pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
 from Drived.PerformanceDetail_Instrument_Artist pia 
join Core.Artist a on a.ID = pia.ArtistID
join Core.Instrument i on i.ID = pia.InstrumentID
) x

) y




SELECT
     PerformanceDetailID,
     STUFF(
         (SELECT ',' + Name, ','+ instrument
          FROM (
select pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
 from Drived.PerformanceDetail_Instrument_Artist pia 
join Core.Artist a on a.ID = pia.ArtistID
join Core.Instrument i on i.ID = pia.InstrumentID
) x
where x.PerformanceDetailID= a.PerformanceDetailID
          FOR XML PATH (''))
          , 1, 1, '')  AS NameList,

     STUFF(
         (SELECT ','+ instrument
          FROM (
select pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
 from Drived.PerformanceDetail_Instrument_Artist pia 
join Core.Artist a on a.ID = pia.ArtistID
join Core.Instrument i on i.ID = pia.InstrumentID
) x
where x.PerformanceDetailID= a.PerformanceDetailID
          FOR XML PATH (''))
          , 1, 1, '')  AS instrumentList

FROM Drived.PerformanceDetail_Instrument_Artist AS a
GROUP BY PerformanceDetailID




select pd.ID, p.PerformanceTitle,pd.Title,
(c.FirstName + ' '+ c.MiddleName + ' '+ c.FamilyName) as Conductor,
(co.FirstName + ' '+ co.MiddleName + ' '+ co.FamilyName) as Composer,
list.Artists,list.Artists,
pd.Time from Main.PerformanceDetail pd
join Core.Orchestra o on pd.Orchestra=o.ID
join Main.Performance p on p.ID=pd.PerformanceID
join  (select a.* from Core.Artist a 
		join Drived.Artist_ArtistType at on a.ID= at.Artist
		join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		where al.Name like '%Conductor%') c on c.ID= pd.Conductor
join  (select a.* from Core.Artist a 
		join Drived.Artist_ArtistType at on a.ID= at.Artist
		join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		where al.Name like '%Composer%') co on co.ID= pd.Composer
join(
		SELECT
			 PerformanceDetailID,
			 STUFF(
				 (SELECT ',' + Name, ','+ instrument
				  FROM (
		select pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
		 from Drived.PerformanceDetail_Instrument_Artist pia 
		join Core.Artist a on a.ID = pia.ArtistID
		join Core.Instrument i on i.ID = pia.InstrumentID
		) x
		where x.PerformanceDetailID= a.PerformanceDetailID
				  FOR XML PATH (''))
				  , 1, 1, '')  AS Artists,

			 STUFF(
				 (SELECT ','+ instrument
				  FROM (
		select pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
		 from Drived.PerformanceDetail_Instrument_Artist pia 
		join Core.Artist a on a.ID = pia.ArtistID
		join Core.Instrument i on i.ID = pia.InstrumentID
		) x
		where x.PerformanceDetailID= a.PerformanceDetailID
				  FOR XML PATH (''))
				  , 1, 1, '')  AS Instruments

		FROM Drived.PerformanceDetail_Instrument_Artist AS a
		GROUP BY PerformanceDetailID

) list on pd.ID = list.PerformanceDetailID
 