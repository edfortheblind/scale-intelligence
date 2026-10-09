/*  
 Mod Number | Programmer | Date     | Modification Description  
 --------------------------------------------------------------------  
 21764      | DSK        | 04/29/08 | Created.  
  
This is a wrapper class around the NNR_GetNextNumber.
This procedure will be used through NHibernate.
NOTE: Nhibernate is not providing an easy way to access the stored procedure
specifically In Oracle. Once they provide we might be able to use the original
procedure

*/   
  

CREATE PROCEDURE NNR_GetNextNumberWithResult(  
 @nextNumKey nvarchar(25))  
AS  
 SET NOCOUNT ON;  
 
declare @nextNum nvarchar(25) ;

exec NNR_GetNextNumber @nextNumKey, @nextNum out;

SELECT CAST(@nextNum AS NUMERIC) AS NextNumValue;
-- end NNR_GetNextNumber  
  
  
