/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16851		| RLG			| 06/16/05	| created
*/


CREATE procedure CompleteWave_UpdateDtlSts(
        @InternalShipmentLineNum numeric(9),
	@Status1 numeric(3),
        @UserStamp nvarchar(30),
        @ProcessStamp nvarchar(100))
as
	update Shipment_Detail
        set Status1 = @Status1,
        User_Stamp = @UserStamp,
        Process_Stamp = @ProcessStamp,
        Date_Time_Stamp = GETUTCDATE() 
        where Internal_Shipment_Line_num = @InternalShipmentLineNum




