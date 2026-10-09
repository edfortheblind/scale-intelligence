/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RContainerClass01
	@ContainerClass nvarchar(25)
AS
	SELECT * FROM CONTAINER_CLASS
	 WHERE CONTAINER_CLASS = @ContainerClass
