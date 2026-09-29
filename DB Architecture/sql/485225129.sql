-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE procedure MetaTrans_DbTableInfo(  
@screenControlID nvarchar(100),@culture nvarchar(10))  
AS    
 SET NOCOUNT ON;    
    
 -- [comment omitted]
     
 BEGIN   
 
 DECLARE @Type varchar(2)
 DECLARE @AttibuteValue nvarchar(500)

 SELECT @AttibuteValue =  ATTRIBUTE_VALUE  
   from SCREEN_CONTROL_ATTRIBUTES where  ATTRIBUTE_NAME=N'<literal:1>' and SCREEN_CONTROL_ID=@screenControlID


SELECT @Type = type  from sys.objects where object_id = object_id(@AttibuteValue)
-- [comment omitted]
IF  @Type = N'<literal:2>'
BEGIN
SELECT 
N'<literal:3>' AS N'<literal:4>',    
   N'<literal:5>' AS N'<literal:6>',     
   N'<literal:7>' AS N'<literal:8>',     
   N'<literal:9>' AS N'<literal:10>',
   name AS COLUMN_NAME,
   system_type_name AS COLUMN_DATA_TYPE, 
   (CASE WHEN system_type_name like N'<literal:11>' THEN SUBSTRING(system_type_name, 1, CHARINDEX(N'<literal:12>', system_type_name) - 1) 
   ELSE system_type_name END) AS DATA_TYPE
FROM sys.dm_exec_describe_first_result_set_for_object
(
  OBJECT_ID(@AttibuteValue), 
  NULL
);
END
-- [comment omitted]
ELSE 
BEGIN
  SELECT     
   N'<literal:13>' AS N'<literal:14>',    
   N'<literal:15>' AS N'<literal:16>',     
   N'<literal:17>' AS N'<literal:18>',     
   N'<literal:19>' AS N'<literal:20>',
   (case when DATA_TYPE=N'<literal:21>' then concat(DATA_TYPE,N'<literal:22>', CHARACTER_MAXIMUM_LENGTH, N'<literal:23>')  
when DATA_TYPE=N'<literal:24>' then concat(DATA_TYPE,N'<literal:25>', NUMERIC_PRECISION,N'<literal:26>',NUMERIC_SCALE,N'<literal:27>')
when DATA_TYPE=N'<literal:28>' then concat(DATA_TYPE,N'<literal:29>',NUMERIC_PRECISION,N'<literal:30>')
else DATA_TYPE
END ) AS COLUMN_DATA_TYPE,
   *  
  FROM     
   information_schema.columns where TABLE_NAME = (@AttibuteValue)  
 END 

 END