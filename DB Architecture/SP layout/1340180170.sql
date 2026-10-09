/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16851		| RLG			| 06/17/05	| created
*/


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
  





