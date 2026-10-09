/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	31011		| AU			| 09/01/24	| Created.
	31305		| AU			| 09/01/24	| Corrected View model.
*/

CREATE PROCEDURE MetaTrans_SignBOL @username nvarchar(30), @culture nvarchar(10)
AS

  SELECT
    N'SCALAR' AS N'EntityType',
    N'SignatureBOLViewModel' AS N'EntityName',
	N'' as N'InternalNum',
	N'false' as N'Initiation',
	N'/scale/dist/signatureBOL/signBOL.component.html' as SignatureBOLTemplate,
    N'' WAREHOUSE,
	N'' AS Company,
	@culture as Culture

	