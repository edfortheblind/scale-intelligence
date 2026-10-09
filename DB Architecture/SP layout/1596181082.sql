/*
	Mod Number | Programmer	| Date     | Modification Description  
	-----------------------------------------------------------------------------------------------------------------------------------------  
		238119| KSS			| 09/04/19 | Created.  
		
	Returns dashboard KPI data based for specified KPI type and warehouse
*/  

CREATE PROCEDURE DASH_UpdateKPIData( 
	@kpiType nvarchar(50), 
	@warehouse nvarchar(25))  
AS  
Begin
	-- Get the todays date part with warehouse offset
	declare @todaysDateWithWarehouseOffset nvarchar(50);
	declare @todaysDate datetime;
	set @todaysDate = GETUTCDATE();
	DECLARE @result int;
	set @todaysDateWithWarehouseOffset = CAST(dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) AS DATE)

	select @result = count(*) FROM DASHBOARD_DATA DD with(nolock) LEFT OUTER JOIN SYSTEM_CONFIG_DETAIL SCD with(nolock) ON SCD.RECORD_TYPE = N'DASHBOARDSYSVALUES' AND DD.EXPIRATION_TIME_CONFIG = SCD.SYS_KEY  
	WHERE (DD.DATE_TIME_STAMP < SCD.DATE_TIME_STAMP AND DD.IDENTIFIER NOT IN (130, 200, 340, 410))  
 -- Update the expiration time column on dashboard data table records if it has changed recently   
  
 if @result>0  
 Begin
	-- Update the expiration time column on dashboard data table records if it has changed recently 
	UPDATE DASHBOARD_DATA 
	SET EXPIRATION_TIME = CASE WHEN SCD.SYSTEM_VALUE IS NOT NULL THEN SCD.SYSTEM_VALUE ELSE 5 END, DATE_TIME_STAMP = @todaysDate
	FROM DASHBOARD_DATA DD LEFT OUTER JOIN SYSTEM_CONFIG_DETAIL SCD ON SCD.RECORD_TYPE = N'DASHBOARDSYSVALUES' AND DD.EXPIRATION_TIME_CONFIG = SCD.SYS_KEY
	WHERE (DD.DATE_TIME_STAMP < SCD.DATE_TIME_STAMP AND DD.IDENTIFIER NOT IN (130, 200, 340, 410));
END  
 set @result=0; 
	-- Calculate and return shipping KPIs
	if @kpiType = N'Shipping' 
	begin
		EXEC @result = sp_getapplock @Resource = N'DashboardlockShipping',     
        @LockMode = N'Exclusive', @LockTimeout=10;    
		  IF @result = 0   
		   BEGIN
				-- Insert/update the stale outbound data on the dashboard table
				EXEC DASH_RefreshOutboundData @warehouse, @todaysDateWithWarehouseOffset,@todaysDate;
				exec sp_releaseapplock  @Resource = N'DashboardlockShipping';  
		   END 
	end	
	-- Calculate and return Receiving KPIs
	else if @kpiType = N'Receiving' 
	begin
		
			EXEC @result = sp_getapplock @Resource = N'DashboardlockReceiving',     
               @LockMode = N'Exclusive', @LockTimeout=10;    
		  IF @result = 0   
		   BEGIN 
				-- Insert/update the stale receiving data on the dashboard table
				EXEC DASH_RefreshInboundData @warehouse, @todaysDateWithWarehouseOffset,@todaysDate;
				exec sp_releaseapplock  @Resource = N'DashboardlockReceiving'; 
			END    
    end
		
	-- Calculate and return Work KPIs
	else if @kpiType = N'Work' 
	begin
		EXEC @result = sp_getapplock @Resource = N'DashboardlockWork',     
					   @LockMode = N'Exclusive', @LockTimeout=10;    
		  IF @result = 0   
		   BEGIN
				-- Insert/update the stale receiving data on the dashboard table
				EXEC DASH_RefreshWorkData @warehouse, @todaysDateWithWarehouseOffset, @todaysDate;
				exec sp_releaseapplock  @Resource = N'DashboardlockWork';  
			END 
	end	
	-- Calculate and return Labor KPIs
	else if @kpiType = N'Labor' 
	begin

			EXEC @result = sp_getapplock @Resource = N'DashboardlockLabor',     
					   @LockMode = N'Exclusive', @LockTimeout=10;    
			IF @result = 0   
			BEGIN 
				-- Insert/update the stale outbound data on the dashboard table
				EXEC DASH_RefreshLabor @warehouse, @todaysDateWithWarehouseOffset,@todaysDate;
				exec sp_releaseapplock  @Resource = N'DashboardlockLabor';  
			END
	end

END