/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	17058	| SMS	| 11/08/06	| Created					   
    12105   | YHR   | 10/15/07  | Added Goal v/s Actual work summary
	Returns details for LaborTypeSummary report.
	
	Parameters:	None		

	Returns: Labor_Management_Summary Table Details
*/


CREATE PROCEDURE RPT_LaborTypeSummaryDetails
(
	@startDate datetime,
	@endDate datetime
)
AS
BEGIN

	SELECT 
				TOTAL_TRANSACTIONS AS TOTAL_TRANSACTIONS,
				TOTAL_QUANTITY AS TOTAL_QUANTITY,
				TOTAL_LABOR_COST AS TOTAL_LABOR_COST,
				TOTAL_VOLUME AS TOTAL_VOLUME,
				LABOR_TYPE AS LABOR_TYPE,
				dbo.RSCMfn_RtrvResource(ACTIVITY_TYPE,N'Text',N'en-US') AS ACTIVITY_TYPE,
				[USER_NAME] AS [USER_NAME],
				TOTAL_ACTUAL_TIME as TOTAL_ACTUAL_TIME,     
				TOTAL_VOLUME as TOTAL_VOLUME,      
				TOTAL_WEIGHT as TOTAL_WEIGHT,      
				TOTAL_VALUE as TOTAL_VALUE,  
				GOAL_QUANTITY as GOAL_QUANTITY,  
				PERCENT_OF_GOAL as PERCENT_OF_GOAL,  
				ACTUAL_RATE as ACTUAL_RATE,  
				GOAL_RATE as GOAL_RATE 
	FROM		LABOR_MANAGEMENT_DETAIL	
	WHERE		START_DATE_TIME BETWEEN @startDate AND @endDate
				AND LABOR_TYPE IS NOT NULL
	ORDER BY	LABOR_TYPE,ACTIVITY_TYPE,[USER_NAME];

END








