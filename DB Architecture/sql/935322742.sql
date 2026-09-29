-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RInterfaceHeader01
	@HdrKeyNum numeric(9)
AS
	SELECT * FROM INTERFACE_HEADER
	WHERE HDR_KEY_NUM = @HdrKeyNum
