/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	19066	| MD	| 05/22/06	| Created
*/

CREATE PROCEDURE wm_RAppIdentifier01
	@AppIdentifier nvarchar(10)
AS
	SELECT *
	  FROM APP_IDENTIFIER
	 WHERE APP_IDENTIFIER = @AppIdentifier



