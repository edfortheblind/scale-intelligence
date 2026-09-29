-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE wm_RCommentText05
	@internalNum numeric(9),
	@internalLineNum numeric(9),
	@recordType	nvarchar(10),
	@interfaceLinkID numeric(9)
			
AS	
	if(@interfaceLinkID=0)	
		SELECT * FROM COMMENT_TEXT
		WHERE INTERNAL_NUM = @internalNum AND
		RECORD_TYPE = @recordType AND		
		(INTERNAL_LINE_NUM = @internalLineNum OR (INTERNAL_LINE_NUM IS NULL AND @internalLineNum = 0));
	else
		SELECT UC.* 
		FROM UPLOAD_ORDER_COMMENT UC, COMMENT_TEXT CT  
		WHERE UC.INTERNAL_NUM = @internalNum AND
		CT.RECORD_TYPE = @recordType AND		
		ISNULL(UC.INTERNAL_LINE_NUM,0) = @internalLineNum AND
		CT.INTERNAL_COMMENT_ID = UC.INTERFACE_RECORD_ID AND
		UC.INTERFACE_LINK_ID = @interfaceLinkID;