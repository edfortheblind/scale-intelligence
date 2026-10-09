/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	17717	| DSK   | 11/20/06	| Created
	135689	| JY	| 02/17/14	| Modified the table of upload and added new filter.
	143196	| DN	| 02/28/14	| When InterfaceLinkId is 0, look at comment_text table
*/
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