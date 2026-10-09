
CREATE PROCEDURE wm_RSystemConfigDetail01(
	@SysKey nvarchar(25),
	@RecordType nvarchar(25)
) AS
	SELECT * FROM SYSTEM_CONFIG_DETAIL
	 WHERE SYS_KEY = @SysKey AND RECORD_TYPE = @RecordType


