-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE TRIGGER shipment_accessorials_a_i
ON shipment_accessorials
FOR INSERT, UPDATE
AS 
BEGIN
	IF EXISTS (
      Select N'<literal:1>'
      FROM inserted
      where internal_num < 0
	)
	BEGIN
		UPDATE
		shipment_accessorials
		SET
		internal_num = CASE WHEN ISNULL(internal_container_num,
		0) = 0 THEN internal_shipment_num ELSE internal_container_num END
		WHERE
		internal_num < 0
		AND exists (
			select N'<literal:2>'
			from inserted
			where internal_num < 0
					and CASE WHEN ISNULL(shipment_accessorials.internal_container_num,0) = 0 THEN shipment_accessorials.internal_shipment_num 
							 ELSE shipment_accessorials.internal_container_num END = 
						CASE WHEN ISNULL(internal_container_num,0) = 0 THEN internal_shipment_num 
							 ELSE internal_container_num END
		)
	END
END