-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE FUNCTION [dbo].[DATEONLY]          -- [comment omitted]
(@date datetime)                     -- [comment omitted]
RETURNS SMALLDATETIME                          -- [comment omitted]
AS  
BEGIN                                -- [comment omitted]
RETURN  CONVERT(SMALLDATETIME, CONVERT(CHAR(11), @date), 101)     -- [comment omitted]
END