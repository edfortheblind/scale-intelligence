-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
CREATE PROCEDURE [dbo].[TRAVIS_RFID_totag] 
	-- [comment omitted]
	@container_id  as varchar(40)

AS
BEGIN
	-- [comment omitted]
	-- [comment omitted]
	SET NOCOUNT ON;

DECLARE @ITEM_CLASS AS CHAR(5)
SET @ITEM_CLASS = 
(	SELECT SD.ITEM_CLASS
	FROM dbo.SHIPPING_CONTAINER AS SC
	INNER JOIN dbo.SHIPMENT_DETAIL AS SD ON SC.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM
	WHERE SC.CONTAINER_ID = @container_id
)

SELECT
CASE WHEN @ITEM_CLASS IN (
'<literal:1>','<literal:2>','<literal:3>','<literal:4>','<literal:5>','<literal:6>','<literal:7>','<literal:8>','<literal:9>','<literal:10>','<literal:11>')
THEN '<literal:12>' ELSE '<literal:13>' END 

END