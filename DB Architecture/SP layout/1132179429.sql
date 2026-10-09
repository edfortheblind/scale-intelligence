/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9591		| RLE		| 11/13/02	| Added support for container counts.
	11870		| TBS           | 09/16/03	| Added Multi-Byte support.
	11868		| TBS		| 10/06/03	| Added "N" prefix to string literals (removed by
			|		|		| precompiler if single-byte database).
	12748		| RAB		| 10/15/03	| Changed iTotalReq to be an IN OUT to protect from nulls.
	14473		| TDL		| 04/13/04	| Fixed Apostrophes
	17582		| RAB		| 10/03/05	| Stopped hardcoding constants.
	15901		| SAT		| 11/30/05	| default value assigned to iTotalReq
	19165		| VK		| 08/08/06	| License plate changes
	21158		| RAB		| 09/20/08	| Fixed history for empty locations.
	60281       | DSK       | 10/28/09  | Get ItemDescription from Item Master if empty

	20059		| DSK		| 02/20/09	| Modified existing cycle count request check to be based on Location
	58308		| DRK		| 11/13/09	| Modified existing cycle count request check based on CC Plan Num
	54818		| BB		| 11/13/09	| Rolled back last changes for 20059 and fixed it.	
	77170		| RJR		| 11/15/10	| Added parameter for inventory attributes.
	77672		| RJR		| 12/3/10	| Modified to honor inventory attributes.
	82956		| DRK		| 05/16/11	| Modified to create a new CC Request if a CC Request does not exist for the location in another plan			
	37950		| MDL		| 09/12/11	| Modified to prevent duplicate cyclecount.
	110080      | SHS       | 04/22/13  | Modified to allow unlimited counts per group if group size is zero.
	Creates a CycleCountRequest. 
	
	Parameters
		String	stItem			The item being picked.
		String	stItemDesc		stItems description.
		String	stCompany		stItems company.
		String	stLot			The current lot.
		String	stLoc			The location being picked from.
		String	stWhs			stLocs warehouse.
		String	stWorkUnit		The workUnit being processed (if any).
		String	stUserName		The current user.
		String	stContainer		The container id.
		int	iGroupNum		The group number.
		int	iGroupSize		The group size.
		int	iPLanNum		The plan number.
		int	iLaunchNum		The launch number.
*/

-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;
-- #DEFINE WMW.Reporting Manh.WMW.Reporting.General.ReportingConstants RepCon;


CREATE PROCEDURE CCP_InsertCCRequest(
	@stItem nvarchar(50),
	@stItemDesc nvarchar(100),
	@stCompany nvarchar(25),
	@stLot nvarchar(25),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@stWorkUnit nvarchar(50),
	@stUserName nvarchar(30),
	@stContainer nvarchar(50),
	@parentLogisticsUnit nvarchar(50),
	@locInvAttributesId numeric(9), 
	@iGroupNum numeric(9),
	@iGroupSize numeric(9),
	@iPlanNum numeric(9),
	@iLaunchNum numeric(9),
	@cCreateWork nchar(1),
	@iTotalReq int output)
