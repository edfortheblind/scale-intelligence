-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RInterfaceDetail01
	@DtlKeyNum numeric(9)
AS
	SELECT * FROM INTERFACE_DETAIL
	WHERE DTL_KEY_NUM = @DtlKeyNum
