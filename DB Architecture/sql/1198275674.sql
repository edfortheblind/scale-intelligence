-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE wm_RInterfaceDataMapHeader02
	@RecordType nvarchar(50),
	@Direction nvarchar(25),
	@Mode numeric(1)
AS
	SELECT * FROM INTERFACE_DATA_MAP_HEADER
	WHERE RECORD_TYPE = @RecordType
	AND DIRECTION = @Direction
	AND INTERFACE_TYPE = @Mode;