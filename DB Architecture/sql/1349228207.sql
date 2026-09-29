-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










   
  
CREATE FUNCTION ModifyCharacterSeparatedStringList  
(  
	@originalList nvarchar(max),
	@valuesToAdd nvarchar(max),
	@valuesToRemove nvarchar(max),
	@separator nvarchar(1)
)  
RETURNS nvarchar(max)					-- [comment omitted]
AS  
BEGIN
		
	-- [comment omitted]
	declare @updatedList nvarchar(max); 
	declare @originalListXml xml, @additionListXml xml, @removalListXml xml;

	SELECT @originalListXml = CONVERT(xml,N'<literal:1>' + REPLACE(@originalList,@separator,N'<literal:2>') + N'<literal:3>')
	SELECT @additionListXml = CONVERT(xml,N'<literal:4>' + REPLACE(@valuesToAdd,@separator,N'<literal:5>') + N'<literal:6>')
	SELECT @removalListXml = CONVERT(xml,N'<literal:7>' + REPLACE(@valuesToRemove,@separator,N'<literal:8>') + N'<literal:9>')

	SET @updatedList = N'<literal:10>';
	SELECT  @updatedList = @updatedList + Value + @separator  
	FROM 
		(	
			(
				SELECT *
				FROM 
					(
						SELECT [Value] = T.c.value(N'<literal:11>',N'<literal:12>') 
						FROM @originalListXml.nodes(N'<literal:13>') T(c)
					) ol
				WHERE ol.Value IS NOT NULL AND ol.Value <> N'<literal:14>'
			)
			UNION
			(
				SELECT *
				FROM 
					(
						SELECT [Value] = T.c.value(N'<literal:15>',N'<literal:16>') 
						FROM @additionListXml.nodes(N'<literal:17>') T(c)
					) al
				WHERE al.Value IS NOT NULL AND al.Value <> N'<literal:18>'
			)
		) mergedValues
	WHERE 
		mergedValues.Value NOT IN 
		(
			SELECT *
			FROM 
				(
					SELECT [Value] = T.c.value(N'<literal:19>',N'<literal:20>') 
					FROM @removalListXml.nodes(N'<literal:21>') T(c)
				) rl
			WHERE rl.Value IS NOT NULL AND rl.Value <> N'<literal:22>'
		)
	
	SET @updatedList = substring(@updatedList, 0, len(@updatedList))
     
	RETURN @updatedList;
END  
   
   