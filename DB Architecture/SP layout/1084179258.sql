/* 
	Mod Number	| Programmer		| Date   	| Modification Description
	-----------------------------------------------------------------
    973			| KRG				| 04/03/07	| Created. Added support for creating requests on the fly while adding new LPs through Cycle Counting
    35538		| PP				| 09/22/08	| Modified Work_instruction Select query to include "INTERNALNUMTYPE" value.
    46604		| SMS				| 02/23/09	| Added query to retrieve parent instruction num
    54125		| KRG				| 06/24/09	| Updated the Parent Instruction correctly. Previously, instruction num of a detail was picked up as the Parent Instruction
	111660      | KSS			    | 06/07/13	| Added two new param and modify the Work_Instruction.Sequence value 
	160551		| MJ				| 04/15/15	| Added parameter INTERNAL_REQ_NUM to work_instruction select.
	250931		| ALS				| 05/04/20	| Added SRC Identifier
	Creates a CycleCountRequest. 
	
	Parameters
		String	cycleCountInternalNum			The CC request corresponding to which the work needs to be created
		String	iLaunchNum						The Launch number of the request
		String	stRelatedWorkUnit				The work unit under which the work instruction needs to be created
		String	stUserName						The user name.
*/

CREATE PROCEDURE CCP_CreateWorkForLogisticsUnit(
	@cycleCountInternalNum numeric(9),
	@iLaunchNum numeric(9),
	@stRelatedWorkUnit nvarchar(50),
	@stUserName nvarchar(30),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25))
