/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
 140413     | NVS           | 04/23/14      | Change item length to 50
 191074		| DN			| 10/25/16		| Updated parameter type
*/   


CREATE PROCEDURE wm_RItemCrossReference03
	@Item nvarchar(50),
	@Company nvarchar(25)
AS
	SELECT * FROM ITEM_CROSS_REFERENCE
	WHERE ITEM = @Item
	AND IsNull(COMPANY,N'*') = IsNull(@COMPANY,N'*')

