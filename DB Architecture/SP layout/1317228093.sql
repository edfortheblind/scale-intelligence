/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	184269		| SSD			| 08/18/16	| created
	191074		| DN			| 01/23/17	| Updated parameter types
*/
CREATE PROCEDURE MetaTrans_WavePrinterSelection
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
	   CLOSED=N'N' AND
	   LAUNCH_STATISTICS.INTERNAL_LAUNCH_NUM = @internalLaunchNum ;

	   
