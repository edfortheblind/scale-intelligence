-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE trigger RECEIPT_HEADER_A_I
	on receipt_header after insert
as
	-- [comment omitted]
	-- [comment omitted]
	if exists (select * from inserted where trailer_id is not null)
	begin
		-- [comment omitted]
		update
			receipt_header
		set
			trailer_yard_status_id = tys.object_id,
			process_stamp = inserted.process_stamp,
			user_stamp = inserted.user_stamp,
			date_time_stamp = getutcdate()
		from
			receipt_header rh,
			trailer_yard_status tys,
			inserted
		where
			rh.internal_receipt_num = inserted.internal_receipt_num
			and
			rh.warehouse = tys.warehouse
			and
			rh.trailer_id = tys.trailer_id
			and
			tys.status = 0;
	end;