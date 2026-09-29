-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */








CREATE VIEW Shipment_Detail_VAS_Activity_Grid_View
AS
SELECT DISTINCT SVAS.OBJECT_ID AS Object_Id
	,SVAS.VAS_ACTIVITY_ID
	,SVAS.INSTRUCTIONS
	,SVAS.Internal_shipment_line_num
	,SVAS.USER_DEF1
	,SVAS.USER_DEF2
	,SVAS.USER_DEF3
	,SVAS.USER_DEF4
	,SVAS.USER_DEF5
	,SVAS.USER_DEF6
	,SVAS.USER_DEF7
	,SVAS.USER_DEF8
	,CASE VAS.APPLICATION_LEVEL
		WHEN 0
			THEN N'<literal:1>'
		ELSE N'<literal:2>'
		END AS Application_Level
	,CASE (
			SELECT COUNT(1)
			FROM SHIPPING_CONT_VAS_ACTIVITY
			WHERE internal_container_num IN (
					SELECT internal_container_num
					FROM SHIPPING_CONTAINER
					WHERE internal_shipment_num = (SELECT Internal_shipment_num FROM SHIPMENT_DETAIL WHERE Internal_shipment_line_num = SVAS.Internal_shipment_line_num)
					)
				AND vas_activity_id = SVAS.VAS_ACTIVITY_ID
				AND INSTRUCTIONS = SVAS.INSTRUCTIONS
			)
		WHEN 0
			THEN 0
		ELSE (

		ISNULL(
				(SELECT MIN(CASE completed
							WHEN N'<literal:3>'
								THEN 0
							ELSE 1
							END)
				FROM SHIPPING_CONT_VAS_ACTIVITY
				WHERE internal_container_num IN (
						SELECT internal_container_num
						FROM SHIPPING_CONTAINER
						WHERE internal_shipment_num = (SELECT Internal_shipment_num FROM SHIPMENT_DETAIL WHERE Internal_shipment_line_num = SVAS.Internal_shipment_line_num)
							AND vas_activity_id = SVAS.VAS_ACTIVITY_ID
							AND INSTRUCTIONS = SVAS.INSTRUCTIONS
						))
						,0)
				)
		END AS Confirmed
FROM VAS_ACTIVITY VAS
INNER JOIN SHIPMENT_DETAIL_VAS_Activity SVAS ON SVAS.VAS_ACTIVITY_ID = VAS.OBJECT_ID;