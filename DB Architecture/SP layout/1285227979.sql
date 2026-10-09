/*
       Mod Number    | Programmer  | Date        | Modification Description
       -------------------------------------------------------------------- 
       243896        | MHM         | 01/14/20    | Created	 
*/

CREATE PROCEDURE MetaTrans_TpmSubmit
@username nvarchar(30),
@culture nvarchar(100)
AS

  SELECT
    N'SCALAR' AS N'EntityType',
    N'DashboardModel' AS N'EntityName',	
	N'' AS Warehouse,
	N'' AS Company;
