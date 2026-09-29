-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









  
  
CREATE PROCEDURE CancelWave_UpdateOrderHeader(@launchNum numeric(9) )        
AS        
BEGIN  

declare @loopId int 
declare @internalShipmentNum numeric(9)

-- [comment omitted]
-- [comment omitted]
DECLARE @shipmentsInLaunch TABLE 
(
	LOOPID  int  not null  identity(1,1) ,
	INTERNAL_SHIPMENT_NUMBER numeric(9) 	
) 

INSERT INTO @shipmentsInLaunch(INTERNAL_SHIPMENT_NUMBER) 
SELECT INTERNAL_SHIPMENT_NUM  
	FROM SHIPMENT_HEADER 
	WHERE LAUNCH_NUM =@launchNum  

-- [comment omitted]
SELECT @loopId = COUNT(*) from @ShipmentsInLaunch 
	
WHILE(@loopId > 0)       
	BEGIN  
		SELECT @internalShipmentNum = INTERNAL_SHIPMENT_NUMBER 
			FROM @shipmentsInLaunch 
			WHERE LOOPID =@loopId
		-- [comment omitted]
		exec CancelShipment_UpdateOrderHeader @internalShipmentNum
						
		SET  @loopId =@loopId -1  			           
	END                                  
 
END