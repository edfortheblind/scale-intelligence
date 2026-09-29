-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE PROCEDURE wm_RCommentText06
	@internalNum numeric(9),
	@internalLineNum numeric(9),
	@interfaceLinkID numeric(9)
			
AS	
	if(@internalNum > 0)	
			SELECT * FROM UPLOAD_ORDER_COMMENT
			WHERE INTERNAL_NUM=@INTERNALNUM
			AND INTERNAL_LINE_NUM = @internalLineNum 
			AND INTERFACE_LINK_ID = @InterfaceLinkID;
	else 
			SELECT * FROM UPLOAD_ORDER_COMMENT
			WHERE INTERNAL_LINE_NUM = @internalLineNum 
			AND INTERFACE_LINK_ID = @InterfaceLinkID;