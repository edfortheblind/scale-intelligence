
-- =============================================
-- Author:		Jimmy
-- Create date: 2010-08-02
-- Description:	Temp detect if container id is to be RFID tagged for LAK initiial issue
-- =============================================
CREATE PROCEDURE [dbo].[TRAVIS_RFID_totag] 
	-- Add the parameters for the stored procedure here
	@container_id  as varchar(40)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
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
'03361','01834','02967','02966','02982','03041','10097','02882','02410','00293','02275')
THEN 'YES' ELSE 'nope' END 

END