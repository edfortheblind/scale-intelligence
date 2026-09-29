-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

-- [comment omitted]
CREATE PROCEDURE GetShippingLabelImage(
	@INTERNAL_CONTAINER_NUM numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
	
	declare @imageData varbinary(max);
	declare @returnsImageData varbinary(max);	
	
	SELECT @returnsImageData=IMAGE_DATA FROM LABEL_IMAGE_DATA WHERE INTERNAL_CONTAINER_NUM=@INTERNAL_CONTAINER_NUM 
		AND IS_RETURNS_LABEL=N'<literal:1>';
	
	SELECT @imageData=IMAGE_DATA FROM LABEL_IMAGE_DATA WHERE INTERNAL_CONTAINER_NUM=@INTERNAL_CONTAINER_NUM 
		AND IS_RETURNS_LABEL=N'<literal:2>';
	
	
	select @imageData AS IMAGE_DATA,@returnsImageData AS RETURNS_IMAGE_DATA;

end 

