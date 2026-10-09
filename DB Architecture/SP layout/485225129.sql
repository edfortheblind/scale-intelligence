CREATE procedure MetaTrans_DbTableInfo(  
@screenControlID nvarchar(100),@culture nvarchar(10))  
AS    
 SET NOCOUNT ON;    
    
 -- please note company and warehouse are required    
     
 BEGIN   
 
 DECLARE @Type varchar(2)
 DECLARE @AttibuteValue nvarchar(500)

 SELECT @AttibuteValue =  ATTRIBUTE_VALUE  
   from SCREEN_CONTROL_ATTRIBUTES where  ATTRIBUTE_NAME=N'data-dbtable' and SCREEN_CONTROL_ID=@screenControlID


SELECT @Type = type  from sys.objects where object_id = object_id(@AttibuteValue)
--if object type is storedprocedure get column info from dm_exec_describe_first_result_set_for_object
IF  @Type = N'P'
BEGIN
SELECT 
N'SCALAR' AS N'EntityType',    
   N'DbTableInfo' AS N'EntityName',     
   N'' AS N'WAREHOUSE',     
   N'' AS N'COMPANY',
   name AS COLUMN_NAME,
   system_type_name AS COLUMN_DATA_TYPE, 
   (CASE WHEN system_type_name like N'%(%' THEN SUBSTRING(system_type_name, 1, CHARINDEX(N'(', system_type_name) - 1) 
   ELSE system_type_name END) AS DATA_TYPE
FROM sys.dm_exec_describe_first_result_set_for_object
(
  OBJECT_ID(@AttibuteValue), 
  NULL
);
END
--else if object is table or view get column info from information_schema.columns
ELSE 
BEGIN
  SELECT     
   N'SCALAR' AS N'EntityType',    
   N'DbTableInfo' AS N'EntityName',     
   N'' AS N'WAREHOUSE',     
   N'' AS N'COMPANY',
   (case when DATA_TYPE=N'nvarchar' then concat(DATA_TYPE,N'(', CHARACTER_MAXIMUM_LENGTH, N')')  
when DATA_TYPE=N'numeric' then concat(DATA_TYPE,N'(', NUMERIC_PRECISION,N',',NUMERIC_SCALE,N')')
when DATA_TYPE=N'int' then concat(DATA_TYPE,N'(',NUMERIC_PRECISION,N')')
else DATA_TYPE
END ) AS COLUMN_DATA_TYPE,
   *  
  FROM     
   information_schema.columns where TABLE_NAME = (@AttibuteValue)  
 END 

 END