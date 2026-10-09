/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	219735	| RSP	| 04/24/18	| Created.	
*/

CREATE PROCEDURE MetaTrans_ReprintWaveDocs
(
	@internalLaunchNum numeric(9) ,  
	@culture nvarchar(10)
)
AS
       SET NOCOUNT ON;

	   --company and warehouse are required to check on access
	   SELECT 
	   N'SCALAR' AS N'EntityType',
	   N'LaunchStatistics' AS N'EntityName', 
	   LAUNCH_STATISTICS.INTERNAL_LAUNCH_NUM AS N'InternalLaunchNum', 
	   N'' AS N'Company' ,
	   LAUNCH_STATISTICS.warehouse AS N'Warehouse'
	   FROM LAUNCH_STATISTICS WHERE           
	   LAUNCH_STATISTICS.INTERNAL_LAUNCH_NUM = @internalLaunchNum ;
