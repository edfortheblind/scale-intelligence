-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE wm_RAccessorialHeader01
	@AccessorialCode nvarchar(25)
AS
   SET NOCOUNT ON
	SELECT *
     FROM accessorial_header
