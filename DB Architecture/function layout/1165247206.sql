-- =============================================
-- Author:		Jimmy
-- Create date: June 4 2009
-- Description:	ILS trailing status to text
-- =============================================
CREATE FUNCTION [dbo].[ILSStatusToText] 
(
	-- Add the parameters for the function here
	@TRAILING_STS int
)
RETURNS VARchar(30)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result VARchar(30)

	-- Add the T-SQL statements to compute the return value here
	--SELECT @Result = @TRAILING_STS
	
	SET @Result = (
	SELECT CASE @TRAILING_STS
	WHEN 100 THEN 'In Pool'
	WHEN 200 THEN 'Wave Pending'
	WHEN 201 THEN 'In Wave'
	WHEN 300 THEN 'Picking Pending'
	WHEN 301 THEN 'In Picking'
	WHEN 400 THEN 'Packing Pending'
	WHEN 401 THEN 'In Packing'
	WHEN 600 THEN 'Staging Pending'
	WHEN 650 THEN 'Loading Pending'
	WHEN 700 THEN 'Ship Confirm Pending'
	WHEN 800 THEN 'Load Confirm Pending'
	WHEN 900 THEN 'Closed'
	ELSE cast(@TRAILING_STS AS VARCHAR)
	END
	)
	-- Return the result of the function
	RETURN @Result

END