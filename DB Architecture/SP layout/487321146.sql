/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RCarrierGroupHeader02
	@CarrierGroup nvarchar(25)
AS
	SELECT * 
     FROM carrier_group_header
	 WHERE carrier_group = @CarrierGroup
      AND active = N'Y'
