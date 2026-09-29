-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE [dbo].[TRAV_EX02_SCALEtoWCSDIFOutUpdate](
@WORK_UNIT	nvarchar(50) )

AS

    DECLARE
	@Loc			nvarchar(25),
	@LaneNumber	nvarchar(25),
	@UserDef1	nvarchar(25),
	@UserDef2   nvarchar(25),
	@DateTimeStamp datetime,
	@stNextNum nvarchar(10),
	@EventId int,
	@DeLim NCHAR(1),
    @PALLETREQUESTDATA varchar(MAX);
	
	SET @DeLim = N'<literal:1>';

	IF EXISTS (SELECT 1 FROM TRAV_PALLET WITH(NOLOCK) WHERE WORK_UNIT = @WORK_UNIT)
    BEGIN
	
	SELECT 
    @Loc	= Location,
	@LaneNumber	= Lane_Number,
	@UserDef1 = User_Def1,
	@UserDef2  = User_def2,
	@DateTimeStamp = Date_time_stamp
	FROM TRAV_PALLET where Work_Unit=@WORK_UNIT;

	SELECT @EventId=EVENT_ID FROM DIF_EVENT WITH(NOLOCK) WHERE EVENT_DESCRIPTION = N'<literal:2>';

	EXEC NNR_GetNextNumber N'<literal:3>',@stNextNum output;
    SET @stNextNum = (SELECT REPLICATE(N'<literal:4>', 5-LEN(@stNextNum)) + @stNextNum);
 
 /* [comment omitted] */


	    SET @PALLETREQUESTDATA = @stNextNum+@DeLim+N'<literal:5>'+@DeLim+@WORK_UNIT+@DeLim+@Loc+@DeLim+@LaneNumber+@DeLim+ISNULL(@UserDef1,N'<literal:6>')+@DeLim+ISNULL(@UserDef2,N'<literal:7>');


	INSERT INTO DIF_OUTGOING_MESSAGE (DATA, STATUS, EVENT_ID, USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP)
    VALUES (@PALLETREQUESTDATA,N'<literal:8>',@EventId,N'<literal:9>',N'<literal:10>',GETUTCDATE());

	END