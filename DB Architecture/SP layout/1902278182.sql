/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14875	| LJM	| 08/26/04	| created
	135689	| JY	| 02/17/14	| Modified the table of upload and added new filter.
    134894  | SHS   | 05/22/14  | Removed Serial_Number_View
	143196	| DN	| 06/04/14	| Changed upload logic
*/

CREATE PROCEDURE wm_RSerialNumber09
	@GroupId nvarchar(32),
	@ObjectId numeric(9),
	@InterfaceLinkID numeric(9)
AS
SET NOCOUNT ON;
	if(@interfaceLinkID=0)
		SELECT *
		FROM SERIAL_NUMBER
		WHERE GROUP_ID = @GroupId
		AND OBJECT_ID <> @ObjectId
		UNION ALL
		SELECT *
		FROM AR_SERIAL_NUMBER
		WHERE GROUP_ID = @GroupId
		AND OBJECT_ID <> @ObjectId
	else
		SELECT *
		FROM SERIAL_NUMBER WHERE OBJECT_ID IN (SELECT INTERFACE_RECORD_ID 
		FROM UPLOAD_SERIAL_NUMBER 
		WHERE GROUP_ID = @GroupId
		AND OBJECT_ID <> @ObjectId
		AND INTERFACE_LINK_ID = @InterfaceLinkID)
		UNION ALL		
		SELECT *
		FROM AR_SERIAL_NUMBER WHERE OBJECT_ID IN (SELECT INTERFACE_RECORD_ID 
		FROM UPLOAD_SERIAL_NUMBER 
		WHERE GROUP_ID = @GroupId
		AND OBJECT_ID <> @ObjectId
		AND INTERFACE_LINK_ID = @InterfaceLinkID);