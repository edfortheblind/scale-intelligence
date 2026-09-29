-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















-- [comment omitted]


CREATE PROCEDURE RPT_ReplenPickListHeader(
	@REPLENISHMENT_MASTER nvarchar(25),
	@LAUNCH_NUM numeric(9))

AS
begin
	set nocount on;
	select top 1
		rr.from_whs,
		case -- [comment omitted]
			when ls.internal_launch_num is null
			then -1
			else rr.launch_num
		end launch_num,
		rr.replenishment_master
	from
		replenishment_request rr left outer join launch_statistics ls		
		on
		ls.internal_launch_num = @LAUNCH_NUM

	where
		rr.launch_num = @LAUNCH_NUM
		and 
		rr.replenishment_master = @REPLENISHMENT_MASTER
		and
		rr.work_created = N'<literal:1>' -- [comment omitted]
	order by rr.replenishment_master


end -- [comment omitted]




