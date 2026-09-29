-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE VIEW SHIP_CONT_DOCK_POS_IN_TRANSIT
AS
SELECT 
    dp.OBJECT_ID DOCK_POSITION,
    dp.PARENT_DOCK_AREA,
  	container.*,
	statusFlow.STATUS_NAME AS STATUS_DESCRIPTION,
	-- [comment omitted]
    -- [comment omitted]
	(cast(dp.PARENT_DOCK_AREA as nvarchar(9)) + N'<literal:1>' + cast(container.INTERNAL_SHIPMENT_NUM as nvarchar(9))) AS ID,

    -- [comment omitted]
        CAST(N'<literal:2>' AS CHAR(1))  ON_HAND,
	CAST(Case when it.internal_container_num is not null then N'<literal:3>' else N'<literal:4>' end AS CHAR(1)) IN_TRANSIT
FROM
	SHIPPING_CONTAINER container
   	INNER JOIN LOCATION dp
      ON
          dp.DOCK_LOCATION_TYPE = 2
      AND dp.WAREHOUSE = container.WAREHOUSE

      INNER JOIN SHIPPING_CONTAINER_IN_TRANSIT it
	  ON
           it.INTERNAL_CONTAINER_NUM = container.INTERNAL_container_NUM
           and it.WAREHOUSE = container.WAREHOUSE
           and it.location = dp.location,
	FUNCTIONAL_AREA_STATUS_FLOW statusFlow 
WHERE
	statusFlow.FUNCTIONAL_AREA = N'<literal:5>'
    AND
	statusFlow.STATUS = container.STATUS;