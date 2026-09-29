-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


CREATE trigger TRAILER_YARD_STATUS_A_I
	on TRAILER_YARD_STATUS after insert
as
	
		update
			receipt_header
		set
			trailer_yard_status_id = inserted.object_id,
			process_stamp = inserted.process_stamp,
			user_stamp = inserted.user_stamp,
			date_time_stamp = getutcdate()
		from
			receipt_header rh,
			inserted
		where
			rh.trailer_id = inserted.trailer_id
			and			
			rh.warehouse = inserted.warehouse
			and
			rh.trailing_sts <> 900 
			and
			rh.trailer_yard_status_id is null;