/*              
 Mod Number | Programmer	| Date     | Modification Description              
 --------------------------------------------------------------------              
 163941		| SHS			| 07/23/15 | Created    
 191074		| DN			| 01/23/17 | Updated parameter types    
 184682		| PMB			| 07/10/20 | Modified to return @isAuthorized true when work zone is null.
      
 Function to check if given work profile is authorized for the given work zone. 
      
Parameters:
 @workProfile				- Work profile
 @workZone					- Work zone   
*/   
  
CREATE FUNCTION IsWorkZoneAuthorized  
(  
	@workProfile nvarchar(25), 
	@workZone nvarchar(25)
)  
RETURNS bit					-- Flag to indicate is work profile authorized to work zone
AS  
BEGIN
	
	declare @isAuthorized bit=0;
	
	IF(@workZone is NULL)
		set @isAuthorized = 1;
	Else
		select @isAuthorized = 1 FROM WORK_PROFILE_ZONE_AUTH WHERE WORK_PROFILE = @workProfile AND ZONE = @workZone;
     
	RETURN @isAuthorized;
END  
   
   