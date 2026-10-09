/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RContainerType01
	@ContainerType nvarchar(25)
AS
	SELECT * FROM CONTAINER_TYPE
	 WHERE CONTAINER_TYPE = @ContainerType
