-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RGenericConfigDetail02
	@RecordType nvarchar(50)
	,@Identifier nvarchar(50)
AS
	SELECT * 
     FROM GENERIC_CONFIG_DETAIL
	 WHERE RECORD_TYPE = @RecordType
	   AND IDENTIFIER = @Identifier
      AND active = N'<literal:1>'
