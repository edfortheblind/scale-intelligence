/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14660	| LJM			| 06/08/04	| created
	191074	| DN			| 01/23/17	| Updated parameter types
*/


CREATE PROCEDURE wm_RInterfaceDataMapHeader03
	@Direction nvarchar(25),
	@Prefix nvarchar(25)
AS
	SELECT * FROM INTERFACE_DATA_MAP_HEADER
	WHERE DIRECTION = @Direction
	AND MAP_NAME LIKE (@Prefix + N'%');