-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
 -- [comment omitted]
-- [comment omitted]

CREATE view METADATA_INSIGHT_LOT_VIEW
AS
SELECT l.OBJECT_ID,l.LOT_TEMPLATE,l.LOT,l.ITEM,l.COMPANY,l.WAREHOUSE,l.EXPIRATION_DATE,l.FROZEN,
                l.USER_DEF1,l.USER_DEF2 ,l.USER_DEF3 ,l.USER_DEF4 ,l.USER_DEF5 ,l.USER_DEF6 ,l.USER_DEF7 ,l.USER_DEF8,
                l.USER_STAMP ,l.PROCESS_STAMP,l.DATE_TIME_STAMP,l.INVENTORY_STS,(SELECT COUNT(*) FROM LOCATION_INVENTORY      
                                WHERE LOT = l.LOT          AND ITEM = l.ITEM          
                                                AND ISNULL(COMPANY,N'<literal:1>') = ISNULL(l.COMPANY,N'<literal:2>')      
                                                AND WAREHOUSE = l.WAREHOUSE    
                                                AND    ( ON_HAND_QTY <> 0 OR IN_TRANSIT_QTY <> 0     OR ALLOCATED_QTY <> 0     OR SUSPENSE_QTY <> 0  )) as LOCATIONS,N'<literal:3>' as ARCHIVED_LOT
from LOT l
UNION 

Select ARL.OBJECT_ID,ARL.LOT_TEMPLATE,ARL.LOT,ARL.ITEM,ARL.COMPANY,ARL.WAREHOUSE,ARL.EXPIRATION_DATE,ARL.FROZEN,
                ARL.USER_DEF1,ARL.USER_DEF2 ,ARL.USER_DEF3 ,ARL.USER_DEF4 ,ARL.USER_DEF5 ,ARL.USER_DEF6 ,ARL.USER_DEF7 ,ARL.USER_DEF8,
                ARL.USER_STAMP ,ARL.PROCESS_STAMP,ARL.DATE_TIME_STAMP,ARL.INVENTORY_STS ,
                (SELECT COUNT(*) FROM LOCATION_INVENTORY            
                                WHERE LOT = ARL.LOT   
                                                AND ITEM = ARL.ITEM   
                                                AND ISNULL(COMPANY,N'<literal:4>') = ISNULL(ARL.COMPANY,N'<literal:5>')               
                                                AND WAREHOUSE = ARL.WAREHOUSE    AND    ( ON_HAND_QTY <> 0 OR IN_TRANSIT_QTY <> 0     OR ALLOCATED_QTY <> 0     OR SUSPENSE_QTY <> 0  )) as LOCATIONS,
N'<literal:6>' as ARCHIVED_LOT
from AR_LOT ARL