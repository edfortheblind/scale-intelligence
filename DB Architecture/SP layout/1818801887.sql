/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/15/09	| Created.

	Returns the fields to be displayed in the header of the statistics report.
*/
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
	
	select 0 row_position, 0 column_position, dbo.RSCMfn_RtrvResource(N'WAVENUMBER', N'Text', @resLang) name, @sourceKey value
	union all
	select 0 row_position, 1 column_position, dbo.RSCMfn_RtrvResource(N'LAUNCHNAME', N'Text', @resLang) name, @waveName value
	union all
	select 1 row_position, 0 column_position, dbo.RSCMfn_RtrvResource(N'START_DATE_TIME', N'Text', @resLang) name, convert(nvarchar, @startDateTime, 120) value
	union all
	select 1 row_position, 1 column_position, dbo.RSCMfn_RtrvResource(N'END_DATE_TIME', N'Text', @resLang) name, convert(nvarchar, @endDateTime, 120) value
	union all
	select 2 row_position, 0 column_position, dbo.RSCMfn_RtrvResource(N'WAREHOUSE', N'Text', @resLang) name, @warehouse value

-- end WVST_WaveStatisticsHeaderFields
