



--select * from Main.UserCommonTable


--select * from Core.Artist a where a.UserID=55

--select * from Drived.Artist_Instrument where ArtistID=67


--select * from Main.UserCommonTable

--delete  Main.UserCommonTable where ID <10


----select  FK__User_User__UserI__395884C4

--select * from Drived.User_UserType

--delete Drived.User_UserType


--select * from Main.Performance

--delete Main.Performance


--delete Main.PerformanceDetail

--delete Main.UserCompany

--delete Main.UserPersonalInfo


--select * from Core.Artist where UserID is not null

--delete  Core.Artist where ID in ( select ID from Core.Artist where UserID is not null)


--delete Drived.Artist_Instrument where ArtistID in ( select ID from Core.Artist where UserID is not null)


--select * from Core.Orchestra

--delete Core.Orchestra where ID = 12