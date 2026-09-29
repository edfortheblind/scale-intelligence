-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure CompleteWave_UpdateContSts(
        @InternalContainerNum numeric(9),
	@Status numeric(3),
        @UserStamp nvarchar(30),
        @ProcessStamp nvarchar(100))
as
	update Shipping_Container
        set status = @Status,
        User_Stamp = @UserStamp,
        Process_Stamp = @ProcessStamp,
        Date_Time_Stamp = GETUTCDATE() 
	where Internal_Container_num = @InternalContainerNum



