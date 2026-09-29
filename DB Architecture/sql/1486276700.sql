-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RLot01
	@Lot nvarchar(25),
	@Item nvarchar(50),
	@Company nvarchar(25),
	@Warehouse nvarchar(25)
	
AS
	SELECT * FROM LOT
        WHERE 
	Lot = @Lot and 
	Item = @Item and
	isnull(Company, N'<literal:1>') = isnull(@Company,N'<literal:2>') and
	Warehouse = @Warehouse




