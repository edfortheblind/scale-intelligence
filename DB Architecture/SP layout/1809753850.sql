/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16078	| JG	| 03/17/05	| Created.
	16028	| MAG	| 07/20/05	| Added Where clause to Detail Status Buckets Update
	41425	| SMS	| 11/25/08	| Updated DATE_TIME_STAMP
	62806	| DSK	| 12/14/09	| Added Warehouse Alerts logic
	148765	| TSP	| 10/08/14	| Allowed modification of statuses only if status not equal to 995
	224225	| SO	| 05/28/18	| Modified To updated trailing/leading status date with warehouse date. 

	This stored proc will set the shipment and all of its containers and details to the given
 	status.  It will then update the load if necessary. When update shipment details, 
	bucket 1 will be set to the given statuses and all buckets > 0 and < stsLimit will be 
	summed into this bucket.  The buckets >= stsLimit (if any) will be shifted to start at 
	bucket 2 and left as is.

	Parameters:
		shipNum		The internal shipment number
		loadNum		The shipping load number
		newSts		Is the load confirm pending status
		stsLimit	The rejected status limit	

*/

CREATE PROCEDURE SHP_SetStatusesAtShipConfirm(
	@shipNum numeric(9),
	@loadNum numeric(9),
	@newSts numeric(3),
	@stsLimit numeric(3))
