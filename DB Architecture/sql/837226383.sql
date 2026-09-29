-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



		

CREATE PROCEDURE MetaTrans_GetLotUpdateConfirmation
(
@item nvarchar(50) = null,
@company nvarchar(25) = null,
@lot nvarchar(25) = null,
@warehouse nvarchar(25) = null,
@beforeExpirationDate datetime = null,
@afterExpirationDate datetime = null,
@beforeInventoryStatus nvarchar(50) = null,
@afterInventoryStatus nvarchar(50) = null,
@affectedLocation nvarchar(25) = null,
@culture nvarchar(10)
)
AS
	SET NOCOUNT ON;
	
	SELECT 
	TOP 1
	N'<literal:1>' AS N'<literal:2>',	
	N'<literal:3>' AS N'<literal:4>',
	@item AS Item,
	@company AS Company,
	(SELECT DESCRIPTION FROM Item WHERE Item =@item AND ((COMPANY IS NULL AND @company IS NULL) OR COMPANY = @company)) AS ItemDesc,
	@lot AS Lot,	
	@warehouse AS Warehouse,
	@beforeExpirationDate AS BeforeExpirationDate,
	@afterExpirationDate AS AfterExpirationDate,
	@beforeInventoryStatus AS BeforeInventoryStatus,
	@afterInventoryStatus AS AfterInventoryStatus,
	@affectedLocation AS AffectedLocation,
	lot.USER_DEF1 AS UserDefined1,
	lot.USER_DEF2 AS UserDefined2,
	lot.USER_DEF3 AS UserDefined3,
	lot.USER_DEF4 AS UserDefined4,
	lot.USER_DEF5 AS UserDefined5,
	lot.USER_DEF6 AS UserDefined6,
	lot.USER_DEF7 AS UserDefined7,
	lot.USER_DEF8 AS UserDefined8
	FROM LOT lot WHERE ITEM =@item AND ((COMPANY IS NULL AND @company IS NULL) OR COMPANY = @company) AND Lot = @lot
	AND WAREHOUSE=@warehouse