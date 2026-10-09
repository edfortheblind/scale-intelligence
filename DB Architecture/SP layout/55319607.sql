/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 10/08/02	| Created.

	Retrieves the next valid launchNum from the db.	
	
	Parameters
		String	stWhs		Warehouse to place the temporary 
							LaunchStatistics in.
	Output parameters
		int		iLaunchNum	The next launchNum.
*/	
CREATE PROCEDURE NNR_RtrvNextLaunchNum(
	@stWhs nvarchar(25),
	@iLaunchNum numeric(9) output)
AS
	SET NOCOUNT ON;
	
	-- we must insert and delete a LaunchStatistics record to retrieve
	-- the next valid identity.
	INSERT INTO LAUNCH_STATISTICS
		   (AUTO_RELEASE, 
			DATE_TIME_STAMP,
		    CLOSED, 
		    LAUNCH_FLOW,
		    LAUNCH_MODE,
		    LAUNCH_NAME,
		    WAREHOUSE)
	VALUES (N'N', -- autoRelease
			GETUTCDATE(), -- dateTimeStamp
			N'N', -- closed
			N'NNR_RtrvNextLaunchNum', -- launchFlow
			N'NNR_RtrvNextLaunchNum', -- launchMode
			N'NNR_RtrvNextLaunchNum', -- launchName
			@stWhs); -- warehouse
	if (@@ERROR <> 0) return -1;
	
	set @iLaunchNum = scope_identity();
	
	DELETE LAUNCH_STATISTICS
	 WHERE INTERNAL_LAUNCH_NUM = @iLaunchNum;
	if (@@ERROR <> 0) return -1;
-- end NNR_RtrvNextLaunchNum