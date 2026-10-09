/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RPackingClass01
	@PackingClass nvarchar(25)
AS
	SELECT * FROM PACKING_CLASS
	WHERE PACKING_CLASS = @PackingClass
