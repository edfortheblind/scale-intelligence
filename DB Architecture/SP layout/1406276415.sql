/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	15053	| MD	| 10/01/04	| Created
*/

CREATE PROCEDURE wm_RLocation04
	@dock nvarchar(25),
	@whs nvarchar(25)
AS
	SELECT *
	FROM LOCATION
	WHERE LOCATION = @dock AND LOCATION_CLASS = N'Receiving Dock' AND WAREHOUSE = @whs ;


