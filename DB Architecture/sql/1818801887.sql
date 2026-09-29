-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE WVST_WaveStatisticsHeaderFields(
	@sourceKey nvarchar(100),
	@resLang nvarchar(25))
as
	SET NOCOUNT ON;

	declare @waveName nvarchar(25);
	declare @startDateTime datetime;
	declare @endDateTime datetime;
	declare @warehouse nvarchar(25);

	select
		@waveName = LAUNCH_NAME,
		@startDateTime = LAUNCH_DATE_TIME_STARTED,
		@endDateTime = LAUNCH_DATE_TIME_ENDED,
		@warehouse = WAREHOUSE
	from
		LAUNCH_STATISTICS
	where
		INTERNAL_LAUNCH_NUM = @sourceKey;
	
	select 0 row_position, 0 column_position, dbo.RSCMfn_RtrvResource(N'<literal:1>', N'<literal:2>', @resLang) name, @sourceKey value
	union all
	select 0 row_position, 1 column_position, dbo.RSCMfn_RtrvResource(N'<literal:3>', N'<literal:4>', @resLang) name, @waveName value
	union all
	select 1 row_position, 0 column_position, dbo.RSCMfn_RtrvResource(N'<literal:5>', N'<literal:6>', @resLang) name, convert(nvarchar, @startDateTime, 120) value
	union all
	select 1 row_position, 1 column_position, dbo.RSCMfn_RtrvResource(N'<literal:7>', N'<literal:8>', @resLang) name, convert(nvarchar, @endDateTime, 120) value
	union all
	select 2 row_position, 0 column_position, dbo.RSCMfn_RtrvResource(N'<literal:9>', N'<literal:10>', @resLang) name, @warehouse value

-- [comment omitted]
