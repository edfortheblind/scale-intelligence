/*              
 Mod Number | Programmer | Date     | Modification Description              
 --------------------------------------------------------------------              
101803      | MHM       | 08/16/12 |Created        
      
This function extract the GenericViewerDataColumn element in xml and returns as table.  
      
Parameters:      
  @endPointData @xml    xml for the request.        
*/   
  
CREATE FUNCTION GetActionEndPointXMLValues  
(  
@endPointData xml  --This xml expects only GenericViewerEndpointData.xsd format
)  
RETURNS @retTable TABLE (  
    ID INT PRIMARY KEY IDENTITY(1,1),--Primary key of the table    
	Name NVARCHAR(max), -- Name of GenericViewerDataColumn element  
	Value NVARCHAR(max), --Value of GenericViewerDataColumn element  
	ViewerRowID INT  -- Row of GenericViewerDataColumn element  
 )   
AS  
BEGIN   
  
 ;WITH XMLNAMESPACES (DEFAULT  N'http://www.manh.com/ILSNET/Utility/GenericViewerEndpointData.xsd')   
 INSERT INTO @retTable(NAME,VALUE)  
 SELECT  
 AEPData.value(N'(Name)[1]', N'Varchar(250)') AS N'Name',  
 AEPData.value(N'(Value)[1]', N'Varchar(250)') AS N'Value'     
 FROM  
 @endPointData.nodes(N'/GenericViewerEndpointData/GenericViewerDataRows/GenericViewerDataRow/GenericViewerDataColumns/GenericViewerDataColumn') AS T(AEPData)  
     
     
 DECLARE @max INT,  
   @i INT,  
   @rowCount INT,  
   @name NVARCHAR(MAX)   
  SELECT @max=MAX(ID) FROM @retTable  
 SET @i=1;  
 SET @rowCount=0;  
 SET @name=(SELECT TOP 1 NAME FROM @retTable)   
  
 WHILE(@i<=@max)  
  BEGIN  
  IF @NAME=(SELECT NAME FROM @retTable WHERE ID=@i)  
   BEGIN  
    SET @rowCount=@rowCount+1;  
    UPDATE @retTable SET ViewerRowID=@rowCount WHERE ID=@i        
   END  
  ELSE  
   BEGIN  
    UPDATE @retTable SET ViewerRowID=@rowCount WHERE ID=@i    
   END        
  SET @i=@i+1;  
  END  
     
 RETURN;    
END  
   
   