
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	186286	| RS	| 09/15/16	| Created.	
	187602  | RS    | 10/14/16  | Added LabelMasterId.
	191074	| DN	| 01/23/17	| Updated parameter types
*/


CREATE PROCEDURE MetaTrans_ReprintWaveLabels
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
	   LAUNCH_STATISTICS.LABEL_MASTER_ID AS N'LabelMasterId',
	   LAUNCH_STATISTICS.warehouse AS N'Warehouse'
	   FROM LAUNCH_STATISTICS WHERE           
	   LAUNCH_STATISTICS.INTERNAL_LAUNCH_NUM = @internalLaunchNum ;
