/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	259911      | RM			| 11/17/20	| Created.
	269033		| NRJ			| 06/19/21	| Modified to allow default access to user when no security is configured.
*/
CREATE PROCEDURE SEC_GetCheckpointsWithResourceFileKeys(
	@formId numeric(5), @username nvarchar(30))
AS
	SET NOCOUNT ON;
BEGIN
select sc.RESOURCE_FILE_KEY, case when (t1.CheckPointValue IS NULL OR t1.CheckPointValue = N'Y') then N'true' else N'false' end as CheckPointValue 
from (select Form_id,Check_Point,RESOURCE_FILE_KEY from security_checkpoint where FORM_ID=@FormId) sc 
	left outer join 
	SECfn_GetSecurityCheckPoint(@formId, @username) t1 
	on t1.CheckPointId = sc.Check_Point and sc.Form_id=@FormId 
END;