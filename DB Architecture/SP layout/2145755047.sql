/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	10202	| AU	| 05/09/22	| Created.
*/

CREATE PROCEDURE TD_InsightDetailPaneData(@objectId numeric(9),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
td.OBJECT_ID as ObjectId,
td.COMPANY as Company,
td.ITEM as Item,
td.PUT_WALL_LOCATION as PutwallLoc

FROM TOTE_DETAIL td where td.OBJECT_ID=@objectId;

SELECT	N'SCALAR' AS SCALAR, 
th.TOTE_ID as ToteId
from TOTE_HEADER th where th.OBJECT_ID=@objectId;

END
