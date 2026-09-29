-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















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
        ISNULL(LIA1.LOC_INV_ATTRIBUTE1, N'<literal:1>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE1, N'<literal:2>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE2, N'<literal:3>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE2, N'<literal:4>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE3, N'<literal:5>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE3, N'<literal:6>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE4, N'<literal:7>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE4, N'<literal:8>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE5, N'<literal:9>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE5, N'<literal:10>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE6, N'<literal:11>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE6, N'<literal:12>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE7, N'<literal:13>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE7, N'<literal:14>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE8, N'<literal:15>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE8, N'<literal:16>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE9, N'<literal:17>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE9, N'<literal:18>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE10, N'<literal:19>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE10, N'<literal:20>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE11, N'<literal:21>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE11, N'<literal:22>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE12, N'<literal:23>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE12, N'<literal:24>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE13, N'<literal:25>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE13, N'<literal:26>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE14, N'<literal:27>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE14, N'<literal:28>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE15, N'<literal:29>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE15, N'<literal:30>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE16, N'<literal:31>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE16, N'<literal:32>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE17, N'<literal:33>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE17, N'<literal:34>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE18, N'<literal:35>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE18, N'<literal:36>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE19, N'<literal:37>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE19, N'<literal:38>')
        AND ISNULL(LIA1.LOC_INV_ATTRIBUTE20, N'<literal:39>') = ISNULL(LIA2.LOC_INV_ATTRIBUTE20, N'<literal:40>')
        THEN 1 ELSE 0 END
        FROM 
        LOCATION_INVENTORY_ATTRIBUTES LIA1, LOCATION_INVENTORY_ATTRIBUTES LIA2
        WHERE LIA1.OBJECT_ID = @attributesId1 AND LIA2.OBJECT_ID= @attributesId2; 
	

	RETURN @returnValue;

END -- [comment omitted]



