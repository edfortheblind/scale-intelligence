/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 08/15/02	| Created.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	89851		| DRK			| 09/20/11  | Inserts a new equipment location with 
												location class Euqipment instead of Inventory
	221276		| SO			| 04/23/18	| Modified to get warehouse date.
	Inserts a Location.  Note that this method should only be
	called when Validate Location is turned off.
	
	Parameters
		String	stLoc		The new location.
		String	stUserName	The users name.
		String	stWhs		The location of stLoc.
*/
CREATE PROCEDURE INV_InsertLocation(
	@stLoc nvarchar(25),
	@stUserName nvarchar(30),
	@stWhs nvarchar(25))

AS
	SET NOCOUNT ON;

	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;

	INSERT INTO LOCATION
		(ACTIVE, DATE_TIME_STAMP, LAST_CYCLE_COUNT_DATE, LOCATION, 
		 LOCATION_CLASS, LOCATION_STS, MULTI_ITEM, PICKING_SEQ,
		 PROCESS_STAMP, PUTAWAY_SEQ, TEMPLATE_FIELD1, TRACK_CONTAINERS, 
		 USER_STAMP, VERIFICATION_METH, WAREHOUSE)
	VALUES
		(N'Y', GETUTCDATE(), CONVERT(date,dbo.GetWarehouseTimezoneValue(@stWhs,null)), @stLoc,
		 N'Equipment', N'Storage', N'N', 0,
		 N'INV_InsertLocation', 0, @stLoc, N'N',
		 @stUserName, N'None', @stWhs);
	if (@@ERROR <> 0) return -1;
-- end INV_InsertLocation
