/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	16414	| PKN	| 07/25/05	| Created
*/


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
	isnull(Company, N'!') = isnull(@Company,N'!') and
	Warehouse = @Warehouse




