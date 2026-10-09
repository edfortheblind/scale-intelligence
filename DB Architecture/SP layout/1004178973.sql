/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
80226        | SPJ       | 02/11/11 |Created  

This SP updates the OrderHeader Table Information when the Wave gets cancelled.

Parameters:
		Int	@launchNum				The LaunchNumber for the request.
    
*/  
  
CREATE PROCEDURE CancelWave_UpdateOrderHeader(@launchNum numeric(9) )        
AS        
BEGIN  

declare @loopId int 
declare @internalShipmentNum numeric(9)

-- Declare a Table variable and store all the InternalShipment Numbers(Shipments) 
-- corresponding to the Launch Number.
DECLARE @shipmentsInLaunch TABLE 
(
	LOOPID  int  not null  identity(1,1) ,
	INTERNAL_SHIPMENT_NUMBER numeric(9) 	
) 

INSERT INTO @shipmentsInLaunch(INTERNAL_SHIPMENT_NUMBER) 
SELECT INTERNAL_SHIPMENT_NUM  
	FROM SHIPMENT_HEADER 
	WHERE LAUNCH_NUM =@launchNum  

-- Loop through each shipments and call "CancelShipment_UpdateOrderHeader" sp to update the OrderHeader Table.	
SELECT @loopId = COUNT(*) from @ShipmentsInLaunch 
	
WHILE(@loopId > 0)       
	BEGIN  
		SELECT @internalShipmentNum = INTERNAL_SHIPMENT_NUMBER 
			FROM @shipmentsInLaunch 
			WHERE LOOPID =@loopId
		-- Call CancelShipment_UpdateOrderHeader to update the OrderHeader Table.
		exec CancelShipment_UpdateOrderHeader @internalShipmentNum
						
		SET  @loopId =@loopId -1  			           
	END                                  
 
END