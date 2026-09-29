-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE TpmOrderContainerStatus_InsightDetailPaneData(
@internalContainerNum numeric(9),
@culture nvarchar(10)

)  
AS 
BEGIN

SELECT N'<literal:1>' AS SCALAR,   
    sc.CONTAINER_ID as ID,  
    dbo.STSfn_RtrvStsName(N'<literal:2>' ,sc.STATUS) AS Status,        
    sc.ITEM as Item,      
    i.WEB_THUMBNAIL_IMG AS      WebThumbnailImage,  
    sc.Internal_Container_Num as InternalContainerNumber     
       FROM SHIPPING_CONTAINER sc 
     
    left outer join LOT l ON SC.ITEM = l.ITEM AND SC.LOT = l.LOT AND ((SC.COMPANY IS NULL AND l.COMPANY IS NULL) OR SC.COMPANY = l.COMPANY)         
    LEFT OUTER JOIN ITEM i  
    ON (sc.ITEM = i.ITEM AND (sc.COMPANY = i.COMPANY OR (sc.COMPANY IS NULL AND i.COMPANY IS NULL)))  
       WHERE sc.Internal_Container_num =@internalContainerNum  
    -- [comment omitted]
  ;WITH NestedContainerTreeList AS(  
        SELECT  INTERNAL_CONTAINER_NUM, PARENT  
        FROM    SHIPPING_CONTAINER  
        WHERE   INTERNAL_CONTAINER_NUM = @internalContainerNum   
        UNION ALL  
        SELECT  c.INTERNAL_CONTAINER_NUM, c.PARENT  
        FROM    SHIPPING_CONTAINER c INNER JOIN  
                NestedContainerTreeList t ON c.PARENT = t.INTERNAL_CONTAINER_NUM)  
  
  
SELECT N'<literal:3>' AS SCALAR,   
  count(sc.INTERNAL_CONTAINER_NUM) AS ChildContainerCount  
  FROM SHIPPING_CONTAINER sc 
  WHERE sc.PARENT = @internalContainerNum  
  AND SC.CONTAINER_TYPE <> N'<literal:4>';  
  
SELECT N'<literal:5>' AS SCALAR,   
  count(sc.INTERNAL_CONTAINER_NUM) AS ContentsCount  
  FROM SHIPPING_CONTAINER sc 
  WHERE sc.PARENT = @internalContainerNum  
  AND SC.CONTAINER_TYPE = N'<literal:6>';  
  
END