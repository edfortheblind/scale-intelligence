-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RAccessorialHeader02
	@RatingId nvarchar(25),
   @RatingService nvarchar(50)
AS
   SET NOCOUNT ON
	SELECT *
     FROM accessorial_header
    WHERE rating_id = @RatingId 
      AND rating_service = @RatingService
