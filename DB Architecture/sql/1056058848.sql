-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
 -- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
CREATE view LOT_VIEW
AS
SELECT 
	l.OBJECT_ID,l.LOT_TEMPLATE,l.LOT,l.ITEM,
	(SELECT DESCRIPTION from ITEM WHERE ITEM = l.ITEM AND ISNULL(COMPANY,N'<literal:1>') = ISNULL(l.COMPANY,N'<literal:2>') OR  (ITEM = l.ITEM  
      AND COMPANY is null) AND WAREHOUSE = l.WAREHOUSE) AS DESCRIPTION,
	l.COMPANY,l.WAREHOUSE,l.EXPIRATION_DATE,l.FROZEN,
                l.USER_DEF1,l.USER_DEF2 ,l.USER_DEF3 ,l.USER_DEF4 ,l.USER_DEF5 ,l.USER_DEF6 ,l.USER_DEF7 ,l.USER_DEF8,
                l.USER_STAMP ,l.PROCESS_STAMP,l.DATE_TIME_STAMP,l.INVENTORY_STS,(SELECT COUNT(*) FROM LOCATION_INVENTORY      
                                WHERE LOT = l.LOT          AND ITEM = l.ITEM          
                                                AND ISNULL(COMPANY,N'<literal:3>') = ISNULL(l.COMPANY,N'<literal:4>')      
                                                AND WAREHOUSE = l.WAREHOUSE    
                                                AND    ( ON_HAND_QTY <> 0 OR IN_TRANSIT_QTY <> 0     OR ALLOCATED_QTY <> 0     OR SUSPENSE_QTY <> 0  )) as LOCATIONS,N'<literal:5>' as ARCHIVED_LOT
from LOT l
UNION 

Select 
	ARL.OBJECT_ID,ARL.LOT_TEMPLATE,ARL.LOT,ARL.ITEM,
	(SELECT DESCRIPTION from ITEM WHERE ITEM = ARL.ITEM AND ISNULL(COMPANY,N'<literal:6>') = ISNULL(ARL.COMPANY,N'<literal:7>') OR  (ITEM = ARL.ITEM  
      AND COMPANY is null) AND WAREHOUSE = ARL.WAREHOUSE) AS DESCRIPTION,
	ARL.COMPANY,ARL.WAREHOUSE,ARL.EXPIRATION_DATE,ARL.FROZEN,
                ARL.USER_DEF1,ARL.USER_DEF2 ,ARL.USER_DEF3 ,ARL.USER_DEF4 ,ARL.USER_DEF5 ,ARL.USER_DEF6 ,ARL.USER_DEF7 ,ARL.USER_DEF8,
                ARL.USER_STAMP ,ARL.PROCESS_STAMP,ARL.DATE_TIME_STAMP,ARL.INVENTORY_STS ,
                (SELECT COUNT(*) FROM LOCATION_INVENTORY            
                                WHERE LOT = ARL.LOT   
                                                AND ITEM = ARL.ITEM   
                                                AND ISNULL(COMPANY,N'<literal:8>') = ISNULL(ARL.COMPANY,N'<literal:9>')               
                                                AND WAREHOUSE = ARL.WAREHOUSE    AND    ( ON_HAND_QTY <> 0 OR IN_TRANSIT_QTY <> 0     OR ALLOCATED_QTY <> 0     OR SUSPENSE_QTY <> 0  )) as LOCATIONS,
N'<literal:10>' as ARCHIVED_LOT
from AR_LOT ARL