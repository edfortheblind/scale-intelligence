-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




CREATE VIEW DOCK_MGR_SHIPPING_LOAD
AS
SELECT 
	sl.*,
	trailingSts.STATUS_NAME AS TRAILING_STS_DESCRIPTION,
	leadingSts.STATUS_NAME AS LEADING_STS_DESCRIPTION
FROM 
	SHIPPING_LOAD sl,
	FUNCTIONAL_AREA_STATUS_FLOW trailingSts,
	FUNCTIONAL_AREA_STATUS_FLOW leadingSts
WHERE 
	trailingSts.FUNCTIONAL_AREA = N'<literal:1>'
	AND
	leadingSts.FUNCTIONAL_AREA = N'<literal:2>'
    	AND
	trailingSts.STATUS = sl.TRAILING_STS
	AND
    	leadingSts.STATUS = sl.LEADING_STS;