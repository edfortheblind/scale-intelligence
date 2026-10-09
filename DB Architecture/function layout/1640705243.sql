/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	79731		| SSH			| 02/05/11	| Created.
	82430		| RJR			| 03/22/11	| Fixed attribute comparison for attributes 2-20. Also moved to procedure folder.

	
	Query the LOCATION INVENTORY ATTRIBUTES table to show if attribute values of passed-in 2 attribute ids are same.    
	
	Parameters
		numeric 	attributesId1	Location Inventory Attributes Id.
		numeric		attributesId2   Location Inventory Attributes Id.

				
	Return : 0 if attribute values are different, returns 1 if attribute values are same.
*/


CREATE FUNCTION INVfn_AreInvAttributeValuesSame(
	@attributesId1 numeric(9),
	@attributesId2 numeric(9)	
	) 

RETURNS numeric(9)

AS
BEGIN

	DECLARE @returnValue numeric(9);
	
	SELECT 
        @returnValue = CASE WHEN 
        ISNULL(LIA1.LOC_INV_ATTRIBUTE1, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE1, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE2, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE2, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE3, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE3, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE4, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE4, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE5, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE5, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE6, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE6, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE7, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE7, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE8, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE8, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE9, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE9, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE10, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE10, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE11, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE11, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE12, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE12, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE13, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE13, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE14, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE14, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE15, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE15, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE16, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE16, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE17, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE17, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE18, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE18, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE19, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE19, N'!')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE20, N'!') = ISNULL(LIA2.LOC_INV_ATTRIBUTE20, N'!')
        THEN 1 ELSE 0 END
        FROM 
        LOCATION_INVENTORY_ATTRIBUTES LIA1, LOCATION_INVENTORY_ATTRIBUTES LIA2
        WHERE LIA1.OBJECT_ID = @attributesId1 AND LIA2.OBJECT_ID= @attributesId2; 
	

	RETURN @returnValue;

END -- END INVfn_AreInvAttributeValuesSame



