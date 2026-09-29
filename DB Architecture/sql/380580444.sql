-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE VIEW SHIP_HEADER_DOCK_AREA_ON_HAND
AS
SELECT DISTINCT
	da.object_id as DOCK_AREA,
	shv.*,
	trailingSts.STATUS_NAME AS TRAILING_STS_DESCRIPTION,
	leadingSts.STATUS_NAME AS LEADING_STS_DESCRIPTION,

	-- [comment omitted]
    -- [comment omitted]
	(cast(da.OBJECT_ID as nvarchar(9)) + N'<literal:1>' + cast(shv.INTERNAL_SHIPMENT_NUM as nvarchar(9))) AS ID,

	-- [comment omitted]
    CAST(Case when oh.internal_shipment_num is not null then N'<literal:2>' else N'<literal:3>' end AS CHAR(1)) CONTAINER_ON_HAND,
    CAST(N'<literal:4>' AS CHAR(1)) CONTAINER_IN_TRANSIT
FROM
      (SHIPMENT_HEADER_VIEW shv

      INNER JOIN LOCATION da
      ON
          da.DOCK_LOCATION_TYPE = 1
      AND da.WAREHOUSE = shv.WAREHOUSE

      INNER JOIN SHIPMENT_HEADER_ON_HAND oh
	  ON
           oh.INTERNAL_SHIPMENT_NUM = shv.INTERNAL_SHIPMENT_NUM
           and oh.WAREHOUSE = shv.WAREHOUSE
           and oh.location = da.location
            
),
	FUNCTIONAL_AREA_STATUS_FLOW trailingSts,
	FUNCTIONAL_AREA_STATUS_FLOW leadingSts
WHERE
	trailingSts.FUNCTIONAL_AREA = N'<literal:5>'
	AND
	leadingSts.FUNCTIONAL_AREA = N'<literal:6>'
    AND
	trailingSts.STATUS = shv.TRAILING_STS
	AND
	leadingSts.STATUS = shv.LEADING_STS;