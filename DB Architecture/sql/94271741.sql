-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE FUNCTION TpmOrderContainerStatus_TrackingLink(
	@trackingLink nvarchar(500),
	@trackingNumber nvarchar(50))
RETURNS nvarchar(500)
BEGIN
	IF NULLIF(@trackingLink, N'<literal:1>') IS NULL
		RETURN N'<literal:2>';
	ELSE
		declare @fullLink nvarchar(500);
		SELECT @fullLink = REPLACE(@trackingLink, N'<literal:3>', @trackingNumber);
		RETURN @fullLink;
END -- [comment omitted]