/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16086	| SWB	| 03/22/05	| Created.

	This function is used for comment information on both the header and detail records. Our report will not connect to 	
        this function, but other stored procedures will use it in their processing.
*/


CREATE FUNCTION RPTfn_GetCommentText(
	@internalNum numeric(9),
	@internalLineNum numeric(9),
	@recordType nvarchar(10),
	@documentType nvarchar(25))

returns Varchar(2000)

begin
	declare comments cursor for
	select
		ct.TEXT
	from
		COMMENT_TEXT ct,
		COMMENT_TYPE_DOC_ASSIGNMENT ctda
	where
		ct.COMMENT_TYPE = ctda.COMMENT_TYPE
		and
		ct.INTERNAL_NUM = @internalNum
		and
		isnull(ct.INTERNAL_LINE_NUM, 0) = isnull(@internalLineNum, 0)
		and
		ct.RECORD_TYPE = @recordType
		and
		ctda.DOCUMENT_TYPE = @documentType
	order by
		ct.INTERNAL_COMMENT_ID

	open comments;

	declare @text Varchar(2000);
	declare @recordText nvarchar(2000);

	fetch next from comments into @recordText;

	while (@@FETCH_STATUS = 0)
	begin
		-- cannot concat a null string.
		if (@text is null)
			set @text = @recordText;

		else if (len(@text) + len(@recordText) + 2 > 2000)
			break;

		else
			-- CHAR(10) and CHAR(13) are equivalent to '\r\n'
			set @text = @text + CHAR(10) + CHAR(13) + @recordText;
		
		fetch next from comments into @recordText;
	end;

	close comments;
	deallocate comments;

	return @text;
end -- RPTfn_GetCommentText







