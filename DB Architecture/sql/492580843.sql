-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE VIEW AUDIT_LOG_VIEW
AS
SELECT
	al.INTERNAL_ID,
	al.WAREHOUSE,
	al.METHOD_NAME,
	al.CLASS_NAME,
	al.CONTEXT,
	al.RECORD_TYPE,
	al.MACHINE_NAME, 
	al.LOGGED_DATE_TIME,
	al.USER_DEF1 as UD_AUDIT1, 
	al.USER_DEF2 as UD_AUDIT2, 
	al.USER_DEF3 as UD_AUDIT3, 
	al.USER_DEF4 as UD_AUDIT4, 
	al.USER_DEF5 as UD_AUDIT5, 
	al.USER_DEF6 as UD_AUDIT6, 
	al.USER_DEF7 as UD_AUDIT7, 
	al.USER_DEF8 as UD_AUDIT8, 
	al.USER_STAMP,
	al.PROCESS_STAMP,
	al.DATE_TIME_STAMP,
	([dbo].[fn_AuditLogValueReturnValue](0, al.INTERNAL_ID)) as PARM1,
	([dbo].[fn_AuditLogValueReturnValue](1, al.INTERNAL_ID)) as PARM2,
	([dbo].[fn_AuditLogValueReturnValue](2, al.INTERNAL_ID)) as PARM3,
	([dbo].[fn_AuditLogValueReturnValue](3, al.INTERNAL_ID)) as PARM4,
	([dbo].[fn_AuditLogValueReturnValue](4, al.INTERNAL_ID)) as PARM5,
	([dbo].[fn_AuditLogValueReturnValue](5, al.INTERNAL_ID)) as PARM6,
	([dbo].[fn_AuditLogValueReturnValue](6, al.INTERNAL_ID)) as PARM7,
	([dbo].[fn_AuditLogValueReturnValue](7, al.INTERNAL_ID)) as PARM8,
	([dbo].[fn_AuditLogValueReturnValue](8, al.INTERNAL_ID)) as PARM9,
	([dbo].[fn_AuditLogValueReturnValue](9, al.INTERNAL_ID)) as PARM10,
	([dbo].[fn_AuditLogValueReturnValue](10, al.INTERNAL_ID)) as RETURN_VALUE,
	([dbo].[fn_AuditLogValueReturnValue](11, al.INTERNAL_ID)) as CALL_STACK,
	([dbo].[fn_AuditLogValueReturnValue](12, al.INTERNAL_ID)) as AUDIT_EXCEPTION 
FROM AUDIT_LOG al