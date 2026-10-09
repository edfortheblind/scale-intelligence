

/*
 Mod     | Programmer    | Date       | Modification Description
 --------------------------------------------------------------------
  EX01   | rphilip	     | 03/10/2023 | EX01 - Resend PS Data Action from Insight Screen 
*/



CREATE PROCEDURE [dbo].[TRAV_EX01_ReprintPS]
(
@INTERNAL nvarchar(max),
@username NVARCHAR(200),   
@error NVARCHAR(2000) OUTPUT,  
@success NVARCHAR(2000) OUTPUT
)
AS
SET NOCOUNT ON

declare @containerID nvarchar(50)
declare @data nvarchar(max)

DECLARE CONTAINER_LIST CURSOR FAST_FORWARD READ_ONLY
    FOR select container_id from shipping_container where LAUNCH_NUM = @INTERNAL and container_id is not null and status = 300

open container_list

fetch next from CONTAINER_LIST
into @containerID

WHILE @@FETCH_STATUS = 0
BEGIN

	set @data = '00001;CTN_PRINT;' + @containerID + ';10;10;5;3PL-SHIP-A-1-Z;20251120112219'

	INSERT INTO DIF_INCOMING_MESSAGE (ENCODING, DATE_TIME_STAMP, SOURCE_ID, STATUS, PROCESS_STAMP, DATA, USER_STAMP, ENDPOINT_ID, EVENT_ID, INSERTED_DATE_TIME, DIF_EVE_EXE_IDENTIFIER)
	VALUES ('0', GETUTCDATE(), '192.168.20.13', 'Ready', 'DIFIncomingMessageHandler.HandleMessage', @data, 'ilssrveastus', '15', '106', GETUTCDATE(), 'EX01_PSTOSCALE')

	fetch next from CONTAINER_LIST
	into @containerID

END

CLOSE container_list;
DEALLOCATE container_list;
