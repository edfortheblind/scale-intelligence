

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE HIST_SaveProcHist(
	@stProcess nvarchar(50),
	@stAction nvarchar(50),
	@stIdentifier1 nvarchar(200),
	@stIdentifier2 nvarchar(200),
	@stIdentifier3 nvarchar(200),
	@stIdentifier4 nvarchar(200),
	@stMessage nvarchar(500),
	@stProcessStamp	nvarchar(100),
	@stUserName nvarchar(30),
	@stWarehouse nvarchar(25),
	@cProcHistActive nchar(1) output)
AS
	SET NOCOUNT ON;
	
	-- determine if ProcessHistory is active for the 
	-- current Process.  Note that if the value was 
	-- already passed in, the following select can be skipped.
	if (@cProcHistActive is null)
	begin
		SELECT @cProcHistActive = CASE WHEN (SYS1VALUE = N'Y' 
											 OR SYS1VALUE = N'y')
									 THEN N'Y'
									 ELSE N'N'
									 END
		  FROM GENERIC_CONFIG_DETAIL
		 WHERE RECORD_TYPE = N'HIST PROC'
		   AND IDENTIFIER = @stProcess;
	end; -- end if processDesc not yet retrieved.
	
	if (@cProcHistActive = N'Y')
	begin
		-- insert the record.
		INSERT INTO PROCESS_HISTORY
			   (ACTION,
				ACTIVITY_DATE_TIME,
				DATE_TIME_STAMP,
				IDENTIFIER1,
				IDENTIFIER2,
				IDENTIFIER3,
				IDENTIFIER4,
				MESSAGE,
				PROCESS,
				PROCESS_STAMP,
				USER_STAMP,
				WAREHOUSE)
		VALUES (@stAction,
				dbo.DHfn_RoundToSec(GETUTCDATE()),		-- activityDateTime
				dbo.DHfn_RoundToSec(GETUTCDATE()),		-- dateTimeStamp
				@stIdentifier1,
				@stIdentifier2,
				@stIdentifier3,
				@stIdentifier4,
				@stMessage,
				@stProcess,
				@stProcessStamp,
				@stUserName,
				@stWarehouse);
		if (@@ERROR <> 0) return -1;
	end; -- end if current ProcessHistory is active   
-- end HIST_SaveProcHist


