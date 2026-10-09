/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	204167		| MMM			| 05/16/17	| Created.
*/

CREATE PROCEDURE MetaTrans_GetLocatingZones
AS

SELECT 
	ZONE, 
	DESCRIPTION
FROM ZONE zn
WHERE 
	ACTIVE = N'Y' 
	AND ZONE_TYPE = N'Locating'
ORDER BY zn.ZONE ASC;




