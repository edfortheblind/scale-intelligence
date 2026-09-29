-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE VIEW SHIP_CONT_DOCK_AREA_ON_HAND
AS
SELECT DISTINCT
	da.object_id,
	container.*,
	statusFlow.STATUS_NAME AS STATUS_DESCRIPTION,

	-- [comment omitted]
    -- [comment omitted]
	(cast(da.OBJECT_ID as nvarchar(9)) + N'<literal:1>' + cast(container.INTERNAL_SHIPMENT_NUM as nvarchar(9))) AS ID,

	-- [comment omitted]
        CAST(Case when oh.internal_container_num is not null then N'<literal:2>' else N'<literal:3>' end AS CHAR(1)) ON_HAND,
        CAST(N'<literal:4>' AS CHAR(1)) IN_TRANSIT
FROM
	SHIPPING_CONTAINER container
   	INNER JOIN LOCATION da
      ON
          da.DOCK_LOCATION_TYPE = 1
      AND da.WAREHOUSE = container.WAREHOUSE

      INNER JOIN SHIPPING_CONTAINER_ON_HAND oh
	  ON
           oh.INTERNAL_CONTAINER_NUM = container.INTERNAL_container_NUM
           and oh.WAREHOUSE = container.WAREHOUSE
           and oh.location = da.location,
	FUNCTIONAL_AREA_STATUS_FLOW statusFlow 
WHERE
	statusFlow.FUNCTIONAL_AREA = N'<literal:5>'
    AND
	statusFlow.STATUS = container.STATUS;