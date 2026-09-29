-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
   
/* [comment omitted] */



      
      
CREATE PROCEDURE CancelWave_UpdateShipLdSts(@launchNum numeric(9) )        
as        
begin        
        
declare @LoadNum numeric(9)       
declare @LeadingStatus  numeric(3)            
declare @TrailingStatus numeric(3)        
declare @LoopId int 
   
DECLARE @LOAD_TABLE TABLE 
(
	LoopId  int  not null  identity(1,1) ,
	SHIPPING_LOAD_NUM    numeric(9)  not null 
)    
	
	insert into @LOAD_TABLE(SHIPPING_LOAD_NUM) 
			select distinct SHIPPING_LOAD_NUM 
			from SHIPMENT_HEADER 
			where Launch_Num=@launchNum   
			and SHIPPING_LOAD_NUM > 0   
		 
	SELECT @LoopId = COUNT(*) from @LOAD_TABLE    
            
	WHILE(@LoopId > 0)       
		BEGIN  
				select  @LoadNum=  SHIPPING_LOAD_NUM from  @LOAD_TABLE 
				where  LoopId = @LoopId  
				
				SELECT	@LeadingStatus=	 max(SH.LEADING_STS), 
						@TrailingStatus=min(SH.TRAILING_STS) 	
						FROM SHIPMENT_HEADER SH 
						where sh.shipping_load_num=@LoadNum                
						AND SH.INTERNAL_SHIPMENT_NUM NOT IN        
						(               
							SELECT INTERNAL_SHIPMENT_NUM FROM SHIPMENT_HEADER 
							WHERE Launch_Num = @launchNum         
						)    
				                    
			if ((@LeadingStatus  > 0) and (@TrailingStatus > 0))    
			begin 	    
						UPDATE SHIPPING_LOAD 
						SET LEADING_STS=@LeadingStatus,
						TRAILING_STS=@TrailingStatus 
						where INTERNAL_LOAD_NUM=@LoadNum 
			End
			set  @LoopId =@LoopId -1    
		           
		END  
		
	UPDATE Shipment_Header 
	SET Shipping_Load_Num = null 
	WHERE Launch_Num = @launchNum    
	and SHIPPING_LOAD_NUM > 0     
end 
