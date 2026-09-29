-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RCarrierGroupHeader02
	@CarrierGroup nvarchar(25)
AS
	SELECT * 
     FROM carrier_group_header
	 WHERE carrier_group = @CarrierGroup
      AND active = N'<literal:1>'
