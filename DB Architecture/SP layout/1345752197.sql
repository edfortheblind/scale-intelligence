/*
Mod Number	| Programmer	| Date   	    | Modification Description
----------------------------------------------------------------------------------------------------------------
99501	    | SDas		    | 02/13/2013    | Created SCI Stored Procedure SCI_PICK_PUT_OUTBOUND_EXT

*/

--SCI Proc 16 : SCI_PICK_PUT_OUTBOUND_EXT

CREATE PROCEDURE SCI_PICK_PUT_OUTBOUND_EXT
	@StartTime  datetime,
	@EndTime datetime
AS
BEGIN
SET NOCOUNT ON;
select     th.internal_id as pick_put_id,      sh.carrier,      sh.carrier_group,      sh.carrier_service,      sh.carrier_type,      sh.customer,      sh.customer_name,      sh.order_type,      sh.route,      sh.ship_to,      sh.ship_to_name,      sh.ship_to_city,      sh.ship_to_state,      sh.ship_to_postal_code,      sh.ship_to_country,      CAST(null as nvarchar(100) )  user_dimension01,      CAST(null as nvarchar(100) )  user_dimension02,      CAST(null as nvarchar(100) )  user_dimension03,      CAST(null as nvarchar(100) )  user_dimension04,      CAST(null as nvarchar(100) )  user_dimension05,      CAST(null as nvarchar(100) )  user_dimension06,      CAST(null as nvarchar(100) )  user_dimension07,      CAST(null as nvarchar(100) )  user_dimension08,      CAST(null as nvarchar(100) )  user_dimension09,      CAST(null as nvarchar(100) )  user_dimension10,      CAST(null as numeric(28,     5) )  user_fact1,      CAST(null as numeric(28,     5) )  user_fact2,      CAST(null as numeric(28,     5) )  user_fact3,      CAST(null as numeric(28,     5) )  user_fact4,      CAST(null as numeric(28,     5) )  user_fact5  from     transaction_history th with (nolock)  inner join work_instruction_view wi with (nolock)  on wi.internal_instruction_num = th.internal_key_id     and wi.internal_num_type in (N'Dock Management',      N'Shipment')  inner join shipment_header sh with (nolock)  on sh.internal_shipment_num = wi.internal_num  where     ((th.transaction_type in (N'390',      N'130',      N'120')      and th.direction = N'From')  or (th.transaction_type in (N'400',      N'140',      N'120')      and th.direction = N'To') ) AND th.activity_date_time > @StartTime AND th.activity_date_time <= @EndTime
END
;

