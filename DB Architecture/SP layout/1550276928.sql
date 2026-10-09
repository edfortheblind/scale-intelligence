/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	19122	| SWB	| 04/28/06	| Created
*/

CREATE PROCEDURE wm_RLotTemplate02
	@LotTemplate nvarchar(25)
AS
	SELECT LOT_TEMPLATE
	  FROM LOT_TEMPLATE
	 WHERE LOT_TEMPLATE = @LotTemplate
           AND ACTIVE = N'Y'


