/*            
 Mod Number | Programmer | Date     | Modification Description            
 --------------------------------------------------------------------            
101803        | MHM       | 08/07/12 |Created      
112925        | SP        | 08/01/13 |Added optional param @xmlnsDeclarations to support xml data with namespace declarations
143126		  | VER		  | 05/27/14 |Removed [] for the Procedure name for the script precompiler to work properly.

This SP returns the attribute value based on attribute name.    
     
Parameters:    
  @xml       XML            xml data
  @nodeXpath nvarchar(max)  element path.  
  @nodeValue nvarchar(max)  attribute value to output.  
  @xmlnsDeclarations nvarchar(max) The full list of xml namespace declarations (if any)

  Note- see msdn.microsoft.com/en-us/library/ms177400.aspx for syntax for @xmlnsDeclarations
*/   
 
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
          
	DECLARE @Script NVARCHAR(MAX) = N''
	if (@xmlnsDeclarations is not null and ltrim(@xmlnsDeclarations) <> N'')
		set @Script = N'WITH XMLNAMESPACES (' + @xmlnsDeclarations + N') '
	SET @Script= @Script +      
			N'SELECT    
			 doc.col.value(''(.)'', ''nvarchar(max)'') AttributeValue    
			 FROM @content.nodes('''+@nodeXpath+N''') doc(col)'       
  
	DECLARE @temp TABLE   
	(  
	value NVARCHAR(MAX)  
	)  

	INSERT @temp   
	EXEC sp_executesql @Script, N'@content xml',@content = @xml
  
	SELECT @nodeValue=value FROM @temp
END    
  
  
  