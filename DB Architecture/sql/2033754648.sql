-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE STAT_GetStatisticsValue(
	@sourceName nvarchar(50),
	@fieldName nvarchar(100),
	@sourceKey nvarchar(100),
	@value numeric(28,5) out)
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

	select 
		@value = value.value
	from
		statistics_value value
	where
		value.field_id = @fieldId
		and
		value.source_key = @sourceKey;

	set @value = isnull(@value, 0);
-- [comment omitted]
