-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RShipmentHeader06
	@WaveNum numeric(9)
AS
	SELECT *
	FROM SHIPMENT_HEADER
	WHERE LAUNCH_NUM = @WaveNum;