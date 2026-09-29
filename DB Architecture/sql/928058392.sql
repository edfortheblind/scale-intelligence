-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




CREATE VIEW DOCK_MGR_SHIPMENT_HEADER
AS
SELECT 
	sh.*,
	trailingSts.STATUS_NAME AS TRAILING_STS_DESCRIPTION,
	leadingSts.STATUS_NAME AS LEADING_STS_DESCRIPTION
FROM 
	SHIPMENT_HEADER sh,
	FUNCTIONAL_AREA_STATUS_FLOW trailingSts,
	FUNCTIONAL_AREA_STATUS_FLOW leadingSts
WHERE 
	trailingSts.FUNCTIONAL_AREA = N'<literal:1>'
	AND
	leadingSts.FUNCTIONAL_AREA = N'<literal:2>'
    	AND
	trailingSts.STATUS = sh.TRAILING_STS
	AND
    	leadingSts.STATUS = sh.LEADING_STS;