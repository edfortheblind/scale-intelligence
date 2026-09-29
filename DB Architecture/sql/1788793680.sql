-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


CREATE PROCEDURE [dbo].[TRAV_EXEC_PROC]
	 @InvlocNumbers NVARCHAR(MAX),  
	 @Warehouse NVARCHAR(50),
	@success NVARCHAR(50) OUTPUT,  
	@error NVARCHAR(50) OUTPUT,
	@Username NVARCHAR (max)
AS
BEGIN


	    DECLARE @SQL NVARCHAR(MAX) = N'<literal:1>'
















































    EXEC sp_executesql @SQL;

	
    
	

END
