-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE wm_RInterfaceDataMapHeader03
	@Direction nvarchar(25),
	@Prefix nvarchar(25)
AS
	SELECT * FROM INTERFACE_DATA_MAP_HEADER
	WHERE DIRECTION = @Direction
	AND MAP_NAME LIKE (@Prefix + N'<literal:1>');