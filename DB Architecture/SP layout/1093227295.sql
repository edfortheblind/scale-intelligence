/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	181000		| MDL			| 07/12/16	| Created.
*/

CREATE PROCEDURE MetaTrans_ManualReplenishment @internalNum int, @culture nvarchar(10)
AS
  SELECT
    N'SCALAR' AS N'EntityType',
    N'ManualReplenishment' AS N'EntityName',
	dbo.RSCMfn_RtrvResource(N'MSG_RPL01',N'Msg',@culture) as N'MSG_RPL01',
    N'' WAREHOUSE,
    N'' AS Company