-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
    
    
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
                WHEN ATTRIBUTE_TYPE = N'<literal:1>'     
                THEN TRY_CAST(ATTRIBUTE_VALUE AS NUMERIC(14,5))     
            END) AS CATCH_WEIGHT,    
    
        MAX(CASE     
                WHEN ATTRIBUTE_TYPE = N'<literal:2>'     
                THEN ATTRIBUTE_VALUE     
            END) AS CATCH_WEIGHT_UM        
    
    FROM TRANS_HIST_ATTRIBUTES tha    
    WHERE tha.LINK_ID = th.INTERNAL_ID    
      AND tha.ATTRIBUTE_TYPE IN (N'<literal:3>', N'<literal:4>')    
) cw    
    
WHERE th.UPLOAD_INTERFACE_BATCH = @BatchId    
ORDER BY th.ACTIVITY_DATE_TIME;
