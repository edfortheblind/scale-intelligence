-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




		

CREATE PROCEDURE MetaDetails_GetLotAttributes
(
@objectId numeric(9),
@archivedLot char(1),
@item nvarchar(50) = null ,
@company nvarchar(25) = null,
@lot nvarchar(25) = null,
@lotTemplate nvarchar(25) = null,
@warehouse nvarchar(25) = null,
@culture nvarchar(10) = null
)
AS
	SET NOCOUNT ON;

IF(@archivedLot = N'<literal:1>')

BEGIN

	IF(@item IS NULL AND @objectId <> 0) 
		BEGIN
			SELECT @lot = LT.LOT,@item = LT.ITEM, @company = LT.COMPANY, @warehouse= LT.WAREHOUSE FROM LOT LT WHERE LT.OBJECT_ID = @objectId;
		END
	ELSE
		BEGIN
			SELECT @objectId = LT.OBJECT_ID FROM LOT LT WHERE 
				(LT.LOT = @lot AND LT.ITEM = @item AND ((LT.COMPANY IS NULL AND @company IS NULL) OR LT.COMPANY = @company) AND LT.WAREHOUSE = @warehouse)
		END

	
	IF(@lotTemplate IS NULL)
		BEGIN							
			SELECT @lotTemplate = LOT_TEMPLATE FROM ITEM WHERE ITEM=@item AND ((COMPANY IS NULL AND @company IS NULL) OR COMPANY = @company);
		END	
														
	SELECT  LAT.OBJECT_ID AS ObjectId,
			LAT.LOT_TEMPLATE,
			LAT.DESCRIPTION AS Attribute,
			LA.VALUE AS Value,
			LAT.AUTO_FILL_TYPE,
       		LAT.AUTO_FILL_FORMAT,
			LAT.PATTERN 
	FROM LOT_ATTRIBUTE_TEMPLATE LAT 			
	LEFT OUTER JOIN 			
	(SELECT VALUE,ATTRIBUTE_TEMPLATE_ID FROM LOT_ATTRIBUTE WHERE LOT_ID=@objectId) LA ON  
	LAT.OBJECT_ID = LA.ATTRIBUTE_TEMPLATE_ID
	WHERE LAT.LOT_TEMPLATE = @lotTemplate;
													
END

ELSE

BEGIN
	
	-- [comment omitted]
	IF(@item IS NULL AND @objectId <> 0) 
		BEGIN
			SELECT @lot = ALT.LOT,@item = ALT.ITEM, @company = ALT.COMPANY, @warehouse= ALT.WAREHOUSE FROM AR_LOT ALT WHERE ALT.OBJECT_ID = @objectId;
		END

	IF(@lotTemplate IS NULL)
		BEGIN							
			SELECT @lotTemplate = LOT_TEMPLATE FROM ITEM WHERE ITEM=@item AND ((COMPANY IS NULL AND @company IS NULL) OR COMPANY = @company);
		END	
	
	SELECT LAT.OBJECT_ID AS ObjectId,
					LAT.LOT_TEMPLATE,
					LAT.DESCRIPTION AS Attribute,
					ALA.VALUE AS Value,
					LAT.AUTO_FILL_TYPE,
       				LAT.AUTO_FILL_FORMAT,
					LAT.PATTERN 
	FROM LOT_ATTRIBUTE_TEMPLATE LAT 
	LEFT OUTER JOIN 			
	(SELECT VALUE,ATTRIBUTE_TEMPLATE_ID FROM AR_LOT_ATTRIBUTE WHERE LOT_ID=@objectId) ALA ON  
	LAT.OBJECT_ID = ALA.ATTRIBUTE_TEMPLATE_ID
	WHERE LAT.LOT_TEMPLATE = @lotTemplate;
				
END