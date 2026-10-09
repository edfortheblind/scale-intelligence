/*
	Task  | By  | Date     | Modification Description
	-------------------------------------------------
	14842 | RAB	| 09/26/04 | Created.
	144069| MDL	| 04/14/15 | Modify to remove ship container number form AR table in case of short putaway..
	245355| RSP	| 10/14/20 | Added a code to throw error and return if there is any serial number archived during inventory transfer.
*/	


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
           ,CASE WHEN @stTransType = N'430'  THEN NULL ELSE [SHIP_CONT_NUM] END
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
           ,N'INV_ArchiveSerialNumbers' + ISNULL(@stTransType,N'')
           ,[DATE_TIME_STAMP]
		   ,[TOTE_DETAIL_ID]
	  FROM SERIAL_NUMBER
	 WHERE LOC_INV_NUM = @locInvNum;
	SELECT @error = @@ERROR, @rowCount = @@ROWCOUNT;
	if (@error <> 0) return -1;

	if (@rowCount > 0 AND @stTransType = N'60')
            THROW 51000, N'Invalid transaction type.', 1;

	if (@rowCount > 0)
	begin
		DELETE FROM SERIAL_NUMBER WHERE LOC_INV_NUM = @locInvNum;
	end;
-- end INV_ArchiveSerialNumbers

