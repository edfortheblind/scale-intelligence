-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RCommentText04
	@internalCommentID numeric(9),
	@InterfaceLinkID numeric(9)
			
AS
	if(@interfaceLinkID=0)	
		SELECT * FROM COMMENT_TEXT
		WHERE INTERNAL_COMMENT_ID = @internalCommentID;
	else
		SELECT * FROM UPLOAD_ORDER_COMMENT
		WHERE INTERFACE_RECORD_ID = @internalCommentID AND
		INTERFACE_LINK_ID = @InterfaceLinkID;