-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE MetaTrans_GetLocationTypes
AS

SELECT 
	LOCATION_TYPE AS LOCATIONTYPE, 
	LENGTH, 
	WIDTH, 
	HEIGHT, 
	DIMENSION_UM AS UM 
FROM LOCATION_TYPE lt 
WHERE ACTIVE = N'<literal:1>' 
ORDER BY lt.LOCATION_TYPE ASC;




