-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










   
  
CREATE FUNCTION ModifyCommaSeparatedStringList  
(  
	@originalList nvarchar(max),
	@valuesToAdd nvarchar(max),
	@valuesToRemove nvarchar(max)
)  
RETURNS nvarchar(max)					-- [comment omitted]
AS  
BEGIN
	-- [comment omitted]
	declare @separator varchar(1);
	set @separator = N'<literal:1>';

	-- [comment omitted]
	declare @updatedList nvarchar(max); 
	declare @originalListXml xml, @additionListXml xml, @removalListXml xml;

	SELECT @originalListXml = CONVERT(xml,N'<literal:2>' + REPLACE(@originalList,@separator,N'<literal:3>') + N'<literal:4>')
	SELECT @additionListXml = CONVERT(xml,N'<literal:5>' + REPLACE(@valuesToAdd,@separator,N'<literal:6>') + N'<literal:7>')
	SELECT @removalListXml = CONVERT(xml,N'<literal:8>' + REPLACE(@valuesToRemove,@separator,N'<literal:9>') + N'<literal:10>')

	SET @updatedList = N'<literal:11>';
	SELECT  @updatedList = @updatedList + Value + N'<literal:12>' 
	FROM 
		(	
			(
				SELECT *
				FROM 
					(
						SELECT [Value] = T.c.value(N'<literal:13>',N'<literal:14>') 
						FROM @originalListXml.nodes(N'<literal:15>') T(c)
					) ol
				WHERE ol.Value IS NOT NULL AND ol.Value <> N'<literal:16>'
			)
			UNION
			(
				SELECT *
				FROM 
					(
						SELECT [Value] = T.c.value(N'<literal:17>',N'<literal:18>') 
						FROM @additionListXml.nodes(N'<literal:19>') T(c)
					) al
				WHERE al.Value IS NOT NULL AND al.Value <> N'<literal:20>'
			)
		) mergedValues
	WHERE 
		mergedValues.Value NOT IN 
		(
			SELECT *
			FROM 
				(
					SELECT [Value] = T.c.value(N'<literal:21>',N'<literal:22>') 
					FROM @removalListXml.nodes(N'<literal:23>') T(c)
				) rl
			WHERE rl.Value IS NOT NULL AND rl.Value <> N'<literal:24>'
		)
	
	SET @updatedList = substring(@updatedList, 0, len(@updatedList))
     
	RETURN @updatedList;
END  
   
   