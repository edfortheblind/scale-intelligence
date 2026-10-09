-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	204548  | DN    | 06/19/17  | Created
*/
-------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE GetAvailableAccessorials(
@internalNum int,
@internalNumType nvarchar(100))
AS
--for combo on edit accessorials screen
if(UPPER(@internalNumType) = N'SHIPMENT')
BEGIN
	SELECT 
		AH.ACCESSORIAL_CODE,
		AH.DESCRIPTION,
		AH.OBJECT_ID
	FROM 
		SHIPMENT_HEADER SHP
		INNER JOIN
		CARRIER CR ON SHP.CARRIER=CR.CARRIER AND ISNULL(SHP.CARRIER_SERVICE, N'*') = ISNULL(CR.SERVICE, N'*')
		INNER JOIN
		ACCESSORIAL_HEADER AH ON AH.RATING_ID = CR.RATING_ID AND ISNULL(AH.RATING_SERVICE, N'*') = ISNULL(CR.RATING_SERVICE, N'*')
	WHERE SHP.INTERNAL_SHIPMENT_NUM=@internalNum;
END
ELSE
BEGIN 
	declare @isContainerContent bit=0;
	select @isContainerContent = 1 FROM SHIPPING_CONTAINER WHERE INTERNAL_CONTAINER_NUM=@internalNum AND CONTAINER_TYPE=N'-';
	IF(@isContainerContent = 1)	
	BEGIN
		SELECT 
			AH.ACCESSORIAL_CODE,
			AH.DESCRIPTION,
			AH.OBJECT_ID
		FROM 
			SHIPPING_CONTAINER SC
			INNER JOIN
			SHIPMENT_HEADER SHP ON SC.INTERNAL_SHIPMENT_NUM=SHP.INTERNAL_SHIPMENT_NUM
			INNER JOIN
			CARRIER CR ON SHP.CARRIER=CR.CARRIER AND ISNULL(SHP.CARRIER_SERVICE, N'*') = ISNULL(CR.SERVICE, N'*')
			INNER JOIN
			ACCESSORIAL_HEADER AH ON AH.RATING_ID = CR.RATING_ID AND ISNULL(AH.RATING_SERVICE, N'*') = ISNULL(CR.RATING_SERVICE, N'*')
		WHERE SC.INTERNAL_CONTAINER_NUM=@internalNum AND AH.APPLY_PER_CONTAINER=N'Y';
	END
	ELSE
	BEGIN
		SELECT 
			AH.ACCESSORIAL_CODE,
			AH.DESCRIPTION,
			AH.OBJECT_ID
		FROM 
			SHIPPING_CONTAINER SC
			INNER JOIN
			SHIPMENT_HEADER SHP ON SC.INTERNAL_SHIPMENT_NUM=SHP.INTERNAL_SHIPMENT_NUM
			INNER JOIN
			CARRIER CR ON SHP.CARRIER=CR.CARRIER AND ISNULL(SHP.CARRIER_SERVICE, N'*') = ISNULL(CR.SERVICE, N'*')
			INNER JOIN
			ACCESSORIAL_HEADER AH ON AH.RATING_ID = CR.RATING_ID AND ISNULL(AH.RATING_SERVICE, N'*') = ISNULL(CR.RATING_SERVICE, N'*')
		WHERE SC.INTERNAL_CONTAINER_NUM=@internalNum AND AH.APPLY_PER_CONTAINER=N'Y' AND EXISTS(SELECT TOP 1 1 FROM ACCESSORIAL_DETAIL WHERE HEADER_ID=AH.OBJECT_ID AND APPLY_TO_CONTAINER_CONTENTS=N'N');
	END
END

