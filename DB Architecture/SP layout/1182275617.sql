/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14660	| LJM			| 05/19/04  | add mode as parameter
	191074	| DN			| 01/23/17	| Updated parameter types
*/



CREATE PROCEDURE wm_RInterfaceDataMapHeader01
	@MapName nvarchar(25),
	@Direction nvarchar(25),
	@Mode numeric(9)
AS
	SELECT * FROM INTERFACE_DATA_MAP_HEADER
	WHERE MAP_NAME = @MapName
	AND DIRECTION = @Direction
	AND INTERFACE_TYPE = @Mode;



