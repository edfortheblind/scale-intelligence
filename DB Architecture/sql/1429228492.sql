-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










   
  

CREATE PROCEDURE NNR_GetNextNumberWithResult(  
 @nextNumKey nvarchar(25))  
AS  
 SET NOCOUNT ON;  
 
declare @nextNum nvarchar(25) ;

exec NNR_GetNextNumber @nextNumKey, @nextNum out;

SELECT CAST(@nextNum AS NUMERIC) AS NextNumValue;
-- [comment omitted]
  
  
