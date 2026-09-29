-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RInterfaceDataMapDetail01
	@MapName nvarchar(25)
AS
	SELECT * FROM INTERFACE_DATA_MAP_DETAIL
	 WHERE MAP_NAME = @MapName
