-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE wm_RInterfaceDataMapHeader01
	@MapName nvarchar(25),
	@Direction nvarchar(25),
	@Mode numeric(9)
AS
	SELECT * FROM INTERFACE_DATA_MAP_HEADER
	WHERE MAP_NAME = @MapName
	AND DIRECTION = @Direction
	AND INTERFACE_TYPE = @Mode;



