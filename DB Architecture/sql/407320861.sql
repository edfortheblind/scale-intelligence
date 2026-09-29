-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RAccessorialDetail02
    	@RatingId nvarchar(25),
    	@RatingService nvarchar(50),
	@AccessorialCode nvarchar(25)

AS
   SET NOCOUNT ON
   SELECT *
     FROM ACCESSORIAL_DETAIL
	WHERE RATING_ID = @RatingId
	AND RATING_SERVICE = @RatingService 
	AND accessorial_code = @AccessorialCode
	
