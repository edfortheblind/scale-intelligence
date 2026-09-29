-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




    
    
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

IF (ISNULL(@totePick,N'<literal:1>')=N'<literal:2>' AND ISNULL(@containerId, N'<literal:3>') != N'<literal:4>' AND ISNULL(@workunit, N'<literal:5>') != N'<literal:6>')  
BEGIN  
 UPDATE WORK_INSTRUCTION SET TRANSPORT_CONT_ID = @containerId, GROUP_NUM = @groupNumber, SEQUENCE = 0   
 WHERE WORK_UNIT = @workunit and INTERNAL_NUM_TYPE=N'<literal:7>' and CONDITION <> N'<literal:8>'  
END
ELSE IF (ISNULL(@containerId, N'<literal:9>') != N'<literal:10>')
BEGIN
  UPDATE WORK_INSTRUCTION SET TRANSPORT_CONT_ID = @containerId, GROUP_NUM = @groupNumber, SEQUENCE = 0    
  WHERE TRANSPORT_CONT_ID = @containerId and INTERNAL_NUM_TYPE=N'<literal:11>' and CONDITION <> N'<literal:12>'      
    
  -- [comment omitted]
  EXEC SHP_UpdateGroupPosition @renameContainer, @assignSpot, @groupNumber, @containerId, @internalContainerNum, @spotNumber    
END  
  
