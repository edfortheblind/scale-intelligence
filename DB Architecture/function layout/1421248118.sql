
CREATE FUNCTION [dbo].[DATEONLY]          -- function name  
(@date datetime)                     -- input parameter name and data type  
RETURNS SMALLDATETIME                          -- return parameter data type  
AS  
BEGIN                                -- begin body definition  
RETURN  CONVERT(SMALLDATETIME, CONVERT(CHAR(11), @date), 101)     -- action performed  
END