/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	140149	| MDL	| 04/14/14	| Created
	140148	| MDL	| 04/21/14	| Added new table info.
	140152	| MDL	| 04/22/14	| Added location info.
	140364	| AA	| 04/24/14	| Added InternalInstructionNum column.
	142021	| MDL	| 05/03/14	| Get data from WORK_INSTRUCTION_VIEW.
	134500	| MMM	| 05/05/14	| Added User Defined fields table.
	141896	| SAM	| 05/18/14	| Removed conversion of dates to varchar.
	138907	| MMM	| 05/19/14	| Added Additional Information table, used to format columns.
	142950	| MDL	| 06/03/14	| Converted to handlebar template as helper support needed.
	144816	| MMM	| 09/11/14	| Replaced hardcoded page URLs with place holders 
	185484	| SD	| 09/28/16	| Removed the information related to detailpane accordions.
	191074	| DN	| 01/23/17	| Updated parameter types
	207780	| TDA	| 07/03/17	| Added  Description and thumbnail image
*/

-- Get Data for WRK_InsightDetailPane which internal convert into JSON and send to client

CREATE PROCEDURE WRK_InsightDetailPaneData(@internalinstructionnum numeric(9),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
			 wi.WORK_UNIT		as WorkUnit,
			 wi.WORK_TYPE		as WorkType,
			 wi.FROM_LOC		as FromLocation,
			 wi.TO_LOC			as ToLocation,
			 wi.CONDITION		as Condition,
			 wi.INTERNAL_INSTRUCTION_NUM as InternalInstructionNum,
			 wi.ITEM as Item,
			 wi.COMPANY as Company,
			 wi.ITEM_DESC as ItemDesc,
			 i.WEB_THUMBNAIL_IMG AS WebThumbnailImage
FROM WORK_INSTRUCTION_VIEW wi
LEFT OUTER JOIN ITEM i
ON (wi.ITEM = i.ITEM AND (wi.COMPANY = i.COMPANY OR (wi.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE INTERNAL_INSTRUCTION_NUM= @internalinstructionnum;


END

