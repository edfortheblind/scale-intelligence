-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















   
 
CREATE PROCEDURE GetXMLAttributeValueByAttributeName
(    
@xml XML,    
@nodeXpath NVARCHAR(MAX),  
@nodeValue NVARCHAR(MAX) OUTPUT,
@xmlnsDeclarations NVARCHAR(MAX) = NULL  
)  
AS    
BEGIN  
SET NOCOUNT ON; 
          
	DECLARE @Script NVARCHAR(MAX) = N'<literal:1>'
	if (@xmlnsDeclarations is not null and ltrim(@xmlnsDeclarations) <> N'<literal:2>')
		set @Script = N'<literal:3>' + @xmlnsDeclarations + N'<literal:4>'
	SET @Script= @Script +      
			N'<literal:5>'

+@nodeXpath+N'<literal:6>'       
  
	DECLARE @temp TABLE   
	(  
	value NVARCHAR(MAX)  
	)  

	INSERT @temp   
	EXEC sp_executesql @Script, N'<literal:7>',@content = @xml
  
	SELECT @nodeValue=value FROM @temp
END    
  
  
  