-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













-- [comment omitted]

CREATE PROCEDURE SHPContainer_InsightListPaneData(@internalContainerNum numeric(9) , @culture nvarchar(10))  
AS 
BEGIN

SELECT N'<literal:1>' AS SCALAR, 
	   sc.CONTAINER_ID as ID,
       sc.warehouse as warehouse,
	   dbo.STSfn_RtrvStsName(N'<literal:2>' ,sc.STATUS) AS Status,
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
	   CASE WHEN I.SERIAL_NUM_TRACKING >= 4 THEN N'<literal:3>' ELSE N'<literal:4>' END AS HasSerialNumbers,
	   I.CATCH_WEIGHT_REQD AS HasCatchWeights,
	   sc.PARENT_CONTAINER_ID as ParentContainerId,
	   sc.QC_STATUS as QcStatus
       FROM SHIPPING_CONTAINER sc
	   left outer join LOT l ON SC.ITEM = l.ITEM AND SC.LOT = l.LOT AND ((SC.COMPANY IS NULL AND l.COMPANY IS NULL) OR SC.COMPANY = l.COMPANY)
       left outer join SHIPMENT_HEADER sh on sc.INTERNAL_SHIPMENT_NUM = sh.INTERNAL_SHIPMENT_NUM
	   LEFT OUTER JOIN ITEM i
	   ON (sc.ITEM = i.ITEM AND (sc.COMPANY = i.COMPANY OR (sc.COMPANY IS NULL AND i.COMPANY IS NULL) OR (i.COMPANY IS NULL))) -- [comment omitted]
       WHERE sc.INTERNAL_CONTAINER_NUM= @internalContainerNum;

		-- [comment omitted]
		;WITH NestedContainerTreeList AS(
        SELECT  INTERNAL_CONTAINER_NUM, PARENT
        FROM    SHIPPING_CONTAINER
        WHERE   INTERNAL_CONTAINER_NUM = @internalContainerNum 
        UNION ALL
        SELECT  c.INTERNAL_CONTAINER_NUM, c.PARENT
        FROM    SHIPPING_CONTAINER c INNER JOIN
                NestedContainerTreeList t ON c.PARENT = t.INTERNAL_CONTAINER_NUM
)

SELECT	N'<literal:5>' AS SCALAR, 
		count(internal_instruction_num) AS WorkInstructions
		FROM WORK_INSTRUCTION WI WHERE CONDITION <> N'<literal:6>' 
		AND INSTRUCTION_TYPE = N'<literal:7>'
		AND INTERNAL_NUM_TYPE IN (N'<literal:8>',N'<literal:9>')
		AND INTERNAL_CONTAINER_NUM IN
		(SELECT internal_container_num FROM NestedContainerTreeList)


SELECT	N'<literal:10>' AS SCALAR, 
		count(sc.INTERNAL_CONTAINER_NUM) AS Transactions
		FROM SHIPPING_CONTAINER sc 
		inner join SHIPMENT_HEADER sh
		ON sc.Internal_shipment_num = sh.INTERNAL_SHIPMENT_NUM
		inner  join TRANSACTION_HISTORY th
		on sc.CONTAINER_ID = th.CONTAINER_ID
		AND th.REFERENCE_ID = sh.SHIPMENT_ID
		AND sc.warehouse = th.warehouse
		WHERE sc.INTERNAL_CONTAINER_NUM = @internalContainerNum;


SELECT	N'<literal:11>' AS SCALAR, 
		count(sc.INTERNAL_CONTAINER_NUM) AS ChildContainerCount
		FROM SHIPPING_CONTAINER sc 
		WHERE sc.PARENT = @internalContainerNum
		AND SC.CONTAINER_TYPE <> N'<literal:12>';

SELECT	N'<literal:13>' AS SCALAR, 
		count(sc.INTERNAL_CONTAINER_NUM) AS ContentsCount
		FROM SHIPPING_CONTAINER sc 
		WHERE sc.PARENT = @internalContainerNum
		AND SC.CONTAINER_TYPE = N'<literal:14>';

END