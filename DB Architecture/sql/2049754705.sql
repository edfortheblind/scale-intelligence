-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE STAT_SaveStatisticsValue(
	@sourceName nvarchar(50),
	@fieldName nvarchar(100),
	@sourceKey nvarchar(100),
	@value numeric(28,5))
AS
	SET NOCOUNT ON;

	-- [comment omitted]
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
		set @error = N'<literal:1>' + @sourceName + N'<literal:2>' + @fieldName;
		RAISERROR(@error, 18, 1);
		return -1;
	end;

	-- [comment omitted]
	declare @valueId numeric(9);

	select 
		@valueId = value.object_id
	from
		statistics_value value
	where
		value.field_id = @fieldId
		and
		value.source_key = @sourceKey

	-- [comment omitted]
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
-- [comment omitted]
