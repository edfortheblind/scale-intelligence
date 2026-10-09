/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	57782	| DRK   | 09/08/09	| Created
*/

CREATE PROCEDURE wm_RVasActivity01
	@name nvarchar(50)
			
AS
	
		SELECT * FROM VAS_ACTIVITY
		WHERE NAME = @name;
	
