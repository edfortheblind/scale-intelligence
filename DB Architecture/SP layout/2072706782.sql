/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	204228		| DP			| 06/19/17	| Created.
	204234      | PA            | 07/05/17  | Modified select statement to send Internal Detail Number
*/

CREATE PROCEDURE LA_InsightDetailPaneData(@InternalDetailNumber numeric(9) ,@culture nvarchar(10)) 
AS 
BEGIN

	-- Detail pane details
	SELECT top 1 N'SCALAR' AS SCALAR,
		dbo.RSCMfn_RtrvResource(LD.ACTIVITY_SCREEN,N'Text', null) AS ActivityScreen,
		dbo.LABORCONFIGfn_RtrvDesc(LD.ACTIVITY_TYPE) AS ActivityType,
		LD.USER_NAME AS UserName,
		LD.INTERNAL_DETAIL_NUM AS InternalDetailNumber
	FROM LABOR_MANAGEMENT_DETAIL LD
	WHERE LD.INTERNAL_DETAIL_NUM = @InternalDetailNumber;

END

