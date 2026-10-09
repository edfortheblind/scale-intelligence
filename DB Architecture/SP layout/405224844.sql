/*
       Mod Number    | Programmer  | Date        | Modification Description
       -------------------------------------------------------------------- 
	   237682		 | VS		   | 09/23/19	 | Removed table name and condition.
*/

CREATE PROCEDURE MetaTrans_ApptSchedule
@username nvarchar(30),
@culture nvarchar(100)
AS

select
    N'SCALAR' AS N'EntityType',
    N'ApptScheduleModel' AS N'EntityName',
	@culture as Culture,
	N'' AS Warehouse,
	N'' AS Company