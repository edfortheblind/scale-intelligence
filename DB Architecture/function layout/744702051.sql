/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	214856		| SO 			| 11/01/17	| Created.

	Retrieves the description for the specified record_type and identifier 
*/

CREATE FUNCTION GENCONFIGfn_RtrvTranslatedDesc(
       @recordType  nvarchar(50),
       @identifier  nvarchar(50),
@resLang nvarchar(25))
RETURNS nvarchar(500)
BEGIN
       -- local variables.
       declare @resourceKey nvarchar(250);
	   declare @description nvarchar(500);
-- select the resource key

SELECT @resourceKey = SYS1VALUE
         FROM GENERIC_CONFIG_DETAIL WHERE RECORD_TYPE =@recordType
         AND IDENTIFIER = @identifier 

       if(@resourceKey is null)
begin
       -- select the description 
       SELECT @description = DESCRIPTION
         FROM GENERIC_CONFIG_DETAIL WHERE RECORD_TYPE =@recordType
         AND IDENTIFIER = @identifier 
       
       return @description;
end


return dbo.RSCMfn_RtrvResource(@resourceKey,N'text',@resLang);
END 
