/*  
 Mod Number | Programmer | Date    | Modification Description  
 --------------------------------------------------------------------  
 240583     | SO		| 01/16/20 | Created.
 267460     | OB		| 07/08/21 | Added the ReasonCodePattern and DispositionCodePattern.
 28060      | OB		| 09/12/23 | Removed the ReasonCodePattern and DispositionCodePattern for optimisation purposes
*/  
CREATE PROCEDURE SRC_ReceivingConfiguratorModel( 
 @internalWorkSpecialHanding int)  
AS  
 SET NOCOUNT ON;  

 select top 1  *   
 from   
 (  
  select   
  INTERNAL_WORK_SPEC_NUM as INTERNAL_WORK_SPEC_NUM,   
  case when (ITEM_VERIFY = N'Y') then N'true' else N'false' end as ItemVerify, 
  case when (QUANTITY_VERIFY = N'Y') then N'true' else N'false' end as QuantityVerify,
  case when (LOGISTICS_UNIT_VERIFY = N'Y') then N'true' else N'false' end as LogisticUnitVerify,  
  case when (LOT_VERIFY = N'Y') then N'true' else N'false' end as LotVerify
  from WORK_SPECIAL_HANDLING where INTERNAL_WORK_SPEC_NUM =@internalWorkSpecialHanding  
  union  
  select 0 as INTERNAL_WORK_SPEC_NUM ,  
  N'false' as ItemVerify, 
  N'false' as QuantityVerify, 
  N'false' as LogisticUnitVerify,  
  N'false' as LotVerify 
  
 ) WSH order by INTERNAL_WORK_SPEC_NUM desc;  