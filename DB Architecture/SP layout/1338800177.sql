/*    
    Task      | By         | Date			| Modification Description    
    --------------------------------------------------------------------    
    255435    | SKT        | 07/29/20		| Created.    
	7630	  | SSM        | 12/10/21		| Modified the SP to suport Tote Pick in Cart Picking.    
*/    
    
CREATE PROCEDURE WRK_UpdateWorkInstructionForCartPicking(    
@workunit nvarchar(50),
@containerId nvarchar(25),
@workProfile nvarchar(25),
@groupNumber nvarchar(50),
@internalContainerNum numeric(9),
@spotNumber numeric(9),
@assignSpot bit,
@renameContainer bit
)  
AS    
  
DECLARE @totePick NCHAR(2)  
  
SELECT @totePick= TOTE_PICK from WORK_PROFILE_DETAIL where WORK_PROFILE = @workprofile  

IF (ISNULL(@totePick,N'N')=N'Y' AND ISNULL(@containerId, N'') != N'' AND ISNULL(@workunit, N'') != N'')  
BEGIN  
 UPDATE WORK_INSTRUCTION SET TRANSPORT_CONT_ID = @containerId, GROUP_NUM = @groupNumber, SEQUENCE = 0   
 WHERE WORK_UNIT = @workunit and INTERNAL_NUM_TYPE=N'Shipment' and CONDITION <> N'Closed'  
END
ELSE IF (ISNULL(@containerId, N'') != N'')
BEGIN
  UPDATE WORK_INSTRUCTION SET TRANSPORT_CONT_ID = @containerId, GROUP_NUM = @groupNumber, SEQUENCE = 0    
  WHERE TRANSPORT_CONT_ID = @containerId and INTERNAL_NUM_TYPE=N'Shipment' and CONDITION <> N'Closed'      
    
  --Updates Group_Position value on the ShippingContainer for System/User spot assigned cart picking    
  EXEC SHP_UpdateGroupPosition @renameContainer, @assignSpot, @groupNumber, @containerId, @internalContainerNum, @spotNumber    
END  
  
