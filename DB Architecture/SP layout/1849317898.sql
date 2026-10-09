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
	
	SET @DeLim = N'|';

	IF EXISTS (SELECT 1 FROM TRAV_PALLET WITH(NOLOCK) WHERE WORK_UNIT = @WORK_UNIT)
    BEGIN
	
	SELECT 
    @Loc	= Location,
	@LaneNumber	= Lane_Number,
	@UserDef1 = User_Def1,
	@UserDef2  = User_def2,
	@DateTimeStamp = Date_time_stamp
	FROM TRAV_PALLET where Work_Unit=@WORK_UNIT;

	SELECT @EventId=EVENT_ID FROM DIF_EVENT WITH(NOLOCK) WHERE EVENT_DESCRIPTION = N'PALLET_REQUEST Msg';

	EXEC NNR_GetNextNumber N'MHE-MESSAGEID_WCS',@stNextNum output;
    SET @stNextNum = (SELECT REPLICATE(N'0', 5-LEN(@stNextNum)) + @stNextNum);
 
 /*
    SET @PALLETREQUESTDATA = N'<STX>'+ @stNextNum+@DeLim+N'PALLET_REQUEST'+@DeLim+@WORK_UNIT+@DeLim+@Loc+@DeLim+@LaneNumber+@DeLim+ISNULL(@UserDef1,N'NULL')+@DeLim+ISNULL(@UserDef2,N'NULL')+N'<ETX>';
	*/
	    SET @PALLETREQUESTDATA = @stNextNum+@DeLim+N'PALLET_REQUEST'+@DeLim+@WORK_UNIT+@DeLim+@Loc+@DeLim+@LaneNumber+@DeLim+ISNULL(@UserDef1,N'NULL')+@DeLim+ISNULL(@UserDef2,N'NULL');


	INSERT INTO DIF_OUTGOING_MESSAGE (DATA, STATUS, EVENT_ID, USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP)
    VALUES (@PALLETREQUESTDATA,N'Ready',@EventId,N'ILSSRV',N'TRAV_EX02_SCALEtoWCSDIFOutUpdate',GETUTCDATE());

	END