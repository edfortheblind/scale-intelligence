-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE procedure CompleteWave_UpdateHdrSts(
        @InternalShipmentNum numeric(9),
	@TrailingStatus numeric(3),
	@LeadingStatus numeric(3),
        @UserStamp nvarchar(30),
        @ProcessStamp nvarchar(100))
as
	update Shipment_Header
        set 

        trailing_sts = case when @TrailingStatus  > 0 then 
                                 @trailingstatus
                       else trailing_sts
                       end,

        trailing_sts_date = case when @TrailingStatus  > 0 then 
                            convert(date,dbo.GetWarehouseTimezoneValue(SHIPMENT_HEADER.warehouse,null))
                           else trailing_sts_date
                           end,


        Leading_Sts = case when @LeadingStatus > 0 then    
                                @LeadingStatus
                      else Leading_Sts
                      end,


        Leading_Sts_Date = case when @LeadingStatus > 0 then    
                            convert(date,dbo.GetWarehouseTimezoneValue(SHIPMENT_HEADER.warehouse,null))
                           else Leading_Sts_Date
                           end,


        User_Stamp = @UserStamp,
        Process_Stamp = @ProcessStamp,
        Date_Time_Stamp = GETUTCDATE()
 

	where Internal_Shipment_num = @InternalShipmentNum






