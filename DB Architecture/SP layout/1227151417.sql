









/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	RPT07	| TLS	| 02/14/07	| Created.

	Returns a rowset used for Shipped Summary.rpt.
	
	Parameters:
		Beginning_date	The start date
		Ending_date	The end date
	

	Returns:
		The total Shmts, qty, value, containers, lines, value
		from the shipment header  corresponding to that date range.

*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE             PROCEDURE [dbo].[TRAV_Wave_Allocation_Failure](
	@Wave_Number nvarchar(25)
	)

AS
begin
	set nocount on;
select 
	substring(message,45, 200) as Msg,
	identifier1, 
	identifier2 
	from process_history with(nolock) 
	where
	identifier1 = N'Wave Number:'+@Wave_Number and 
	process = N'290' and 
	action = N'140' and
	activity_date_time > getdate() - 1 and 
	identifier3 = N'Allocation Rule Sequence:50'
	
/*select 
	substring(message,45, 200) as Msg,
	identifier1 
	from process_history with(nolock) 
	where
	identifier1 like N'%'+@Wave_Number and 
	process = N'290' and 
	action = N'140' and
	date_time_stamp > getdate() - 2 and 
	message like N'%Sequence: 50%'
order by 
	substring(message,45, 200)
*/


end -- PROCEDURE TRAV_Wave_Allocation_Failure