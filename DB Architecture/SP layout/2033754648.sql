/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Gets a Statistics Value.
*/
CREATE PROCEDURE STAT_GetStatisticsValue(
	@sourceName nvarchar(50),
	@fieldName nvarchar(100),
	@sourceKey nvarchar(100),
	@value numeric(28,5) out)
AS
	SET NOCOUNT ON;

	-- retrieve the fields ID
	declare @fieldId numeric(9);

	select
		@fieldId = field.object_id
	from
		statistics_field field

		inner join statistics_source source
		on
			source.name = @sourceName
	where
		field.source_id = source.object_id
		and
		field.name = @fieldName;

	if (@fieldId is null)
	begin
		declare @error nvarchar(2000);
		set @error = N'Could not find statistics field: Source Name = ' + @sourceName + N', Field Name = ' + @fieldName;
		RAISERROR(@error, 18, 1);
		return -1;
	end;

	select 
		@value = value.value
	from
		statistics_value value
	where
		value.field_id = @fieldId
		and
		value.source_key = @sourceKey;

	set @value = isnull(@value, 0);
-- end STAT_GetStatisticsValue
