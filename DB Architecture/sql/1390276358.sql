-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RLaunchStatistics01
	@IntWaveNum numeric(9)
AS
	SELECT *
	FROM LAUNCH_STATISTICS
	WHERE INTERNAL_LAUNCH_NUM = @IntWaveNum;