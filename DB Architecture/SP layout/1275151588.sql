


CREATE PROCEDURE [dbo].[TRAV_LBL_ContainerContentsHeader](
	@INTERNAL_CONTAINER_NUM numeric(9))

AS
begin
	set nocount on;

/*  Putting results in subquery to get number or row,
	and then the number of rows is used to determine 
	the number of labels per multi-item pick CCL 
		Aug 21, 2010  jr	*/

SELECT SHIPMENT_ID, ItemCategory,INTERNAL_CONTAINER_NUM, CONTAINER_ID, CONTAINER_TYPE, CONTAINER_COUNT_NUMBER, CONTAINER_COUNT_TOTAL,
USER_DEF1, /* priority?  not used on label  */
launch_num, X_REF_ITEM, SHIPBY, RFID, --ROWNUM,
((MAX(ROWNUM) -1) / 7) + 1 AS NUMBER_LABELS ,
CUSTOMER 
, MAX(ROWNUM) AS MR, COUNT(ROWNUM) AS CR,
PL, CSPCS, BOX 
FROM ( 


	select
		sh.SHIPMENT_ID,
		sd.CUSTOMER_PO,
		case when (sd.ITEM_CATEGORY2 = 'First Issue' and sh.CARRIER <> 'UPS') then '1' when (sd.ITEM_CATEGORY2 = 'Second Issue' and sh.CARRIER <> 'UPS') then '2' else '' end as ItemCategory,
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
		sh.launch_num, /*
		CASE WHEN sc.container_type in (N'PL', N'CS') THEN ICR.X_REF_ITEM  
			ELSE N''
		END */
		'' AS X_REF_ITEM,
		BD.PL, BD.CSPCS, BD.BOX ,
/*  removed ROTC printout 09/13/2010  jr	----
CASE WHEN sh.CUSTOMER_CATEGORY1 = 'ROTC' THEN 'ROTC' 
ELSE 
		ISNULL(
		RIGHT('0' + CAST(DATEPART(M, SH.PLANNED_SHIP_DATE) AS VARCHAR) , 2) + 
		RIGHT('0' + CAST(DATEPART(DD, SH.PLANNED_SHIP_DATE) AS VARCHAR) , 2) 
			, '****') 
END	*/ 
		ISNULL(
		RIGHT('0' + CAST(DATEPART(M, SH.PLANNED_SHIP_DATE) AS VARCHAR) , 2) + 
		RIGHT('0' + CAST(DATEPART(DD, SH.PLANNED_SHIP_DATE) AS VARCHAR) , 2) 
		, '****')
AS SHIPBY, 
		jsd.RFID AS RFID 
	, ROW_NUMBER() OVER (ORDER BY SC.INTERNAL_CONTAINER_NUM ASC) AS 'ROWNUM' ,
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
	/*  begin add by Jimmy 04/04/2011
		RFID destinations and PGCs
		NOTE: This won't work for consolidated shipments!  */
		inner join 
	(SELECT MAX(RFID) AS RFID
	 FROM (
		SELECT CASE WHEN SD.ITEM_CLASS IN ('03361','01834','02967','02966','02982','03041','10097','02882','02410','00293','02275')
							AND SD.SHIP_TO = 'SC0141' /* Lackland RTC */
				THEN 'LK' 
				ELSE
					CASE WHEN SD.ITEM_CLASS IN ('00293','02275','02359','02360','02424','02884','02885','02895','02896','02899','02900','03148','03164')
						/* is in MC Phase I PGCs Travis will tag */
					THEN
							CASE WHEN SD.SHIP_TO = 'SC1143' THEN 'PI'  /* Parris Island MCRD */
							ELSE
								CASE WHEN SD.SHIP_TO = 'SC0140' THEN 'SD'   /* San Diego MCRD  */
								ELSE '  '
								END
							END					
					ELSE '  ' 
					END
				END AS RFID 
		FROM SHIPPING_CONTAINER AS SC 
		INNER JOIN SHIPMENT_DETAIL AS SD ON SC.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM 
		WHERE SC.INTERNAL_CONTAINER_NUM = @INTERNAL_CONTAINER_NUM 
		) AS DER 
	)
	 as jsd ON 2=2 
	 /* Begin Jimmy March 23, 2011
		adding box breakdown to label header	*/
	left outer join (
		SELECT SUM(PL) AS PL, SUM(CSPCS) AS CSPCS, SUM(BOX) AS BOX
		FROM (
			SELECT 
			CASE WHEN SC.CONTAINER_TYPE IN ('PL', 'Pallet') THEN 1 ELSE 0 END AS PL,
			CASE WHEN SC.CONTAINER_TYPE IN ('CS', 'Partial CS') THEN 1 ELSE 0 END as CSPCS,
			CASE WHEN SC.CONTAINER_TYPE NOT IN ('PL', 'Pallet', 'CS', 'Partial CS') THEN 1 ELSE 0 END AS BOX
			FROM SHIPPING_CONTAINER AS SC 
			WHERE SC.CONTAINER_ID IS NOT NULL
			AND SC.INTERNAL_SHIPMENT_NUM = (SELECT max(INTERNAL_SHIPMENT_NUM) FROM SHIPPING_CONTAINER WHERE INTERNAL_CONTAINER_NUM = @INTERNAL_CONTAINER_NUM)
		) AS BREAKDOWN
	) as BD ON 3=3

		LEFT OUTER JOIN WORK_INSTRUCTION_VIEW AS WIV ON WIV.WORK_UNIT = SC.CONTAINER_ID 
					AND WIV.INSTRUCTION_TYPE = 'Detail'

	where
		sc.internal_container_num = @INTERNAL_CONTAINER_NUM 

) AS SQ

GROUP BY 
SHIPMENT_ID, ItemCategory,INTERNAL_CONTAINER_NUM, CONTAINER_ID, CONTAINER_TYPE, CONTAINER_COUNT_NUMBER, CONTAINER_COUNT_TOTAL,
USER_DEF1, /* priority?  not used on label  */
launch_num, X_REF_ITEM, SHIPBY, RFID  , CUSTOMER, PL, CSPCS, BOX


end -- LBL_ContainerContentsHeader