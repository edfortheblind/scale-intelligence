/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
 140413     | NVS           | 04/23/14      | Change item length to 50
 180238		| MK			| 07/01/16		| Changed to select item with specified or without company
 191074		| DN			| 10/25/16		| Updated parameter type
*/   


CREATE PROCEDURE wm_RItem07
	@Item nvarchar(50),
	@Company nvarchar(25)
AS
	SELECT * FROM ITEM
	WHERE ITEM = @Item
	AND (COMPANY = @Company OR COMPANY IS NULL)

