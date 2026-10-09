/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14660	| LJM			| 05/25/04	| created
	191074	| DN			| 01/23/17	| Updated parameter types
*/


CREATE PROCEDURE wm_RInterfaceDataMapHeader02
	@RecordType nvarchar(50),
	@Direction nvarchar(25),
	@Mode numeric(1)
AS
	SELECT * FROM INTERFACE_DATA_MAP_HEADER
	WHERE RECORD_TYPE = @RecordType
	AND DIRECTION = @Direction
	AND INTERFACE_TYPE = @Mode;