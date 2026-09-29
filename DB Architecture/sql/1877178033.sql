-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


/* [comment omitted] */







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

	set @data = '<literal:1>' + @containerID + '<literal:2>'

	INSERT INTO DIF_INCOMING_MESSAGE (ENCODING, DATE_TIME_STAMP, SOURCE_ID, STATUS, PROCESS_STAMP, DATA, USER_STAMP, ENDPOINT_ID, EVENT_ID, INSERTED_DATE_TIME, DIF_EVE_EXE_IDENTIFIER)
	VALUES ('<literal:3>', GETUTCDATE(), '<literal:4>', '<literal:5>', '<literal:6>', @data, '<literal:7>', '<literal:8>', '<literal:9>', GETUTCDATE(), '<literal:10>')

	fetch next from CONTAINER_LIST
	into @containerID

END

CLOSE container_list;
DEALLOCATE container_list;
