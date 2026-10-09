/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
80226        | SPJ       | 02/11/11 |Created   

This SP updates the OrderHeader Table Information when the shipmet gets cancelled.

Parameters:
		Int	@internalShipmentNum				The InternalShipmentNumber of the Shipment.		  
*/  

CREATE PROCEDURE CancelShipment_UpdateOrderHeader(@internalShipmentNum numeric(9) )        
AS        
BEGIN  
	declare @shippingLoadNum numeric(9)
	declare @internalOrderNumber numeric(9)       
	declare @containersShipped  numeric(9)            
	declare @weightShipped numeric(19,5)   
	declare @volumeShipped numeric(19,5)   
	declare @valueShipped  numeric(19,5)   

	-- Check If the shipment is assigned to Load or Not
	-- And Order is tied to Shipment or Not.
	-- If yes proceed with the Update else Do Nothing.
	
	select 
		@shippingLoadNum = SHIPPING_LOAD_NUM,
		@internalOrderNumber = INTERNAL_ORDER_NUM		 
	from SHIPMENT_HEADER 
	where INTERNAL_SHIPMENT_NUM = @internalShipmentNum

	if(@shippingLoadNum > 0 AND @internalOrderNumber > 0)
	begin
		select 			
			@containersShipped = TOTAL_CONTAINERS ,
			@weightShipped = TOTAL_WEIGHT,
			@volumeShipped = TOTAL_VOLUME,
			@valueShipped = TOTAL_VALUE
			FROM SHIPMENT_HEADER_VIEW
			WHERE INTERNAL_SHIPMENT_NUM = @internalShipmentNum
			
			-- Update the corresponding OrderHeader Table
			update ORDER_HEADER 
			set TOTAL_SHIPMENTS = TOTAL_SHIPMENTS  -1,
				CONTAINERS_SHIPPED = CONTAINERS_SHIPPED - @containersShipped ,
				WEIGHT_SHIPPED = WEIGHT_SHIPPED - @weightShipped ,
				VOLUME_SHIPPED = VOLUME_SHIPPED - @volumeShipped,
				VALUE_SHIPPED = VALUE_SHIPPED - @valueShipped
				where INTERNAL_ORDER_NUM = @internalOrderNumber
	end
		
		
END

