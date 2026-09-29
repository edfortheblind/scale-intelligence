-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








  

CREATE PROCEDURE CancelShipment_UpdateOrderHeader(@internalShipmentNum numeric(9) )        
AS        
BEGIN  
	declare @shippingLoadNum numeric(9)
	declare @internalOrderNumber numeric(9)       
	declare @containersShipped  numeric(9)            
	declare @weightShipped numeric(19,5)   
	declare @volumeShipped numeric(19,5)   
	declare @valueShipped  numeric(19,5)   

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	
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
			
			-- [comment omitted]
			update ORDER_HEADER 
			set TOTAL_SHIPMENTS = TOTAL_SHIPMENTS  -1,
				CONTAINERS_SHIPPED = CONTAINERS_SHIPPED - @containersShipped ,
				WEIGHT_SHIPPED = WEIGHT_SHIPPED - @weightShipped ,
				VOLUME_SHIPPED = VOLUME_SHIPPED - @volumeShipped,
				VALUE_SHIPPED = VALUE_SHIPPED - @valueShipped
				where INTERNAL_ORDER_NUM = @internalOrderNumber
	end
		
		
END

