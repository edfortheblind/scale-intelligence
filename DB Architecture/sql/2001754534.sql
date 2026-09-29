-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





  
CREATE PROCEDURE SRC_ReceivingConfiguratorModel( 
 @internalWorkSpecialHanding int)  
AS  
 SET NOCOUNT ON;  

 select top 1  *   
 from   
 (  
  select   
  INTERNAL_WORK_SPEC_NUM as INTERNAL_WORK_SPEC_NUM,   
  case when (ITEM_VERIFY = N'<literal:1>') then N'<literal:2>' else N'<literal:3>' end as ItemVerify, 
  case when (QUANTITY_VERIFY = N'<literal:4>') then N'<literal:5>' else N'<literal:6>' end as QuantityVerify,
  case when (LOGISTICS_UNIT_VERIFY = N'<literal:7>') then N'<literal:8>' else N'<literal:9>' end as LogisticUnitVerify,  
  case when (LOT_VERIFY = N'<literal:10>') then N'<literal:11>' else N'<literal:12>' end as LotVerify
  from WORK_SPECIAL_HANDLING where INTERNAL_WORK_SPEC_NUM =@internalWorkSpecialHanding  
  union  
  select 0 as INTERNAL_WORK_SPEC_NUM ,  
  N'<literal:13>' as ItemVerify, 
  N'<literal:14>' as QuantityVerify, 
  N'<literal:15>' as LogisticUnitVerify,  
  N'<literal:16>' as LotVerify 
  
 ) WSH order by INTERNAL_WORK_SPEC_NUM desc;  