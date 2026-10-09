/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	15114		| BTD			| 12/13/05	| Modified numeric field sizes
	19066		| MD			| 05/22/06	| Added QuantityUM
	54844		| BB			| 08/26/09	| Renamed QuantityUM parameter name.
*/


CREATE PROCEDURE wm_IItemCrossReference01
	@InternalItemCrossNum numeric(9),
	@Item nvarchar(50),
	@XRefItem nvarchar(50),
	@QuantityUM nvarchar(25),
	@Company nvarchar(25),
	@GtinEnabled nchar(1),
	@appidentifier nvarchar(10),
	@UserDef1 nvarchar(25),
	@UserDef2 nvarchar(25),
	@UserDef3 nvarchar(25),
	@UserDef4 nvarchar(25),
	@UserDef5 nvarchar(25),
	@UserDef6 nvarchar(25),
	@UserDef7 numeric(19,5),
	@UserDef8 numeric(19,5),
	@UserStamp nvarchar(30),
	@ProcessStamp nvarchar(100),
	@DateTimeStamp datetime
AS
	INSERT INTO ITEM_CROSS_REFERENCE(
		COMPANY,
		DATE_TIME_STAMP,
		ITEM,
		PROCESS_STAMP,
		USER_DEF1,
		USER_DEF2,
		USER_DEF3,
		USER_DEF4,
		USER_DEF5,
		USER_DEF6,
		USER_DEF7,
		USER_DEF8,
		USER_STAMP,
		X_REF_ITEM,
		QUANTITY_UM,
		GTIN_ENABLED,
		APP_IDENTIFIER
	) VALUES (
		@Company,
		@DateTimeStamp,
		@Item,
		@ProcessStamp,
		@UserDef1,
		@UserDef2,
		@UserDef3,
		@UserDef4,
		@UserDef5,
		@UserDef6,
		@UserDef7,
		@UserDef8,
		@UserStamp,
		@XRefItem,
		@QuantityUM,
		 @GtinEnabled,
		@AppIdentifier
	)



