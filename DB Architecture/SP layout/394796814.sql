/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------

	17275	| SKM		| 2005.09.09	| Constant values picked from ReportingConstants
	18484	| SP 		| 2006.01.19	| Added Transaction Types for Company and Warehouse Transfers
	66679	| NB		| 2010.03.19	| Modified to fetch the records in chronological order
	83446   | OM  		| 2011.05.13  	| Modified to include Lot Status Change
    143149  | SHS       | 2014.07.03    | Taken out the marking logic to a different place. Only select of marked records is done here
*/

-- #DEFINE WMW.Reporting.dll Manh.WMW.Reporting.General.ReportingConstants ReportingConstants;
-- #DEFINE WMW.General.dll Manh.WMFW.General.RecordTypeConstants RecordTypeConstants;
-- #DEFINE WMW.JSharp.General.dll com.pronto.general.Constants Constants;  
    
    
CREATE PROCEDURE wm_RUTransactionHistory01
	@BatchId nvarchar(50)   
AS     
    
SELECT          
    th.*,
    cw.CATCH_WEIGHT,    
    cw.CATCH_WEIGHT_UM        
FROM TRANSACTION_HISTORY th    

OUTER APPLY    
(    
    SELECT     
        MAX(CASE     
                WHEN ATTRIBUTE_TYPE = N'Catch Weight'     
                THEN TRY_CAST(ATTRIBUTE_VALUE AS NUMERIC(14,5))     
            END) AS CATCH_WEIGHT,    
    
        MAX(CASE     
                WHEN ATTRIBUTE_TYPE = N'Catch Weight UM'     
                THEN ATTRIBUTE_VALUE     
            END) AS CATCH_WEIGHT_UM        
    
    FROM TRANS_HIST_ATTRIBUTES tha    
    WHERE tha.LINK_ID = th.INTERNAL_ID    
      AND tha.ATTRIBUTE_TYPE IN (N'Catch Weight', N'Catch Weight UM')    
) cw    
    
WHERE th.UPLOAD_INTERFACE_BATCH = @BatchId    
ORDER BY th.ACTIVITY_DATE_TIME;
