
 /*--Mod Number 	| Programer	| Date	    | Modification Description
 -------------------|-----------|-----------|-------------------------
		160888      | AH        | 05/05/15  | Created.
		162884		| DN		| 07/20/15	| Added Internal Request number to the scalar table
		165883      | AH		| 08/27/15	| Updated resources key for date time stamp
		185901		| SSD		| 09/12/16	| Added WebThumbnailImage to SCALAR table.
		204348		| SAM		| 04/26/17	| removed dbo
		209524		| TDA		| 07/12/17	| Added ItemDesc and Company
*/


CREATE PROCEDURE IN_InsightDetailPaneData(@internalrequestnum numeric(9),@culture nvarchar(10))  
AS 
BEGIN

select * INTO #tempIN
FROM IMMEDIATE_NEEDS_REQUEST
WHERE INTERNAL_REQUEST_NUM= @internalrequestnum;

SELECT top 1 N'SCALAR' AS SCALAR,
             temp.INTERNAL_REQUEST_NUM	as Internalrequestnumber,	           
             temp.ITEM					as Item,
			 i.DESCRIPTION				as ItemDesc,
			 i.COMPANY					as Company,
			 i.WEB_THUMBNAIL_IMG		as WebThumbnailImage
FROM #tempIN temp LEFT OUTER JOIN ITEM i on temp.Item = i.ITEM AND (temp.Company = i.COMPANY OR (temp.Company IS NULL AND i.COMPANY IS NULL));

END