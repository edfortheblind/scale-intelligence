-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








































-- [comment omitted]
-- [comment omitted]


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

	-- [comment omitted]
	declare @cProcHistActive nchar(1); 
	declare @iError int;
	declare @iNumOnGroup numeric(9);
	declare @stMessage nvarchar(2000);
	declare	@iRowCount int;
	declare @CCRequestExistForLocItemLotLP bit;
	
	set @iTotalReq = 0;

	-- [comment omitted]
	if (@stLoc is null
		OR @stWhs is null)
		return -1;
	
	-- [comment omitted]
	SELECT @iNumOnGroup = COUNT(*)
		FROM CYCLE_COUNT_REQUEST
		WHERE INTERNAL_PLAN_NUM = @iPlanNum
		AND GROUP_NUMBER = @iGroupNum;
		   
	-- [comment omitted]
	-- [comment omitted]
	if (@iNumOnGroup >= @iGroupSize AND @iGroupSize <> 0)
		set @iGroupNum = @iGroupNum + 1;

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	if(@stItemDesc is null OR @stItemDesc = N'<literal:1>')
		SELECT @stItemDesc = DESCRIPTION FROM ITEM 
		WHERE ITEM = @stItem 
			AND (COMPANY = @stCompany OR COMPANY IS NULL )
	
	-- [comment omitted]
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
			GETUTCDATE(), -- [comment omitted]
			NULL, -- [comment omitted]
			0, -- [comment omitted]
			@iLaunchNum,
			N'<literal:2>', -- [comment omitted]
			CASE WHEN @cCreateWork = N'<literal:3>' OR @cCreateWork = N'<literal:4>'
				 THEN N'<literal:5>' ELSE N'<literal:6>' END, -- [comment omitted]
			@stUserName,
			N'<literal:7>', -- [comment omitted]
			@stItemDesc,
			GETUTCDATE(), 	-- [comment omitted]
			@stContainer,
			@parentLogisticsUnit, 
			CASE WHEN ISNULL(@locInvAttributesId, 0) = 0 THEN null ELSE @locInvAttributesId END
			Where Not Exists (SELECT N'<literal:8>' 
				 FROM CYCLE_COUNT_REQUEST
				WHERE isNull(ITEM, N'<literal:9>') = isNull(@stItem, N'<literal:10>')
				  AND LOCATION = @stLoc
				  AND WAREHOUSE = @stWhs
				  AND isNUll(COMPANY,N'<literal:11>') = isNUll(@stCompany,N'<literal:12>')
				  AND isNUll(LOT,N'<literal:13>') = isNUll(@stLot,N'<literal:14>')
				  AND isNUll(LOGISTICS_UNIT,N'<literal:15>') = isNull(@stContainer,N'<literal:16>') 
				  AND isNUll(LOC_INV_ATTRIBUTES_ID,0) = isNUll(@locInvAttributesId,0)
				  AND CONDITION <> N'<literal:17>') 


	SELECT @iError = @@ERROR,@iRowCount = @@ROWCOUNT;

	if(@iRowCount = 0)		
	begin
		set @stMessage = dbo.RSCMfn_RtrvMsg(N'<literal:18>');
		exec SH_FillStringWithVarData @stMessage output, @stLoc, N'<literal:19>'; -- [comment omitted]
		exec @iError = HIST_SaveProcHist 
							  N'<literal:20>',
							  N'<literal:21>',
							   null,					-- [comment omitted]
							   null,					-- [comment omitted]
							   null,					-- [comment omitted]
							   null,					-- [comment omitted]
							   @stMessage,
							   N'<literal:22>',	-- [comment omitted]
							   @stUserName,
							   @stWhs,
							   @cProcHistActive output;
		if (@@ERROR <> 0) 
			return -1; 
		else 
			return @iError;
	end; -- [comment omitted]
	
	if (@iError <> 0) return -1;
	
	set @iTotalReq = @iTotalReq + @iRowCount;
		
-- [comment omitted]


