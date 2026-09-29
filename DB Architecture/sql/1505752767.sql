-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE SEC_GetCheckpointsWithResourceFileKeys(
	@formId numeric(5), @username nvarchar(30))
AS
	SET NOCOUNT ON;
BEGIN
select sc.RESOURCE_FILE_KEY, case when (t1.CheckPointValue IS NULL OR t1.CheckPointValue = N'<literal:1>') then N'<literal:2>' else N'<literal:3>' end as CheckPointValue 
from (select Form_id,Check_Point,RESOURCE_FILE_KEY from security_checkpoint where FORM_ID=@FormId) sc 
	left outer join 
	SECfn_GetSecurityCheckPoint(@formId, @username) t1 
	on t1.CheckPointId = sc.Check_Point and sc.Form_id=@FormId 
END;