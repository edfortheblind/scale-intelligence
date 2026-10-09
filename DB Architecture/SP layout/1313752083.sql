/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_PICK_PUT_INBOUND_EXT

*/

--SCI Proc 15 : SCI_PICK_PUT_INBOUND_EXT

CREATE PROCEDURE SCI_PICK_PUT_INBOUND_EXT
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select     th.internal_id as pick_put_id,      rh.receipt_type,      rh.source_id,      rh.source_name,      rh.source_city,      rh.source_state,      rh.source_postal_code  from     transaction_history th with (nolock)  inner join work_instruction_view wi with (nolock)  on wi.internal_instruction_num = th.internal_key_id     and wi.internal_num_type = N'Receipt' inner join receipt_header rh with (nolock)  on rh.internal_receipt_num = wi.internal_num  where     ((th.transaction_type in (N'130' ,      N'120')      and th.direction = N'From')  or (th.transaction_type in (N'140',      N'120')      and th.direction = N'To') ) AND th.activity_date_time > @StartTime AND th.activity_date_time <= @EndTime
END
;

