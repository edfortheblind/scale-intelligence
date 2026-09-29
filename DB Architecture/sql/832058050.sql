-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




CREATE VIEW DOCK_AREA_EMPTY_POSITION
AS
SELECT
	*
FROM
	LOCATION
WHERE
	DOCK_LOCATION_TYPE = 2
	AND 
	LOCATION_STS = N'<literal:1>'