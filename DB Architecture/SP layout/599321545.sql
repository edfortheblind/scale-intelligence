/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RContainerClass02
	@ContainerClass nvarchar(25)
AS
	SELECT * 
     FROM container_class
	 WHERE container_class = @ContainerClass
      AND active = N'Y'
