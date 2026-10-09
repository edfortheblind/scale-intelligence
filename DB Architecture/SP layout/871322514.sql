/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RInterfaceDataMapDetail01
	@MapName nvarchar(25)
AS
	SELECT * FROM INTERFACE_DATA_MAP_DETAIL
	 WHERE MAP_NAME = @MapName
