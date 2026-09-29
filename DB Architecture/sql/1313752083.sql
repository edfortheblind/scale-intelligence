-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






-- [comment omitted]

CREATE PROCEDURE SCI_PICK_PUT_INBOUND_EXT
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select     th.internal_id as pick_put_id,      rh.receipt_type,      rh.source_id,      rh.source_name,      rh.source_city,      rh.source_state,      rh.source_postal_code  from     transaction_history th with (nolock)  inner join work_instruction_view wi with (nolock)  on wi.internal_instruction_num = th.internal_key_id     and wi.internal_num_type = N'<literal:1>' inner join receipt_header rh with (nolock)  on rh.internal_receipt_num = wi.internal_num  where     ((th.transaction_type in (N'<literal:2>' ,      N'<literal:3>')      and th.direction = N'<literal:4>')  or (th.transaction_type in (N'<literal:5>',      N'<literal:6>')      and th.direction = N'<literal:7>') ) AND th.activity_date_time > @StartTime AND th.activity_date_time <= @EndTime
END
;

