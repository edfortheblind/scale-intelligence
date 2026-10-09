/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	-			| BB			| 06/27/08	| created by combining Oracle and SQL Server versions of the script.
	30109		| BB			| 06/27/08	| Corrected length of arguement @CarrierService to 50. Combined Oracle and SQL Server versions.
*/


CREATE PROCEDURE wm_RCarrier02
	@Carrier nvarchar(25),
	@CarrierService nvarchar(50)
AS
	SELECT * FROM CARRIER
	 WHERE CARRIER = @Carrier
      AND ((SERVICE = @CarrierService) OR (SERVICE IS NULL AND @CarrierService IS NULL))
      AND ACTIVE = N'Y'
 

