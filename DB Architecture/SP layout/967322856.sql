/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
 140413     | NVS           | 04/23/14      | Change item length to 50
 150539		| DN			| 02/17/15		| Modified to check input company parameter also
*/   

CREATE PROCEDURE wm_RItem02
	@Item nvarchar(50),
	@Company nvarchar(25)
AS
	SELECT * FROM ITEM
	WHERE ITEM = @Item
	AND (COMPANY = @Company OR (COMPANY IS NULL AND @Company IS NULL))

