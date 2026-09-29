-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RGenericAddressDetail01
        @identifier  nvarchar(25),
	@recordType  nvarchar(50)
AS
	SELECT * 
    	FROM Generic_Address_Detail
    	WHERE identifier = @identifier
        AND record_type = @recordType;



