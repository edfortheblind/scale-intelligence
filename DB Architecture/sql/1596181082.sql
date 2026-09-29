-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





  

CREATE PROCEDURE DASH_UpdateKPIData( 
	@kpiType nvarchar(50), 
	@warehouse nvarchar(25))  
AS  
Begin
	-- [comment omitted]
	declare @todaysDateWithWarehouseOffset nvarchar(50);
	declare @todaysDate datetime;
	set @todaysDate = GETUTCDATE();
	DECLARE @result int;
	set @todaysDateWithWarehouseOffset = CAST(dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) AS DATE)

	select @result = count(*) FROM DASHBOARD_DATA DD with(nolock) LEFT OUTER JOIN SYSTEM_CONFIG_DETAIL SCD with(nolock) ON SCD.RECORD_TYPE = N'<literal:1>' AND DD.EXPIRATION_TIME_CONFIG = SCD.SYS_KEY  
	WHERE (DD.DATE_TIME_STAMP < SCD.DATE_TIME_STAMP AND DD.IDENTIFIER NOT IN (130, 200, 340, 410))  
 -- [comment omitted]
  
 if @result>0  
 Begin
	-- [comment omitted]
	UPDATE DASHBOARD_DATA 
	SET EXPIRATION_TIME = CASE WHEN SCD.SYSTEM_VALUE IS NOT NULL THEN SCD.SYSTEM_VALUE ELSE 5 END, DATE_TIME_STAMP = @todaysDate
	FROM DASHBOARD_DATA DD LEFT OUTER JOIN SYSTEM_CONFIG_DETAIL SCD ON SCD.RECORD_TYPE = N'<literal:2>' AND DD.EXPIRATION_TIME_CONFIG = SCD.SYS_KEY
	WHERE (DD.DATE_TIME_STAMP < SCD.DATE_TIME_STAMP AND DD.IDENTIFIER NOT IN (130, 200, 340, 410));
END  
 set @result=0; 
	-- [comment omitted]
	if @kpiType = N'<literal:3>' 
	begin
		EXEC @result = sp_getapplock @Resource = N'<literal:4>',     
        @LockMode = N'<literal:5>', @LockTimeout=10;    
		  IF @result = 0   
		   BEGIN
				-- [comment omitted]
				EXEC DASH_RefreshOutboundData @warehouse, @todaysDateWithWarehouseOffset,@todaysDate;
				exec sp_releaseapplock  @Resource = N'<literal:6>';  
		   END 
	end	
	-- [comment omitted]
	else if @kpiType = N'<literal:7>' 
	begin
		
			EXEC @result = sp_getapplock @Resource = N'<literal:8>',     
               @LockMode = N'<literal:9>', @LockTimeout=10;    
		  IF @result = 0   
		   BEGIN 
				-- [comment omitted]
				EXEC DASH_RefreshInboundData @warehouse, @todaysDateWithWarehouseOffset,@todaysDate;
				exec sp_releaseapplock  @Resource = N'<literal:10>'; 
			END    
    end
		
	-- [comment omitted]
	else if @kpiType = N'<literal:11>' 
	begin
		EXEC @result = sp_getapplock @Resource = N'<literal:12>',     
					   @LockMode = N'<literal:13>', @LockTimeout=10;    
		  IF @result = 0   
		   BEGIN
				-- [comment omitted]
				EXEC DASH_RefreshWorkData @warehouse, @todaysDateWithWarehouseOffset, @todaysDate;
				exec sp_releaseapplock  @Resource = N'<literal:14>';  
			END 
	end	
	-- [comment omitted]
	else if @kpiType = N'<literal:15>' 
	begin

			EXEC @result = sp_getapplock @Resource = N'<literal:16>',     
					   @LockMode = N'<literal:17>', @LockTimeout=10;    
			IF @result = 0   
			BEGIN 
				-- [comment omitted]
				EXEC DASH_RefreshLabor @warehouse, @todaysDateWithWarehouseOffset,@todaysDate;
				exec sp_releaseapplock  @Resource = N'<literal:18>';  
			END
	end

END