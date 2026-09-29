-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





	


CREATE PROCEDURE INV_ArchiveSerialNumbers(
	@locInvNum numeric(9),
	@stTransType nvarchar(50) =null)
AS
	SET NOCOUNT ON;

	declare @error int;
	declare @rowCount int;

	INSERT INTO AR_SERIAL_NUMBER
	SELECT  [OBJECT_ID]
           ,[GROUP_ID]
           ,[SERIAL_NUMBER]
           ,[TEMPLATE_ID]
           ,[LOC_CONT_NUM]
           ,[LOC_INV_NUM]
           ,CASE WHEN @stTransType = N'<literal:1>'  THEN NULL ELSE [SHIP_CONT_NUM] END
           ,[REC_CONT_NUM]
           ,[USER_DEF1]
           ,[USER_DEF2]
           ,[USER_DEF3]
           ,[USER_DEF4]
           ,[USER_DEF5]
           ,[USER_DEF6]
           ,[USER_DEF7]
           ,[USER_DEF8]
           ,[USER_STAMP]
           ,N'<literal:2>' + ISNULL(@stTransType,N'<literal:3>')
           ,[DATE_TIME_STAMP]
		   ,[TOTE_DETAIL_ID]
	  FROM SERIAL_NUMBER
	 WHERE LOC_INV_NUM = @locInvNum;
	SELECT @error = @@ERROR, @rowCount = @@ROWCOUNT;
	if (@error <> 0) return -1;

	if (@rowCount > 0 AND @stTransType = N'<literal:4>')
            THROW 51000, N'<literal:5>', 1;

	if (@rowCount > 0)
	begin
		DELETE FROM SERIAL_NUMBER WHERE LOC_INV_NUM = @locInvNum;
	end;
-- [comment omitted]

