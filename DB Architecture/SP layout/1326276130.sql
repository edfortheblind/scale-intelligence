/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	20367		| AKN			| 12/13/06	| created
	39021		| MDL			| 10/26/08	| Modified to look for empty company if item and company passed is not found 
*/




CREATE PROCEDURE wm_RItem10
	@Item nvarchar(50),
	@Company nvarchar(25)
AS
	SELECT * FROM ITEM
	WHERE ITEM = @Item
	AND (COMPANY = @Company OR COMPANY IS NULL)
	AND CATCH_WEIGHT_REQD = N'Y';





