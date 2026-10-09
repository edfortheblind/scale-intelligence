/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	57617		| RAB		| 09/04/09	| Created.

	Saves a Statistics Value.
*/
CREATE PROCEDURE STAT_SaveStatisticsValue(
	@sourceName nvarchar(50),
	@fieldName nvarchar(100),
	@sourceKey nvarchar(100),
	@value numeric(28,5))
AS
	SET NOCOUNT ON;

	-- retrieve the field ID
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

	-- check to see if the value already exists.
	declare @valueId numeric(9);

	select 
		@valueId = value.object_id
	from
		statistics_value value
	where
		value.field_id = @fieldId
		and
		value.source_key = @sourceKey

	-- either update or insert the value.
	if (@valueId is not null)
	begin
		update
			statistics_value
		set
			value = @value,
			date_time_stamp = GETUTCDATE()
		where
			object_id = @valueId;
	end
	else
	begin
		insert statistics_value
		(
			field_id,
			source_key,
			value,
			date_time_stamp
		)
		values
		(
			@fieldId,
			@sourceKey,
			@value,
			GETUTCDATE()
		);
	end
-- end STAT_SaveStatisticsValue
