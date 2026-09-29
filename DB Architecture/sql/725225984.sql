-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE MetaTrans_GetLocatingZones
AS

SELECT 
	ZONE, 
	DESCRIPTION
FROM ZONE zn
WHERE 
	ACTIVE = N'<literal:1>' 
	AND ZONE_TYPE = N'<literal:2>'
ORDER BY zn.ZONE ASC;




