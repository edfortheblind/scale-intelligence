-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






-- [comment omitted]

CREATE PROCEDURE SCI_PICK_PUT_OUTBOUND_EXT
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select     th.internal_id as pick_put_id,      sh.carrier,      sh.carrier_group,      sh.carrier_service,      sh.carrier_type,      sh.customer,      sh.customer_name,      sh.order_type,      sh.route,      sh.ship_to,      sh.ship_to_name,      sh.ship_to_city,      sh.ship_to_state,      sh.ship_to_postal_code,      sh.ship_to_country,      CAST(null as nvarchar(100) )  user_dimension01,      CAST(null as nvarchar(100) )  user_dimension02,      CAST(null as nvarchar(100) )  user_dimension03,      CAST(null as nvarchar(100) )  user_dimension04,      CAST(null as nvarchar(100) )  user_dimension05,      CAST(null as nvarchar(100) )  user_dimension06,      CAST(null as nvarchar(100) )  user_dimension07,      CAST(null as nvarchar(100) )  user_dimension08,      CAST(null as nvarchar(100) )  user_dimension09,      CAST(null as nvarchar(100) )  user_dimension10,      CAST(null as numeric(28,     5) )  user_fact1,      CAST(null as numeric(28,     5) )  user_fact2,      CAST(null as numeric(28,     5) )  user_fact3,      CAST(null as numeric(28,     5) )  user_fact4,      CAST(null as numeric(28,     5) )  user_fact5  from     transaction_history th with (nolock)  inner join work_instruction_view wi with (nolock)  on wi.internal_instruction_num = th.internal_key_id     and wi.internal_num_type in (N'<literal:1>',      N'<literal:2>')  inner join shipment_header sh with (nolock)  on sh.internal_shipment_num = wi.internal_num  where     ((th.transaction_type in (N'<literal:3>',      N'<literal:4>',      N'<literal:5>')      and th.direction = N'<literal:6>')  or (th.transaction_type in (N'<literal:7>',      N'<literal:8>',      N'<literal:9>')      and th.direction = N'<literal:10>') ) AND th.activity_date_time > @StartTime AND th.activity_date_time <= @EndTime
END
;

