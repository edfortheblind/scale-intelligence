/*  
  
Mod Number  | Programmer | Date     | Modification Description  
 --------------------------------------------------------------------  
 71121		| SPJ		 | 07/26/10 | Created. 
 88493		| MDL		 | 09/01/11	| Modify to handle the LUOM for override location correctly .	  
 
Inserts LocationUm records into Location_Unit_Of_measure Table.
Takes care of Inserting LocationUM records in case of full LP, partial LP transfer,Lot Transfer.
Also handles Inserting LocationUM records in case of positive adjustment,warehouse transfer as well.
	
	Parameters
		String	@stToLoc		The destination Location
		Numeric	@iIntLocInv		InternalLocationInventory of the destination Location
		Numeric	@intContNum	    InternalContainerNumber of the Receipt Container
		String	@stUserName		The current User.
		char	@isPartial		Identifier for full or partial LP transfer
		Numeric	@fromIntLocInv	InternalLocationInventory of the Source Location.
 
*/  
  
CREATE PROCEDURE INV_CopyLocUmsForDestInventory  
(   
 @stToLoc nvarchar(25),  
 @iIntLocInv numeric(9),
 @intContNum numeric(9),  
 @stUserName nvarchar(30),
 @isPartial char(1),  
 @fromIntLocInv numeric(9)  
)  
AS  
BEGIN
  
	IF (@isPartial = N'N' and @fromIntLocInv IS NULL)
	RETURN   
 
	INSERT INTO LOCATION_UNIT_OF_MEASURE 
	(  
	ITEM, COMPANY,INTERNAL_CONTAINER_NUM, SEQUENCE, QUANTITY_UM, CONVERSION_QTY, LENGTH, WIDTH, 
	HEIGHT, DIMENSION_UM, WEIGHT, WEIGHT_UM, USER_DEF1, USER_DEF2, USER_DEF3, USER_DEF4,  
	USER_DEF5, USER_DEF6,USER_DEF7, USER_DEF8, USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP,  
	TREAT_FULL_PCT, WAREHOUSE, LOCATION, MOVEMENT_CLS, TREAT_AS_LOOSE, EPC_PACKAGE_ID, 
	INTERNAL_LOCATION_INV  
	 )
	SELECT DISTINCT  
		LUM.ITEM, LUM.COMPANY, NULL,
		LUM.SEQUENCE, LUM.QUANTITY_UM, LUM.CONVERSION_QTY, LUM.LENGTH, LUM.WIDTH,
		LUM.HEIGHT, LUM.DIMENSION_UM, LUM.WEIGHT, LUM.WEIGHT_UM, LI.USER_DEF1, 
		LI.USER_DEF2, LI.USER_DEF3, LI.USER_DEF4,  
		LI.USER_DEF5, LI.USER_DEF6, LI.USER_DEF7, 
		LI.USER_DEF8,  @stUserName , N'INV_PutintoLocation',   
		GETUTCDATE(), LUM.TREAT_FULL_PCT,  
		LI.WAREHOUSE , @stToLoc , LUM.MOVEMENT_CLS, 
		LUM.TREAT_AS_LOOSE,LUM.EPC_PACKAGE_ID,LI.INTERNAL_LOCATION_INV    
	FROM LOCATION_UNIT_OF_MEASURE LUM  
		INNER JOIN LOCATION_INVENTORY LI  
		ON LUM.ITEM=LI.ITEM  
			AND (
					(LUM.COMPANY=LI.COMPANY AND LUM.COMPANY IS NOT NULL)
					OR 
					(LUM.COMPANY IS NULL AND LI.COMPANY IS NULL)
				)
			AND LI.LOCATION= @stToLoc 
			AND (
					(@isPartial <>N'Y' AND LI.INTERNAL_LOCATION_INV <> @iIntLocInv  
					AND LUM.INTERNAL_LOCATION_INV = @iIntLocInv )
				OR
					(@isPartial =N'Y'  AND LUM.INTERNAL_LOCATION_INV = @fromIntLocInv )
				)
			        
			AND (				
					(@intContNum IS NOT NULL AND LUM.INTERNAL_CONTAINER_NUM = @intContNum)
				OR 
					(LUM.INTERNAL_CONTAINER_NUM IS NULL)
				)			
			
END