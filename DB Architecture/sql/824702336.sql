-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








   
  
CREATE FUNCTION GetActionEndPointXMLValues  
(  
@endPointData xml  -- [comment omitted]
)  
RETURNS @retTable TABLE (  
    ID INT PRIMARY KEY IDENTITY(1,1),-- [comment omitted]
	Name NVARCHAR(max), -- [comment omitted]
	Value NVARCHAR(max), -- [comment omitted]
	ViewerRowID INT  -- [comment omitted]
 )   
AS  
BEGIN   
  
 ;WITH XMLNAMESPACES (DEFAULT  N'<literal:1>')   
 INSERT INTO @retTable(NAME,VALUE)  
 SELECT  
 AEPData.value(N'<literal:2>', N'<literal:3>') AS N'<literal:4>',  
 AEPData.value(N'<literal:5>', N'<literal:6>') AS N'<literal:7>'     
 FROM  
 @endPointData.nodes(N'<literal:8>') AS T(AEPData)  
     
     
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
   
   