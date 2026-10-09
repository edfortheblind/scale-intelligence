/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	16414	| PKN	| 07/22/05	| Created
*/

CREATE PROCEDURE wm_ILot01
	@ObjectId numeric(9) OUTPUT,
	@LotTemplate nvarchar(25),
	@Lot nvarchar(25),
	@Item nvarchar(50),
	@Company nvarchar(25),
	@Warehouse nvarchar(25),
	@ExpirationDate datetime,
	@Frozen nchar(1),
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
	INSERT INTO LOT(
		LOT_TEMPLATE,
		LOT,
		ITEM,
		COMPANY,
		WAREHOUSE,
		EXPIRATION_DATE,
		FROZEN,
		USER_DEF1,
		USER_DEF2,
		USER_DEF3,
		USER_DEF4,
		USER_DEF5,
		USER_DEF6,
		USER_DEF7,
		USER_DEF8,
		USER_STAMP,
		PROCESS_STAMP,
		DATE_TIME_STAMP
       	) VALUES (
		@LotTemplate,
		@Lot,
		@Item,
		@Company,
		@Warehouse,
		@ExpirationDate,
		@Frozen,
		@UserDef1,
		@UserDef2,
		@UserDef3,
		@UserDef4,
		@UserDef5,
		@UserDef6,
		@UserDef7,
		@UserDef8,
		@UserStamp,
		@ProcessStamp,
		@DateTimeStamp
	)
	SELECT @ObjectId = SCOPE_IDENTITY()


