-- DOCUMENTATION ONLY: literals/comments removed; do not execute.










/* [comment omitted] */

















-- [comment omitted]


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
	identifier1 = N'<literal:1>'+@Wave_Number and 
	process = N'<literal:2>' and 
	action = N'<literal:3>' and
	activity_date_time > getdate() - 1 and 
	identifier3 = N'<literal:4>'
	
/* [comment omitted] */














end -- [comment omitted]