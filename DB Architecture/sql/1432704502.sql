-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











-- [comment omitted]


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

	-- [comment omitted]
	select @locClass = LOCATION_CLASS
	from LOCATION 
	where LOCATION = @loc
	      and  warehouse = @warehouse;
	if (@locClass = N'<literal:1>')
	   return;

	-- [comment omitted]
	select @lotTemplate = LOT_TEMPLATE
	from ITEM
	where ITEM = @item 
	and ISNULL(COMPANY,ISNULL(@company,N'<literal:2>')) = ISNULL(@company,N'<literal:3>');

	-- [comment omitted]
	select @frozenLotStatus = SYSTEM_VALUE
	FROM SYSTEM_CONFIG_DETAIL
	WHERE SYS_KEY = N'<literal:4>'
              AND RECORD_TYPE = N'<literal:5>';
	if (@inventorySts = @frozenLotStatus)
		SET @frozen = N'<literal:6>';
	else
		SET @frozen = N'<literal:7>';


	-- [comment omitted]
	if (@expDate is null)
		SET @expDate = dbo.DHfn_TransToSQLDate(N'<literal:8>');
		
	-- [comment omitted]
	-- [comment omitted]
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
		N'<literal:9>',
		N'<literal:10>',
		GETUTCDATE()

	where not exists(select lot from lot 
 		      	 	where lot = @lot 
			 	and item = @item 
			 	and (COMPANY IS NULL OR (ISNULL(COMPANY,N'<literal:11>') = ISNULL(@company,N'<literal:12>')))
		        and Warehouse = @warehouse);
	SELECT @iError = @@ERROR, @iRowCount = @@ROWCOUNT, @objectId = @@IDENTITY;
	if (@iError <> 0) return -1;

	-- [comment omitted]
	if (@iRowCount = 0)
		return;

	-- [comment omitted]
	if (@argumentGroupId is not null)
	Begin
		exec @iError = INV_InsertLotAttributes @objectId, @argumentGroupId
		if (@iError <> 0) return -1;
	End	
-- [comment omitted]
