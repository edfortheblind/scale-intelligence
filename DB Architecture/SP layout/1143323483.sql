/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
 140413     | NVS           | 04/23/14      | Change item length to 50

*/   


CREATE PROCEDURE wm_RItemUnitOfMeasure05
	@Item nvarchar(50)
AS
	SELECT * FROM ITEM_UNIT_OF_MEASURE
		WHERE ITEM = @Item
		AND COMPANY IS NOT NULL

