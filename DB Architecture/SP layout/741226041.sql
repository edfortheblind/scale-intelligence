/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	204167		| MMM			| 05/16/17	| Created.
*/

CREATE PROCEDURE MetaTrans_GetLocationTypes
AS

SELECT 
	LOCATION_TYPE AS LOCATIONTYPE, 
	LENGTH, 
	WIDTH, 
	HEIGHT, 
	DIMENSION_UM AS UM 
FROM LOCATION_TYPE lt 
WHERE ACTIVE = N'Y' 
ORDER BY lt.LOCATION_TYPE ASC;




