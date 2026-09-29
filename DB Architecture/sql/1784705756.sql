-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











   
  
CREATE FUNCTION IsWorkZoneAuthorized  
(  
	@workProfile nvarchar(25), 
	@workZone nvarchar(25)
)  
RETURNS bit					-- [comment omitted]
AS  
BEGIN
	
	declare @isAuthorized bit=0;
	
	IF(@workZone is NULL)
		set @isAuthorized = 1;
	Else
		select @isAuthorized = 1 FROM WORK_PROFILE_ZONE_AUTH WHERE WORK_PROFILE = @workProfile AND ZONE = @workZone;
     
	RETURN @isAuthorized;
END  
   
   