AS
begin

		DECLARE @warehouse nvarchar(25);

		-- insert warehouse alert requests for shipments that would be updated
		INSERT INTO WAREHOUSE_ALERT_REQUEST (ALERT_TYPE, INTERNAL_ALERT_NUM, INTERNAL_SOURCE_NUM, 
					WAREHOUSE, PROCESSED, ACTIVITY_DATE_TIME, USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP, 
					PRIORITY, MESSAGE, IDENTIFIER1)
		SELECT ALERT.ALERT_TYPE,
			   ALERT.INTERNAL_ALERT_NUM,
			   SHIP.INTERNAL_SHIPMENT_NUM, 
			   SHIP.WAREHOUSE,
			   N'N',
			   GETUTCDATE(),
			   N'System',
			   N'SHP_SetStatusesAtShipConfirm',
			   GETUTCDATE(),
			   ALERT.PRIORITY,
			   ALERT.MESSAGE,
			   @newSts
		 FROM SHIPMENT_HEADER SHIP WITH (NOLOCK) ,
			 WAREHOUSE_ALERT ALERT WITH (NOLOCK) 
	
		 WHERE ALERT.ALERT_TYPE = N'Outbound'
		   AND (SHIP.TRAILING_STS IS NULL OR SHIP.TRAILING_STS < @newSts)
		   AND SHIP.INTERNAL_SHIPMENT_NUM = @shipNum
		   AND ALERT.ACTIVE = N'Y'
		   AND NOT EXISTS (SELECT REQUEST.INTERNAL_ALERT_REQ_NUM
							 FROM WAREHOUSE_ALERT_REQUEST REQUEST WITH (NOLOCK) 
							WHERE REQUEST.INTERNAL_ALERT_NUM = ALERT.INTERNAL_ALERT_NUM
							  AND REQUEST.INTERNAL_SOURCE_NUM = SHIP.INTERNAL_SHIPMENT_NUM
							  AND REQUEST.IDENTIFIER1 = @newSts);

		----------------Get shipment warehouse
		SELECT @warehouse = WAREHOUSE
			FROM SHIPMENT_HEADER WITH (NOLOCK)
			WHERE INTERNAL_SHIPMENT_NUM = @shipNum;

		--update shipping header
		update shipment_header
		set trailing_sts = @newSts,
			leading_sts = @newSts,
			actual_ship_date_time = GETUTCDATE(),
			trailing_sts_date = CONVERT(date,dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())),
			leading_sts_date = CONVERT(date,dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())),
			date_time_stamp = GETUTCDATE()
		where internal_shipment_num = @shipNum
							  
		--if any detail on this shipment is completely rejected, shift status buckets down to make room
		update shipment_detail
		set status10 = status9,
			status9 = status8,
			status8 = status7,
			status7 = status6,
			status6 = status5,
			status5 = status4,
			status4 = status3,
			status3 = status2,
			status2 = status1,
			quantity_at_sts10 = quantity_at_sts9,
			quantity_at_sts9 = quantity_at_sts8,
			quantity_at_sts8 = quantity_at_sts7,
			quantity_at_sts7 = quantity_at_sts6,
			quantity_at_sts6 = quantity_at_sts5,
			quantity_at_sts5 = quantity_at_sts4,
			quantity_at_sts4 = quantity_at_sts3,
			quantity_at_sts3 = quantity_at_sts2,
			quantity_at_sts2 = quantity_at_sts1,
			quantity_at_sts1 = 0
		where internal_shipment_num = @shipNum
		and status1 >= @stsLimit
		and status1 <> 995
		
		--combine all statuses below limit to the first bucket in the given status
		update shipment_detail
		set status1 = @newSts,
			quantity_at_sts1 = quantity_at_sts1
			+ (case when status2 < @stsLimit then quantity_at_sts2 else 0 end)
			+ (case when status3 < @stsLimit then quantity_at_sts3 else 0 end)
			+ (case when status4 < @stsLimit then quantity_at_sts4 else 0 end)
			+ (case when status5 < @stsLimit then quantity_at_sts5 else 0 end)
			+ (case when status6 < @stsLimit then quantity_at_sts6 else 0 end)
			+ (case when status7 < @stsLimit then quantity_at_sts7 else 0 end)
			+ (case when status8 < @stsLimit then quantity_at_sts8 else 0 end)
			+ (case when status9 < @stsLimit then quantity_at_sts9 else 0 end)
			+ (case when status10 < @stsLimit then quantity_at_sts10 else 0 end)
		where internal_shipment_num = @shipNum
		and status1 <> 995

		--shift statuses beyond limit down to bucket 2, if any
		update shipment_detail
		set status2 = 
			case
				when status2 >= @stsLimit then status2
				when status3 >= @stsLimit then status3
				when status4 >= @stsLimit then status4
				when status5 >= @stsLimit then status5
				when status6 >= @stsLimit then status6
				when status7 >= @stsLimit then status7
				when status8 >= @stsLimit then status8
				when status9 >= @stsLimit then status9
				when status10 >= @stsLimit then status10
				else 0 
			end,
		quantity_at_sts2 = 
			case
				when status2 >= @stsLimit then quantity_at_sts2
				when status3 >= @stsLimit then quantity_at_sts3
				when status4 >= @stsLimit then quantity_at_sts4
				when status5 >= @stsLimit then quantity_at_sts5
				when status6 >= @stsLimit then quantity_at_sts6
				when status7 >= @stsLimit then quantity_at_sts7
				when status8 >= @stsLimit then quantity_at_sts8
				when status9 >= @stsLimit then quantity_at_sts9
				when status10 >= @stsLimit then quantity_at_sts10
				else 0 
			end,
		status3 = 
			case
				when status2 >= @stsLimit then status3
				when status3 >= @stsLimit then status4
				when status4 >= @stsLimit then status5
				when status5 >= @stsLimit then status6
				when status6 >= @stsLimit then status7
				when status7 >= @stsLimit then status8
				when status8 >= @stsLimit then status9
				when status9 >= @stsLimit then status10
				else 0 
			end,
		quantity_at_sts3 = 
			case
				when status2 >= @stsLimit then quantity_at_sts3
				when status3 >= @stsLimit then quantity_at_sts4
				when status4 >= @stsLimit then quantity_at_sts5
				when status5 >= @stsLimit then quantity_at_sts6
				when status6 >= @stsLimit then quantity_at_sts7
				when status7 >= @stsLimit then quantity_at_sts8
				when status8 >= @stsLimit then quantity_at_sts9
				when status9 >= @stsLimit then quantity_at_sts10
				else 0 
			end,
		status4 =
			case
				when status2 >= @stsLimit then status4
				when status3 >= @stsLimit then status5
				when status4 >= @stsLimit then status6
				when status5 >= @stsLimit then status7
				when status6 >= @stsLimit then status8
				when status7 >= @stsLimit then status9
				when status8 >= @stsLimit then status10
				else 0 
			end,
		quantity_at_sts4 = 
			case
				when status2 >= @stsLimit then quantity_at_sts4
				when status3 >= @stsLimit then quantity_at_sts5
				when status4 >= @stsLimit then quantity_at_sts6
				when status5 >= @stsLimit then quantity_at_sts7
				when status6 >= @stsLimit then quantity_at_sts8
				when status7 >= @stsLimit then quantity_at_sts9
				when status8 >= @stsLimit then quantity_at_sts10
				else 0 
			end,
		status5 =
			case
				when status2 >= @stsLimit then status5
				when status3 >= @stsLimit then status6
				when status4 >= @stsLimit then status7
				when status5 >= @stsLimit then status8
				when status6 >= @stsLimit then status9
				when status7 >= @stsLimit then status10
				else 0 
			end,
		quantity_at_sts5 = 
			case
				when status2 >= @stsLimit then quantity_at_sts5
				when status3 >= @stsLimit then quantity_at_sts6
				when status4 >= @stsLimit then quantity_at_sts7
				when status5 >= @stsLimit then quantity_at_sts8
				when status6 >= @stsLimit then quantity_at_sts9
				when status7 >= @stsLimit then quantity_at_sts10
				else 0 
			end,
		status6 =
			case
				when status2 >= @stsLimit then status6
				when status3 >= @stsLimit then status7
				when status4 >= @stsLimit then status8
				when status5 >= @stsLimit then status9
				when status6 >= @stsLimit then status10
				else 0 
			end,
		quantity_at_sts6 = 
			case
				when status2 >= @stsLimit then quantity_at_sts6
				when status3 >= @stsLimit then quantity_at_sts7
				when status4 >= @stsLimit then quantity_at_sts8
				when status5 >= @stsLimit then quantity_at_sts9
				when status6 >= @stsLimit then quantity_at_sts10
				else 0 
			end,
		status7 =
			case
				when status2 >= @stsLimit then status7
				when status3 >= @stsLimit then status8
				when status4 >= @stsLimit then status9
				when status5 >= @stsLimit then status10
				else 0 
			end,
		quantity_at_sts7 = 
			case
				when status2 >= @stsLimit then quantity_at_sts7
				when status3 >= @stsLimit then quantity_at_sts8
				when status4 >= @stsLimit then quantity_at_sts9
				when status5 >= @stsLimit then quantity_at_sts10
				else 0 
			end,		
		status8 =
			case
				when status2 >= @stsLimit then status8
				when status3 >= @stsLimit then status9
				when status4 >= @stsLimit then status10
				else 0 
			end,
		quantity_at_sts8 = 
			case
				when status2 >= @stsLimit then quantity_at_sts8
				when status3 >= @stsLimit then quantity_at_sts9
				when status4 >= @stsLimit then quantity_at_sts10
				else 0 
			end,	
		status9 =
			case
				when status2 >= @stsLimit then status9
				when status3 >= @stsLimit then status10
				else 0 
			end,
		quantity_at_sts9 = 
			case
				when status2 >= @stsLimit then quantity_at_sts9
				when status3 >= @stsLimit then quantity_at_sts10
				else 0 
			end,	
		status10 =
			case
				when status2 >= @stsLimit then status10
				else 0 
			end,
		quantity_at_sts10 = 
			case
				when status2 >= @stsLimit then quantity_at_sts10
				else 0 
			end,
		date_time_stamp = GETUTCDATE()
		where internal_shipment_num = @shipNum and status1 <> 995
		
		--update containers
		update shipping_container
		set status = @newSts,
		date_time_stamp = GETUTCDATE()
		where internal_shipment_num = @shipNum
	
		--update load
		update shipping_load
		set leading_sts = @newSts,
		trailing_sts = (
			select  min(trailing_sts)
			from shipment_header
			where shipping_load_num = @loadNum),
		leading_sts_failed = N'N',
		trailing_sts_failed = N'N',
		leading_sts_date = CONVERT(date,dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())),
		trailing_sts_date = CONVERT(date,dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())),
		date_time_stamp = GETUTCDATE()
		where internal_load_num = @loadNum

end --SHP_SetStatusesAtShipConfirm


