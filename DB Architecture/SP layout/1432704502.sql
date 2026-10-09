/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	16413           | KSP           | 08/30/05      | Created
	69969			| DRK			| 07/09/10		| Fixed the check for lot items
	82009			| DRK			| 04/07/2011	| Fixed Exp Date for Non-existing lots
	Inserts lot based on supplied information.
	
	Parameters
		lot,item,company,warehouse,expDate,inventory status
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE INV_ProcessLotInNewInventory(
	@loc		nvarchar(25),
	@lot		nvarchar(25),
	@item		nvarchar(50),
	@company	nvarchar(25),
        @warehouse	nvarchar(25),
	@expDate 	datetime,
	@inventorySts	nvarchar(50),
	@argumentGroupId nvarchar(32))

AS
	SET NOCOUNT ON;

	DECLARE @lotTemplate  		nvarchar(25);
	DECLARE @iError       		int;
	DECLARE @frozen       		nchar(1);
	DECLARE @frozenLotStatus	nvarchar(50);
	DECLARE @locClass		nvarchar(25);
	DECLARE @objectId        	numeric(9);
	DECLARE @iRowCount		int;

	-- Do not insert lot for interfaced containers
	select @locClass = LOCATION_CLASS
	from LOCATION 
	where LOCATION = @loc
	      and  warehouse = @warehouse;
	if (@locClass = N'Receiving Pre-Check In')
	   return;

	-- retrieve the lot template.
	select @lotTemplate = LOT_TEMPLATE
	from ITEM
	where ITEM = @item 
	and ISNULL(COMPANY,ISNULL(@company,N'!')) = ISNULL(@company,N'!');

	-- determine if the lot will be frozen.
	select @frozenLotStatus = SYSTEM_VALUE
	FROM SYSTEM_CONFIG_DETAIL
	WHERE SYS_KEY = N'130'
              AND RECORD_TYPE = N'Inventory';
	if (@inventorySts = @frozenLotStatus)
		SET @frozen = N'Y';
	else
		SET @frozen = N'N';


	-- if Exp Date is null, insert max date for lot
	if (@expDate is null)
		SET @expDate = dbo.DHfn_TransToSQLDate(N'47121231000000');
		
	-- insert the lot only if it does not already
	-- exist.
	insert into lot(
		LOT_TEMPLATE,
		LOT,
		ITEM,
		COMPANY,
		WAREHOUSE,
		EXPIRATION_DATE,
		FROZEN,
		INVENTORY_STS,
		USER_STAMP,
		PROCESS_STAMP,
		DATE_TIME_STAMP
		)
	select
		@lotTemplate,
		@lot,
		@item,
		@company,
		@warehouse,
		@expDate,
		@frozen,
		@inventorySts,
		N'System',
		N'INV_ProcessLotInNewInventory',
		GETUTCDATE()

	where not exists(select lot from lot 
 		      	 	where lot = @lot 
			 	and item = @item 
			 	and (COMPANY IS NULL OR (ISNULL(COMPANY,N'!') = ISNULL(@company,N'!')))
		        and Warehouse = @warehouse);
	SELECT @iError = @@ERROR, @iRowCount = @@ROWCOUNT, @objectId = @@IDENTITY;
	if (@iError <> 0) return -1;

	-- do not continue if the lot already exists.
	if (@iRowCount = 0)
		return;

	-- process any lot attributes.
	if (@argumentGroupId is not null)
	Begin
		exec @iError = INV_InsertLotAttributes @objectId, @argumentGroupId
		if (@iError <> 0) return -1;
	End	
-- end INV_ProcessLotInNewInventory