AS
	SET NOCOUNT ON;

	-- local variables
	declare @cProcHistActive nchar(1); 
	declare @iError int;
	declare @iNumOnGroup numeric(9);
	declare @stMessage nvarchar(2000);
	declare	@iRowCount int;
	declare @CCRequestExistForLocItemLotLP bit;
	
	set @iTotalReq = 0;

	-- validate the parameters.
	if (@stLoc is null
		OR @stWhs is null)
		return -1;
	
	-- determine the number of requests on the current groupNum.
	SELECT @iNumOnGroup = COUNT(*)
		FROM CYCLE_COUNT_REQUEST
		WHERE INTERNAL_PLAN_NUM = @iPlanNum
		AND GROUP_NUMBER = @iGroupNum;
		   
	-- if the already at the max groupSize, increment the groupNum.
	-- if group size is 0, allow unlimited counts per group
	if (@iNumOnGroup >= @iGroupSize AND @iGroupSize <> 0)
		set @iGroupNum = @iGroupNum + 1;

	-- get item description from item master if it is null
	-- if item/ company is not present in item master, but present in the inventory
	--	we should get the description of item with no company
	if(@stItemDesc is null OR @stItemDesc = N'')
		SELECT @stItemDesc = DESCRIPTION FROM ITEM 
		WHERE ITEM = @stItem 
			AND (COMPANY = @stCompany OR COMPANY IS NULL )
	
	-- insert the request.
	INSERT INTO CYCLE_COUNT_REQUEST
		   (LOCATION,
		    LOT,
		    ITEM,
		    COMPANY,
		    WAREHOUSE,
		    INTERNAL_PLAN_NUM,
		    GROUP_NUMBER,
		    CREATE_DATE_TIME,
		    SYSTEM_QUANTITY,
		    QUANTITY_COUNTED,
		    LAUNCH_NUMBER,
		    CONDITION,
		    WORK_CREATED,
		    USER_STAMP,
		    PROCESS_STAMP,
		    ITEM_DESC,
		    DATE_TIME_STAMP,
		    LOGISTICS_UNIT,
		    PARENT_LOGISTICS_UNIT, 
			LOC_INV_ATTRIBUTES_ID)
	Select  @stLoc,
			@stLot,
			@stItem,
			@stCompany,
			@stWhs,
			@iPlanNum,
			@iGroupNum,
			GETUTCDATE(), -- createDateTime
			NULL, -- systemCounted
			0, -- quantityCounted
			@iLaunchNum,
			N'Open', -- condition
			CASE WHEN @cCreateWork = N'Y' OR @cCreateWork = N'y'
				 THEN N'Y' ELSE N'N' END, -- workCreated
			@stUserName,
			N'CCP_InsertCCRequest', -- processStamp
			@stItemDesc,
			GETUTCDATE(), 	-- dateTimeStamp
			@stContainer,
			@parentLogisticsUnit, 
			CASE WHEN ISNULL(@locInvAttributesId, 0) = 0 THEN null ELSE @locInvAttributesId END
			Where Not Exists (SELECT N'A' 
				 FROM CYCLE_COUNT_REQUEST
				WHERE isNull(ITEM, N'') = isNull(@stItem, N'')
				  AND LOCATION = @stLoc
				  AND WAREHOUSE = @stWhs
				  AND isNUll(COMPANY,N'') = isNUll(@stCompany,N'')
				  AND isNUll(LOT,N'') = isNUll(@stLot,N'')
				  AND isNUll(LOGISTICS_UNIT,N'') = isNull(@stContainer,N'') 
				  AND isNUll(LOC_INV_ATTRIBUTES_ID,0) = isNUll(@locInvAttributesId,0)
				  AND CONDITION <> N'Closed') 


	SELECT @iError = @@ERROR,@iRowCount = @@ROWCOUNT;

	if(@iRowCount = 0)		
	begin
		set @stMessage = dbo.RSCMfn_RtrvMsg(N'MSG_CC40');
		exec SH_FillStringWithVarData @stMessage output, @stLoc, N'|~*'; -- delimiter
		exec @iError = HIST_SaveProcHist 
							  N'80',
							  N'120',
							   null,					-- identifier1
							   null,					-- identifier2
							   null,					-- identifier3
							   null,					-- identifier4
							   @stMessage,
							   N'CCP_InsertCCRequest',	-- processStamp
							   @stUserName,
							   @stWhs,
							   @cProcHistActive output;
		if (@@ERROR <> 0) 
			return -1; 
		else 
			return @iError;
	end; -- end if CycleCount already exists.
	
	if (@iError <> 0) return -1;
	
	set @iTotalReq = @iTotalReq + @iRowCount;
		
-- end CCP_InsertCCRequest


