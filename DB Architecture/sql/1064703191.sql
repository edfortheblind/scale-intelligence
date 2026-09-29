-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


-- [comment omitted]


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
	
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	if (@cProcHistActive is null)
	begin
		SELECT @cProcHistActive = CASE WHEN (SYS1VALUE = N'<literal:1>' 
											 OR SYS1VALUE = N'<literal:2>')
									 THEN N'<literal:3>'
									 ELSE N'<literal:4>'
									 END
		  FROM GENERIC_CONFIG_DETAIL
		 WHERE RECORD_TYPE = N'<literal:5>'
		   AND IDENTIFIER = @stProcess;
	end; -- [comment omitted]
	
	if (@cProcHistActive = N'<literal:6>')
	begin
		-- [comment omitted]
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
				dbo.DHfn_RoundToSec(GETUTCDATE()),		-- [comment omitted]
				dbo.DHfn_RoundToSec(GETUTCDATE()),		-- [comment omitted]
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
	end; -- [comment omitted]
-- [comment omitted]


