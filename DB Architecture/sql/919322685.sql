-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RInterfaceDetail02
	@HdrKeyNum numeric(9)
AS
	SELECT * FROM INTERFACE_DETAIL
	WHERE HDR_KEY_NUM = @HdrKeyNum
	ORDER BY SEQUENCE
