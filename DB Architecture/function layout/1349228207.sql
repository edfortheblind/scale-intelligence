/*              
 Mod Number | Programmer	| Date     | Modification Description              
 --------------------------------------------------------------------              
 231876     | SHS		    | 04/22/19 | Created        
      
 Function to add or remove values from given character separated string list.  
      
Parameters:
 @originalList				- Character separated string list which needs to be modified
 @valuesToAdd				- Character separated string list which needs to be added to original list
 @valuesToRemove			- Character separated string list which needs to be removed from original list     
*/   
  
CREATE FUNCTION ModifyCharacterSeparatedStringList  
(  
	@originalList nvarchar(max),
	@valuesToAdd nvarchar(max),
	@valuesToRemove nvarchar(max),
	@separator nvarchar(1)
)  
RETURNS nvarchar(max)					-- Character separated string list - updated list
AS  
BEGIN
		
	-- Holds modified list which will be returned back to the caller
	declare @updatedList nvarchar(max); 
	declare @originalListXml xml, @additionListXml xml, @removalListXml xml;

	SELECT @originalListXml = CONVERT(xml,N'<root><s>' + REPLACE(@originalList,@separator,N'</s><s>') + N'</s></root>')
	SELECT @additionListXml = CONVERT(xml,N'<root><s>' + REPLACE(@valuesToAdd,@separator,N'</s><s>') + N'</s></root>')
	SELECT @removalListXml = CONVERT(xml,N'<root><s>' + REPLACE(@valuesToRemove,@separator,N'</s><s>') + N'</s></root>')

	SET @updatedList = N'';
	SELECT  @updatedList = @updatedList + Value + @separator  
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
   
   