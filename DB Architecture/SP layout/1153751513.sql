/*    
 TASK | BY | DATE  | MODIFICATION DESCRIPTION    
 --------------------------------------------------------------------    
 48201 | NRJ | 06/23/25 | CREATED     
*/        

CREATE PROCEDURE SaveUserLastActivityEndTime
@userName	nvarchar(30),
@lastActivityEndTime	datetime
AS      
BEGIN    

    SET NOCOUNT ON;
    
	IF EXISTS (SELECT 1 FROM USER_LAST_ACTIVITY WHERE USER_NAME = @userName)
    BEGIN
        UPDATE USER_LAST_ACTIVITY SET LAST_ACTIVITY_END_TIME = @lastActivityEndTime,DATE_TIME_STAMP=GETUTCDATE() WHERE USER_NAME = @userName
    END
    ELSE
    BEGIN
        INSERT INTO USER_LAST_ACTIVITY (USER_NAME, LAST_ACTIVITY_END_TIME,DATE_TIME_STAMP) VALUES (@userName, @lastActivityEndTime,GETUTCDATE())
    END
           
END