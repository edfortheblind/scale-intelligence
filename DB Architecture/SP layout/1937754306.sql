/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	185487	| SSD	| 09/18/16	| Created
	191074	| DN	| 01/23/17	| Updated parameter types
	204697  | RS    | 05/02/17  | Added select statements to fetch related work items and transactions.
	207780	| TDA	| 07/10/17	| Added item information
	207678	| MMM	| 07/15/17	| Added serial number and catch weight related information
	211054	| MMM	| 09/12/17	| Added ChildContainerCount and corrected work count query
	205324	| MMM	| 09/14/17	| Modified work count query to consider multilevel container nesting heirarchy 
	213203	| MK	| 10/10/17	| Added QC Status.    
	213848	| MMM	| 10/19/17	| Added ContentsCount.
	263089	| MGK	| 01/28/21	| Modified to handle when item master has no company but shipment is created with company
*/
-- Get Data for SHPContainer_InsightListPaneData which internal convert into JSON and send to client

CREATE PROCEDURE SHPContainer_InsightListPaneData(@internalContainerNum numeric(9) , @culture nvarchar(10))  
AS 
BEGIN

SELECT N'SCALAR' AS SCALAR, 
	   sc.CONTAINER_ID as ID,
       sc.warehouse as warehouse,
	   dbo.STSfn_RtrvStsName(N'outbound' ,sc.STATUS) AS Status,
       sc.INTERNAL_CONTAINER_NUM as InternalContainerNumber,
       sc.INTERNAL_SHIPMENT_NUM as InternalShipmentNumber,
	   sc.Parent as Parent,
       sh.SHIPMENT_ID AS ShipmentID,
	   sc.ITEM as Item,
	   sc.COMPANY as Company,
	   i.DESCRIPTION as ItemDesc,
	   i.WEB_THUMBNAIL_IMG AS WebThumbnailImage,
	   sc.Quantity,
	   sc.QUANTITY_UM as QuantityUm,
	   sc.Lot,
	   l.EXPIRATION_DATE as LotExpirationDate,
	   CASE WHEN I.SERIAL_NUM_TRACKING >= 4 THEN N'Y' ELSE N'N' END AS HasSerialNumbers,
	   I.CATCH_WEIGHT_REQD AS HasCatchWeights,
	   sc.PARENT_CONTAINER_ID as ParentContainerId,
	   sc.QC_STATUS as QcStatus
       FROM SHIPPING_CONTAINER sc
	   left outer join LOT l ON SC.ITEM = l.ITEM AND SC.LOT = l.LOT AND ((SC.COMPANY IS NULL AND l.COMPANY IS NULL) OR SC.COMPANY = l.COMPANY)
       left outer join SHIPMENT_HEADER sh on sc.INTERNAL_SHIPMENT_NUM = sh.INTERNAL_SHIPMENT_NUM
	   LEFT OUTER JOIN ITEM i
	   ON (sc.ITEM = i.ITEM AND (sc.COMPANY = i.COMPANY OR (sc.COMPANY IS NULL AND i.COMPANY IS NULL) OR (i.COMPANY IS NULL))) --if i.company is null not checked then when item master is without company and shipment has company then we get null for all the columns from item table due to left join
       WHERE sc.INTERNAL_CONTAINER_NUM= @internalContainerNum;

		-- Get all the nested container list
		;WITH NestedContainerTreeList AS(
        SELECT  INTERNAL_CONTAINER_NUM, PARENT
        FROM    SHIPPING_CONTAINER
        WHERE   INTERNAL_CONTAINER_NUM = @internalContainerNum 
        UNION ALL
        SELECT  c.INTERNAL_CONTAINER_NUM, c.PARENT
        FROM    SHIPPING_CONTAINER c INNER JOIN
                NestedContainerTreeList t ON c.PARENT = t.INTERNAL_CONTAINER_NUM
)

SELECT	N'SCALAR' AS SCALAR, 
		count(internal_instruction_num) AS WorkInstructions
		FROM WORK_INSTRUCTION WI WHERE CONDITION <> N'Closed' 
		AND INSTRUCTION_TYPE = N'Detail'
		AND INTERNAL_NUM_TYPE IN (N'Shipment',N'Dock Management')
		AND INTERNAL_CONTAINER_NUM IN
		(SELECT internal_container_num FROM NestedContainerTreeList)


SELECT	N'SCALAR' AS SCALAR, 
		count(sc.INTERNAL_CONTAINER_NUM) AS Transactions
		FROM SHIPPING_CONTAINER sc 
		inner join SHIPMENT_HEADER sh
		ON sc.Internal_shipment_num = sh.INTERNAL_SHIPMENT_NUM
		inner  join TRANSACTION_HISTORY th
		on sc.CONTAINER_ID = th.CONTAINER_ID
		AND th.REFERENCE_ID = sh.SHIPMENT_ID
		AND sc.warehouse = th.warehouse
		WHERE sc.INTERNAL_CONTAINER_NUM = @internalContainerNum;


SELECT	N'SCALAR' AS SCALAR, 
		count(sc.INTERNAL_CONTAINER_NUM) AS ChildContainerCount
		FROM SHIPPING_CONTAINER sc 
		WHERE sc.PARENT = @internalContainerNum
		AND SC.CONTAINER_TYPE <> N'-';

SELECT	N'SCALAR' AS SCALAR, 
		count(sc.INTERNAL_CONTAINER_NUM) AS ContentsCount
		FROM SHIPPING_CONTAINER sc 
		WHERE sc.PARENT = @internalContainerNum
		AND SC.CONTAINER_TYPE = N'-';

END