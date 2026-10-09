CREATE FUNCTION TpmOrderContainerStatus_TrackingLink(
	@trackingLink nvarchar(500),
	@trackingNumber nvarchar(50))
RETURNS nvarchar(500)
BEGIN
	IF NULLIF(@trackingLink, N'') IS NULL
		RETURN N'';
	ELSE
		declare @fullLink nvarchar(500);
		SELECT @fullLink = REPLACE(@trackingLink, N'{{TRACKING_NUMBER}}', @trackingNumber);
		RETURN @fullLink;
END -- end TpmOrderContainerStatus_TrackingLink