/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14665	| RR		| 06/01/04	| created
	15173	| TDL		| 09/23/04	| Made Multi-Byte safe and to have the right values for the field lengths
*/




CREATE PROCEDURE wm_RItemUnitOfMeasure07

	@Item nvarchar(25),
	@Company nvarchar(25),
	@ItemClass nvarchar(25),
	@QuantityUM nvarchar(25)

AS
	declare @iSequence numeric(3)

--If ITEM is NULL then use ItemClass in query.
IF(@Item is not null)
BEGIN
	SELECT @iSequence =stDtl.SEQUENCE
	FROM ITEM_UNIT_OF_MEASURE itmUm RIGHT OUTER JOIN
        	STORAGE_TEMPLATE_DETAIL stDtl ON itmUm.QUANTITY_UM = stDtl.UNIT_OF_MEASURE AND ITEM =@Item AND (COMPANY=@Company OR COMPANY IS NULL)
	WHERE stDtl.STORAGE_TEMPLATE =
              (SELECT TOP 1 CASE WHEN STORAGE_TEMPLATE IS NOT NULL THEN STORAGE_TEMPLATE ELSE N'*Default' END
              FROM ITEM WHERE ITEM =@Item AND (COMPANY=@Company OR COMPANY IS NULL)) AND stDtl.UNIT_OF_MEASURE =@QuantityUM
END
else
BEGIN
	SELECT @iSequence =stDtl.SEQUENCE
	FROM ITEM_UNIT_OF_MEASURE itmUm RIGHT OUTER JOIN
                STORAGE_TEMPLATE_DETAIL stDtl ON itmUm.QUANTITY_UM = stDtl.UNIT_OF_MEASURE AND ITEM_CLASS=@ItemClass
	WHERE stDtl.STORAGE_TEMPLATE =
                (SELECT TOP 1 CASE WHEN STORAGE_TEMPLATE IS NOT NULL THEN STORAGE_TEMPLATE ELSE N'*Default' END
                FROM ITEM WHERE ITEM_CLASS=@ItemClass) AND stDtl.UNIT_OF_MEASURE =@QuantityUM
END


if(@iSequence < 1)
begin
      	select -1 SEQUENCE;
end
else
begin

--If ITEM is NULL then use ItemClass in query.
if(@Item is not null)
	BEGIN

	SELECT     ISNULL(MAX(SEQUENCE),0)+1  SEQUENCE
		FROM         ITEM_UNIT_OF_MEASURE
		WHERE     ITEM = @Item AND (COMPANY=@Company OR COMPANY IS NULL)  AND QUANTITY_UM IN
		                          (SELECT     UNIT_OF_MEASURE
		                            FROM          STORAGE_TEMPLATE_DETAIL
		                            WHERE      STORAGE_TEMPLATE =
		                                                       (SELECT     TOP 1 CASE WHEN STORAGE_TEMPLATE IS NOT NULL THEN STORAGE_TEMPLATE ELSE N'*Default' END
		                                                         FROM          ITEM
		                                                         WHERE      ITEM = @Item AND (COMPANY=@Company OR COMPANY IS NULL)) AND SEQUENCE < @iSequence)
	END
else
	BEGIN
	
	SELECT     ISNULL(MAX(SEQUENCE),0)+1  SEQUENCE
	FROM         ITEM_UNIT_OF_MEASURE
	WHERE    ITEM_CLASS=@ItemClass  AND QUANTITY_UM IN
	                          (SELECT     UNIT_OF_MEASURE
	                            FROM          STORAGE_TEMPLATE_DETAIL
	                            WHERE      STORAGE_TEMPLATE =
	                                                       (SELECT     TOP 1 CASE WHEN STORAGE_TEMPLATE IS NOT NULL THEN STORAGE_TEMPLATE ELSE N'*Default' END
	                                                         FROM          ITEM
	                                                         WHERE    ITEM_CLASS=@ItemClass) AND SEQUENCE < @iSequence)
	
	
	END
END