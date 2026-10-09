/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
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
	
