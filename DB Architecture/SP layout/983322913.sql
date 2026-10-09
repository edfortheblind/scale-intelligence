/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
 140413     | NVS           | 04/23/14      | Change item length to 50

*/   

CREATE PROCEDURE wm_RItem03
	@Item nvarchar(50)
AS
	SELECT * FROM ITEM
	WHERE ITEM = @Item
	AND COMPANY IN(
		SELECT COMPANY FROM ITEM
		WHERE ITEM = @Item
		GROUP BY COMPANY
		HAVING COUNT(DISTINCT COMPANY) = 1)

