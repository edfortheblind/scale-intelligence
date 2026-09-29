-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE FUNCTION GENCONFIGfn_RtrvTranslatedDesc(
       @recordType  nvarchar(50),
       @identifier  nvarchar(50),
@resLang nvarchar(25))
RETURNS nvarchar(500)
BEGIN
       -- [comment omitted]
       declare @resourceKey nvarchar(250);
	   declare @description nvarchar(500);
-- [comment omitted]

SELECT @resourceKey = SYS1VALUE
         FROM GENERIC_CONFIG_DETAIL WHERE RECORD_TYPE =@recordType
         AND IDENTIFIER = @identifier 

       if(@resourceKey is null)
begin
       -- [comment omitted]
       SELECT @description = DESCRIPTION
         FROM GENERIC_CONFIG_DETAIL WHERE RECORD_TYPE =@recordType
         AND IDENTIFIER = @identifier 
       
       return @description;
end


return dbo.RSCMfn_RtrvResource(@resourceKey,N'<literal:1>',@resLang);
END 
