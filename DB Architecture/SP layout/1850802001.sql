/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 10/08/02	| Created.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes

	Creates a CycleCountPlan. 
	
	Parameters
		int		iGroupSize		The group size.
		String	stWhs			stLocs warehouse.
		String	stUserName		The current user.
		
	Output parameters
		int		iPlanNum		The internalPlanNum of the plan inserted.
*/
CREATE PROCEDURE CCP_InsertCCPlan(
	@iGroupSize numeric(9),
	@stWhs nvarchar(25),
	@stUserName nvarchar(30),
	@iPlanNum numeric(9) output)
AS
	SET NOCOUNT ON;

	-- insert the plan.
	INSERT INTO CYCLE_COUNT_PLAN
		   (CREATED_DATE,
		    GROUP_SIZE,
		    MASTER_NAME,
			IN_CREATION,
		    RELEASED,
		    TOTAL_OPEN,
		    TOTAL_CLOSED,
		    TOTAL_REVIEWED,
		    WAREHOUSE,
			USER_STAMP,
			PROCESS_STAMP,
			DATE_TIME_STAMP)
	VALUES (GETUTCDATE(), -- createdDate
			@iGroupSize,
			null, -- masterName
			N'N', -- inCreation
			N'Y', -- released
			0, -- totalOpen
			0, -- totalClosed
			0, -- totalReviewed
			@stWhs,
			@stUserName, -- userStamp
			N'CCP_InsertCCPlan', -- processStamp
			GETUTCDATE()); -- dateTimeStamp
	if (@@ERROR <> 0) return -1;
	
	set @iPlanNum = scope_identity();
-- end CCP_InsertCCPlan