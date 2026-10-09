/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	19249	| RLG	| 06/08/06	| Created
*/


CREATE PROCEDURE wm_RGenericAddressDetail01
        @identifier  nvarchar(25),
	@recordType  nvarchar(50)
AS
	SELECT * 
    	FROM Generic_Address_Detail
    	WHERE identifier = @identifier
        AND record_type = @recordType;



