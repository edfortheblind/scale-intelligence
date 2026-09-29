-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





  

CREATE procedure CompleteWave_UpdateShipLdSts(  
        @InternalLoadNum numeric(9),  
 @TrailingStatus numeric(3),  
 @LeadingStatus numeric(3),  
        @UserStamp nvarchar(30),  
        @ProcessStamp nvarchar(100))  
as  
begin
	declare @OldLeadingStatus numeric(3)
	declare @OldTrailingStatus numeric(3)
	select @OldLeadingStatus=Leading_Sts ,@OldTrailingStatus=Trailing_Sts from Shipping_Load where Internal_Load_num = @InternalLoadNum  	
		 update Shipping_Load  
				set   
				Trailing_Sts = case when @TrailingStatus < @OldTrailingStatus then @TrailingStatus
									when @TrailingStatus > @OldTrailingStatus and @OldTrailingStatus <=201 then @TrailingStatus								
									else @OldTrailingStatus
									end,
				Leading_Sts = case when @LeadingStatus > @OldLeadingStatus then @LeadingStatus									
									else @OldLeadingStatus
									end  ,
				User_Stamp = @UserStamp,  
				Process_Stamp = @ProcessStamp,  
				Date_Time_Stamp = GETUTCDATE()   
		 where Internal_Load_num = @InternalLoadNum  
  
  end


