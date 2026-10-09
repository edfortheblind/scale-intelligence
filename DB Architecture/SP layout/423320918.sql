CREATE PROCEDURE wm_RAccessorialHeader01
	@AccessorialCode nvarchar(25)
AS
   SET NOCOUNT ON
	SELECT *
     FROM accessorial_header