AS
	SET NOCOUNT ON;

	-- #DEFINE WMW.Jsharp.Inventory com.pronto.general.CCConstants CCCons;
	
	DECLARE @parentInst numeric(9,0);
	DECLARE @srcIdentifier nvarchar(50);
	
	SELECT @parentInst = INTERNAL_INSTRUCTION_NUM FROM WORK_INSTRUCTION_VIEW
	WHERE LAUNCH_NUM = @iLaunchNum 
	AND   WORK_UNIT = @stRelatedWorkUnit
	AND INTERNAL_NUM_TYPE = N'Cycle Count'
	AND INSTRUCTION_TYPE = N'Header';

	SELECT 
		@srcIdentifier = SYSTEM_VALUE
	FROM 
		SYSTEM_CONFIG_DETAIL
	WHERE 
		RECORD_TYPE = N'Cycle Count'
		AND SYS_KEY = N'110';


	-- insert the WorkInstruction detail.
	INSERT INTO WORK_INSTRUCTION
		   (ITEM,
		    ITEM_DESC,
		    COMPANY,
		    LOT,
		    FROM_LOC,
		    FROM_WHS,
		    CONDITION,
		    RELATED_WORK_UNIT,
			WORK_UNIT,
			PARENT_INSTR,
		    INTERNAL_NUM,
		    INTERNAL_REQ_NUM,
		    CYCLE_COUNT,
		    INTERNAL_COUNT_NUM,
		    LAUNCH_NUM,
		    WORK_TYPE,
		    TEAM_ASSIGNED,
		    INSTRUCTION_TYPE,
		    FROM_CHECK_DIG,
		    AGING_DATE_TIME,
		    INVENTORY_TRACKING,
		    DATE_TIME_STAMP,
		    FROM_WORK_ZONE,
		    SEQUENCE,
			SRC_IDENTIFIER,
		    PRIORITY,
		    WORK_GROUP,
		    INTERNAL_NUM_TYPE,
			USER_STAMP,
			PROCESS_STAMP,
		    REFERENCE_ID,
		    CYCLE_COUNT_GROUP_NUM,
		    LOGISTICS_UNIT,
		    PARENT_LOGISTICS_UNIT, 
			FROM_LOC_INV_ATTRIBUTES_ID)
	(SELECT TOP 1 
			CCR.ITEM,
			CCR.ITEM_DESC,
			CCR.COMPANY,
			CCR.LOT,
			CCR.LOCATION,
			CCR.WAREHOUSE,
			N'In Process', -- condition
			WI.RELATED_WORK_UNIT,
			@stRelatedWorkUnit,
			@parentInst,
			@cycleCountInternalNum,
			@cycleCountInternalNum,
			N'Y', -- cycleCount
			@cycleCountInternalNum,
			@iLaunchNum,
		    WI.WORK_TYPE,
		    WI.TEAM_ASSIGNED, --TEAM_ASSIGNED,
			WI.instruction_Type, -- instructionType
			WI.FROM_CHECK_DIG, -- fromCheckDig
			WI.AGING_DATE_TIME, -- agingDateTime
			N'Y', -- inventoryTracking
			WI.DATE_TIME_STAMP, -- dateTimeStamp
			WI.FROM_WORK_ZONE, -- fromWorkZone 
			WI.SEQUENCE, -- sequence To support the configured Order by criteria(Cycle Count Work Criteria)
			@srcIdentifier,
			WI.PRIORITY, -- PRIORITY,
			WI.WORK_GROUP, --WORK_GROUP
			WI.internal_Num_Type, -- internalNumType
			@stUserName,
			N'CCP_CreateWorkForLogisticsUnit',
		    WI.REFERENCE_ID,
		    WI.CYCLE_COUNT_GROUP_NUM,
		    CCR.LOGISTICS_UNIT,
		    CCR.PARENT_LOGISTICS_UNIT, 
			CCR.LOC_INV_ATTRIBUTES_ID 
	   FROM WORK_INSTRUCTION_VIEW WI INNER JOIN CYCLE_COUNT_REQUEST CCR
		ON WI.LAUNCH_NUM = CCR.LAUNCH_NUMBER
	  WHERE WI.LAUNCH_NUM = @iLaunchNum
	    AND WI.WORK_UNIT = @stRelatedWorkUnit
		AND WI.INSTRUCTION_TYPE = N'Detail'
		AND CCR.INTERNAL_COUNT_NUM = @cycleCountInternalNum
		AND WI.INTERNAL_NUM_TYPE = N'Cycle Count'
		AND WI.FROM_LOC = @stLoc
		And WI.FROM_WHS = @stWhs)
		
	if (@@ERROR <> 0 OR @@ROWCOUNT <= 0) return -1;
	
	SELECT
		INTERNAL_INSTRUCTION_NUM,
		WORK_UNIT,
		ITEM,
		COMPANY,
		ITEM_DESC,
		FROM_LOC,
		OUTGOING_PD_LOC,
		INCOMING_PD_LOC,
		TO_LOC,
		FROM_QTY,
		TO_QTY,
		QUANTITY_UM,
		INVENTORY_AT_PD,
		FROM_CHECK_DIG CHECK_DIG,
		NULL FROMTRKCONT,
		NULL FROMVER,
		FROM_WORK_ZONE WORK_ZONE,
		NULL OUTCHECKDIG,
		NULL OUTTRKCONT,
		NULL OUTVERMETH,
		NULL OUTWRKZONE,
		NULL INCHKDIG,
		NULL INTRKCONT,
		NULL INVER,
		NULL INWRKZONE,
		NULL CHECK_DIG1,
		NULL TRACK_CONTAINERS,
		NULL VERIFICATION_METH,
		NULL WORK_ZONE1,
		NULL LOCATION_CLASS,
		LOT,
		INVENTORY_TRACKING,
		MESSAGE_ID,
		WORK_TYPE,
		INTERNAL_NUM_TYPE,
		CONTAINER_ID,
		TRANSPORT_CONT_ID,
		CYCLE_COUNT,
		INTERNAL_CONTAINER_NUM,
		CONVERTED_QTY_UM,
		REFERENCE_ID,
		REFERENCE_TYPE,
		WORK_GROUP,
		EQUIPMENT_LOC,
		FROM_WHS,
		TO_WHS,
		INTERNAL_LINE_NUM,
		INTERNAL_NUM,
		CONVERTED_QTY,
		QUANTITY,
		TOTAL_VOLUME,
		VOLUME_UM,
		TOTAL_WEIGHT,
		WEIGHT_UM,
		START_DATE_TIME,
		PARENT_INSTR,
		ACCOUNT,
		FROM_LOC PICKLOC,
		NULL PUTLOC,
		LOGISTICS_UNIT,
		PARENT_LOGISTICS_UNIT,
		FROM_WHS FROM_WHS1,
		N'' MESSAGE_DELIVERY_TYPE,
		NULL EXPIRATION_DATE,
		NULL WORK_PROFILE,
		FROM_CHECK_DIG,
		TO_CHECK_DIG, 
		FROM_LOC_INV_ATTRIBUTES_ID,
		INTERNAL_REQ_NUM 
	FROM WORK_INSTRUCTION
	WHERE INTERNAL_INSTRUCTION_NUM = scope_identity()



