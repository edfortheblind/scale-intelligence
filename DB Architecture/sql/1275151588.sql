-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE PROCEDURE [dbo].[TRAV_LBL_ContainerContentsHeader](
	@INTERNAL_CONTAINER_NUM numeric(9))

AS
begin
	set nocount on;

/* [comment omitted] */




SELECT SHIPMENT_ID, ItemCategory,INTERNAL_CONTAINER_NUM, CONTAINER_ID, CONTAINER_TYPE, CONTAINER_COUNT_NUMBER, CONTAINER_COUNT_TOTAL,
USER_DEF1, /* [comment omitted] */
launch_num, X_REF_ITEM, SHIPBY, RFID, -- [comment omitted]
((MAX(ROWNUM) -1) / 7) + 1 AS NUMBER_LABELS ,
CUSTOMER 
, MAX(ROWNUM) AS MR, COUNT(ROWNUM) AS CR,
PL, CSPCS, BOX 
FROM ( 


	select
		sh.SHIPMENT_ID,
		sd.CUSTOMER_PO,
		case when (sd.ITEM_CATEGORY2 = '<literal:1>' and sh.CARRIER <> '<literal:2>') then '<literal:3>' when (sd.ITEM_CATEGORY2 = '<literal:4>' and sh.CARRIER <> '<literal:5>') then '<literal:6>' else '<literal:7>' end as ItemCategory,
		sc.INTERNAL_CONTAINER_NUM, 
		sc.CONTAINER_ID, 
		sc.CONTAINER_TYPE, 
		sc.CONTAINER_COUNT_NUMBER, 
		sc.CONTAINER_COUNT_TOTAL, 
		sc.LOCATION, 
		sc.TRACKING_NUMBER, 
		sc.USER_DEF1, 
		sc.USER_DEF2, 
		sc.USER_DEF3, 
		sc.USER_DEF4, 
		sc.USER_DEF5, 
		sc.USER_DEF6, 
		sc.USER_DEF7, 
		sc.USER_DEF8,
		sh.launch_num, /* [comment omitted] */



		'<literal:8>' AS X_REF_ITEM,
		BD.PL, BD.CSPCS, BD.BOX ,
/* [comment omitted] */






 
		ISNULL(
		RIGHT('<literal:9>' + CAST(DATEPART(M, SH.PLANNED_SHIP_DATE) AS VARCHAR) , 2) + 
		RIGHT('<literal:10>' + CAST(DATEPART(DD, SH.PLANNED_SHIP_DATE) AS VARCHAR) , 2) 
		, '<literal:11>')
AS SHIPBY, 
		jsd.RFID AS RFID 
	, ROW_NUMBER() OVER (ORDER BY SC.INTERNAL_CONTAINER_NUM ASC) AS '<literal:12>' ,
	sh.CUSTOMER 

	from
		shipping_container sc

		inner join shipment_header sh
		on
			sh.internal_shipment_num = sc.internal_shipment_num

		left outer join (
			select top 1
				innerSd.customer_po,innerSd.ITEM_CATEGORY2
			from
				shipping_container items

			left outer join shipment_detail innerSd
			on
				items.internal_shipment_line_num = innerSd.internal_shipment_line_num

			where
				items.tree_unit = @INTERNAL_CONTAINER_NUM
				and
				items.internal_shipment_line_num is not null
		) sd on 1=1 
	/* [comment omitted] */


		inner join 
	(SELECT MAX(RFID) AS RFID
	 FROM (
		SELECT CASE WHEN SD.ITEM_CLASS IN ('<literal:13>','<literal:14>','<literal:15>','<literal:16>','<literal:17>','<literal:18>','<literal:19>','<literal:20>','<literal:21>','<literal:22>','<literal:23>')
							AND SD.SHIP_TO = '<literal:24>' /* [comment omitted] */
				THEN '<literal:25>' 
				ELSE
					CASE WHEN SD.ITEM_CLASS IN ('<literal:26>','<literal:27>','<literal:28>','<literal:29>','<literal:30>','<literal:31>','<literal:32>','<literal:33>','<literal:34>','<literal:35>','<literal:36>','<literal:37>','<literal:38>')
						/* [comment omitted] */
					THEN
							CASE WHEN SD.SHIP_TO = '<literal:39>' THEN '<literal:40>'  /* [comment omitted] */
							ELSE
								CASE WHEN SD.SHIP_TO = '<literal:41>' THEN '<literal:42>'   /* [comment omitted] */
								ELSE '<literal:43>'
								END
							END					
					ELSE '<literal:44>' 
					END
				END AS RFID 
		FROM SHIPPING_CONTAINER AS SC 
		INNER JOIN SHIPMENT_DETAIL AS SD ON SC.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM 
		WHERE SC.INTERNAL_CONTAINER_NUM = @INTERNAL_CONTAINER_NUM 
		) AS DER 
	)
	 as jsd ON 2=2 
	 /* [comment omitted] */

	left outer join (
		SELECT SUM(PL) AS PL, SUM(CSPCS) AS CSPCS, SUM(BOX) AS BOX
		FROM (
			SELECT 
			CASE WHEN SC.CONTAINER_TYPE IN ('<literal:45>', '<literal:46>') THEN 1 ELSE 0 END AS PL,
			CASE WHEN SC.CONTAINER_TYPE IN ('<literal:47>', '<literal:48>') THEN 1 ELSE 0 END as CSPCS,
			CASE WHEN SC.CONTAINER_TYPE NOT IN ('<literal:49>', '<literal:50>', '<literal:51>', '<literal:52>') THEN 1 ELSE 0 END AS BOX
			FROM SHIPPING_CONTAINER AS SC 
			WHERE SC.CONTAINER_ID IS NOT NULL
			AND SC.INTERNAL_SHIPMENT_NUM = (SELECT max(INTERNAL_SHIPMENT_NUM) FROM SHIPPING_CONTAINER WHERE INTERNAL_CONTAINER_NUM = @INTERNAL_CONTAINER_NUM)
		) AS BREAKDOWN
	) as BD ON 3=3

		LEFT OUTER JOIN WORK_INSTRUCTION_VIEW AS WIV ON WIV.WORK_UNIT = SC.CONTAINER_ID 
					AND WIV.INSTRUCTION_TYPE = '<literal:53>'

	where
		sc.internal_container_num = @INTERNAL_CONTAINER_NUM 

) AS SQ

GROUP BY 
SHIPMENT_ID, ItemCategory,INTERNAL_CONTAINER_NUM, CONTAINER_ID, CONTAINER_TYPE, CONTAINER_COUNT_NUMBER, CONTAINER_COUNT_TOTAL,
USER_DEF1, /* [comment omitted] */
launch_num, X_REF_ITEM, SHIPBY, RFID  , CUSTOMER, PL, CSPCS, BOX


end -- [comment omitted]