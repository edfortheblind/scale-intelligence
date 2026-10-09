
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	108971		| JY			| 03/11/13	| Created.
*/
CREATE FUNCTION GENfn_SplitString
(
    @STR NVARCHAR(4000),
    @SEPARATOR CHAR(1)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS ID,
        LTRIM(RTRIM(value)) AS VALUE
    FROM STRING_SPLIT(@STR, @SEPARATOR)
    WHERE @STR IS NOT NULL 
      AND LEN(@STR) > 0
      AND LEN(LTRIM(RTRIM(value))) > 0
);
