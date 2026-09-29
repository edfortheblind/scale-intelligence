-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE VIEW GET_CLIENT_SSO_VIEW
AS
		SELECT 
		SYS_KEY,
		SYSTEM_VALUE
		from SYSTEM_CONFIG_DETAIL 
		where RECORD_TYPE=CASE WHEN dbo.fn_GetFeatureEnabled(N'<literal:1>', NULL) = N'<literal:2>' THEN N'<literal:3>' ELSE N'<literal:4>' END

		UNION

		SELECT 
		SYS_KEY,
		SYSTEM_VALUE
		from SYSTEM_CONFIG_DETAIL 
		where SYS_KEY=N'<literal:5>'


