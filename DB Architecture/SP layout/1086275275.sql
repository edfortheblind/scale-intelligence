/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	17717	| DSK   | 11/20/06	| Created
	65756	| NB	| 03/02/10	| Modified to include record type while fetching comments
	135689	| JY	| 02/17/14	| Modified the table of upload and added new filter.
	143196	| DN	| 02/28/14	| When InterfaceLinkId is 0, look at comment_text table
*/
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