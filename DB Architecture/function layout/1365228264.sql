/*              
 Mod Number | Programmer	| Date     | Modification Description              
 --------------------------------------------------------------------              
 147034		| MMM			| 10/17/14 | Created        
      
 Function to add or remove values from given comma separated string list. This is used from Field Restrictions - Modify exit point program to modify comma separated field restrictions. 
      
Parameters:
 @originalList				- Comma separated string list which needs to be modified
 @valuesToAdd				- Comma separated string list which needs to be added to original list
 @valuesToRemove			- Comma separated string list which needs to be removed from original list     
*/   
  
CREATE FUNCTION ModifyCommaSeparatedStringList  
(  
	@originalList nvarchar(max),
	@valuesToAdd nvarchar(max),
	@valuesToRemove nvarchar(max)
)  
RETURNS nvarchar(max)					-- Comma separated string list - updated list
AS  
BEGIN
	-- Holds field separator character i.e. ','
	declare @separator varchar(1);
	set @separator = N',';

	-- Holds modified list which will be returned back to the caller
	declare @updatedList nvarchar(max); 
	declare @originalListXml xml, @additionListXml xml, @removalListXml xml;

	SELECT @originalListXml = CONVERT(xml,N'<root><s>' + REPLACE(@originalList,@separator,N'</s><s>') + N'</s></root>')
	SELECT @additionListXml = CONVERT(xml,N'<root><s>' + REPLACE(@valuesToAdd,@separator,N'</s><s>') + N'</s></root>')
	SELECT @removalListXml = CONVERT(xml,N'<root><s>' + REPLACE(@valuesToRemove,@separator,N'</s><s>') + N'</s></root>')

	SET @updatedList = N'';
	SELECT  @updatedList = @updatedList + Value + N',' 
	FROM 
		(	
			(
				SELECT *
				FROM 
					(
						SELECT [Value] = T.c.value(N'.',N'nvarchar(100)') 
						FROM @originalListXml.nodes(N'/root/s') T(c)
					) ol
				WHERE ol.Value IS NOT NULL AND ol.Value <> N''
			)
			UNION
			(
				SELECT *
				FROM 
					(
						SELECT [Value] = T.c.value(N'.',N'nvarchar(100)') 
						FROM @additionListXml.nodes(N'/root/s') T(c)
					) al
				WHERE al.Value IS NOT NULL AND al.Value <> N''
			)
		) mergedValues
	WHERE 
		mergedValues.Value NOT IN 
		(
			SELECT *
			FROM 
				(
					SELECT [Value] = T.c.value(N'.',N'nvarchar(100)') 
					FROM @removalListXml.nodes(N'/root/s') T(c)
				) rl
			WHERE rl.Value IS NOT NULL AND rl.Value <> N''
		)
	
	SET @updatedList = substring(@updatedList, 0, len(@updatedList))
     
	RETURN @updatedList;
END  
   
   