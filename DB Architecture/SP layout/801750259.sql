/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	17058	| SMS	| 11/08/06	| Created					   
    12105   | YHR   | 10/15/07  | Added Goal v/s Actual work summary

	Returns details for UserSummary report.
	
	Parameters:	None		

	Returns: Labor_Management_Detail Table Details
*/


CREATE PROCEDURE RPT_UserSummaryReportDetails
AS
BEGIN
	 SELECT       
		START_DATE_TIME as START_DATE_TIME,      
		END_DATE_TIME as END_DATE_TIME,         
		LABOR_TYPE as LABOR_TYPE,         
		dbo.RSCMfn_RtrvResource(ACTIVITY_TYPE,N'Text',N'en-US') AS ACTIVITY_TYPE,      
		TOTAL_TRANSACTIONS as TOTAL_TRANSACTIONS,      
		TOTAL_LABOR_COST as TOTAL_LABOR_COST,        
		[USER_NAME] as [USER_NAME],        
		TOTAL_ACTUAL_TIME as TOTAL_ACTUAL_TIME, 
		TOTAL_QUANTITY as TOTAL_QUANTITY,      
		TOTAL_WEIGHT as TOTAL_WEIGHT,        
		TOTAL_VALUE as TOTAL_VALUE,    
		GOAL_QUANTITY as GOAL_QUANTITY,    
		PERCENT_OF_GOAL as PERCENT_OF_GOAL,    
		ACTUAL_RATE as ACTUAL_RATE,    
		GOAL_RATE as GOAL_RATE    
	 FROM  LABOR_MANAGEMENT_DETAIL       
	 WHERE LABOR_TYPE IS NOT NULL
	 ORDER BY [USER_NAME], START_DATE_TIME   
END


