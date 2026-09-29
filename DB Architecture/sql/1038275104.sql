-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE wm_RCarrier02
	@Carrier nvarchar(25),
	@CarrierService nvarchar(50)
AS
	SELECT * FROM CARRIER
	 WHERE CARRIER = @Carrier
      AND ((SERVICE = @CarrierService) OR (SERVICE IS NULL AND @CarrierService IS NULL))
      AND ACTIVE = N'<literal:1>'
 

