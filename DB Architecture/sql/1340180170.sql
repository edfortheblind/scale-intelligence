-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure CompleteWave_UpdateOdrHdrCond(
        @InternalOrderNum numeric(9),
	@Condition nvarchar(25),
        @UserStamp nvarchar(30),
        @ProcessStamp nvarchar(100))


as
	update Order_Header
        set 
        Condition = @Condition,
        User_Stamp = @UserStamp,
        Process_Stamp = @ProcessStamp,
        Date_Time_Stamp = GETUTCDATE(),
		CONDITION_DATE_TIME = GETUTCDATE() 
	where Internal_Order_num = @InternalOrderNum
  





