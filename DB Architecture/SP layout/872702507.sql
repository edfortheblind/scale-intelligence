/*
	Mod Number	| Programmer	| Date   	  | Modification Description
	----------------------------------------------------------------------
	12468		| NRJ			| 08/12/2022  | Created
*/

/*this SP is created to populate the data model for consolidation after putaway screen*/
CREATE PROCEDURE GetConsolidateAfterPutaway
 (
 @ContainerId nvarchar(25),
 @warehouse nvarchar(25)
 )
AS

 SET NOCOUNT ON;
 BEGIN 
	DECLARE @internalShipmentNum numeric(9);

	SELECT TOP 1 @internalShipmentNum=INTERNAL_SHIPMENT_NUM 
	FROM SHIPPING_CONTAINER WHERE CONTAINER_ID=@ContainerId;

 IF(@internalShipmentNum is not null)
	 BEGIN		
		SELECT
            SH.CARRIER, 
            SH.SHIPMENT_ID, 
            SH.SHIPPING_LOAD_NUM, 
            SH.SHIP_TO_NAME,            
            CA.CONSOLIDATION_DOCK_LOC_AREA,
            SH.SHIP_TO AS ShipTo,
            Containers.Num_Parent_Containers AS NumOfParentContainers,
			(SELECT COUNT(*)
				FROM SHIPPING_CONTAINER SC
				WHERE SC.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM
				AND SC.warehouse = SH.warehouse
				AND SC.STATUS > 400 AND PARENT is null) AS CurrentContainerCount
        FROM
            SHIPMENT_HEADER SH 
            LEFT JOIN 
            CARRIER CA ON ((SH.CARRIER=CA.CARRIER OR (SH.CARRIER IS NULL AND CA.CARRIER IS NULL)) AND
			               (SH.CARRIER_SERVICE=CA.SERVICE OR (SH.CARRIER_SERVICE IS NULL AND CA.SERVICE Is null)))
            Inner join
            (
              SELECT
                 INTERNAL_SHIPMENT_NUM,
                  COUNT(*)  Num_Parent_Containers
              FROM
                 SHIPPING_CONTAINER
              WHERE
                 PARENT is null
              GROUP BY
                 INTERNAL_SHIPMENT_NUM
           )  Containers on Containers.INTERNAL_SHIPMENT_NUM=SH.INTERNAL_SHIPMENT_NUM  
        WHERE           
           SH.INTERNAL_SHIPMENT_NUM = @internalShipmentNum
           AND SH.WAREHOUSE = @warehouse
           AND SH.INTERNAL_SHIPMENT_NUM = Containers.INTERNAL_SHIPMENT_NUM;        
	 END	
 END