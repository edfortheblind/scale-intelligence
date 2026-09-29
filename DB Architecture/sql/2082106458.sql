-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RShipmentHeader05
	@TrailingSts numeric(9)
AS
	SELECT *
	FROM SHIPMENT_HEADER
	WHERE UPLOAD_INTERFACE_BATCH IS NULL
	AND TRAILING_STS >= @TrailingSts
	AND TRAILING_STS < 997;