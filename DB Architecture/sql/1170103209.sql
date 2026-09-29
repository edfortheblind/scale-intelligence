-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
 /* [comment omitted] */








CREATE PROCEDURE wm_UItemUnitOfMeasure08
	@Item nvarchar(25),
	@Company nvarchar(25),
	@ItemClass nvarchar(25),
	@QuantityUm nvarchar(25),
	@Sequence numeric(3,0),
	@ConversionQty numeric(14,5)
AS
if(@Item is not null)
BEGIN
	UPDATE ITEM_UNIT_OF_MEASURE SET SEQUENCE=SEQUENCE+1 
	WHERE EXISTS(
		SELECT * FROM ITEM_UNIT_OF_MEASURE 
		WHERE SEQUENCE = @Sequence AND ITEM = @Item AND (COMPANY=@Company OR COMPANY is null)  AND QUANTITY_UM != @QuantityUM ) 
	AND EXISTS(
		SELECT * FROM ITEM_UNIT_OF_MEASURE b 
		WHERE b.SEQUENCE=ITEM_UNIT_OF_MEASURE.SEQUENCE-1 
		AND ITEM = @Item AND (COMPANY=@Company OR COMPANY is null)  AND QUANTITY_UM != @QuantityUM ) 
	
	AND CONVERSION_QTY > @ConversionQty AND ITEM = @Item AND (COMPANY=@Company OR COMPANY is null)  AND QUANTITY_UM != @QuantityUM
END
else
BEGIN
	UPDATE ITEM_UNIT_OF_MEASURE SET SEQUENCE=SEQUENCE+1 
	WHERE EXISTS(
		SELECT * FROM ITEM_UNIT_OF_MEASURE 
		WHERE SEQUENCE = @Sequence AND ITEM_CLASS=@ItemClass AND QUANTITY_UM != @QuantityUM ) 
	AND EXISTS(
		SELECT * FROM ITEM_UNIT_OF_MEASURE b 
		WHERE b.SEQUENCE=ITEM_UNIT_OF_MEASURE.SEQUENCE-1 
		AND ITEM_CLASS=@ItemClass  AND QUANTITY_UM != @QuantityUM ) 
	
	AND CONVERSION_QTY > @ConversionQty AND ITEM_CLASS=@ItemClass  AND QUANTITY_UM != @QuantityUM
END