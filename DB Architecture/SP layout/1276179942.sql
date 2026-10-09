/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16851		| RLG			| 06/16/05	| created
*/


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



