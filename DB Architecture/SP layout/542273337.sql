
CREATE PROCEDURE wm_ICommentText01
	@InternalCommentId numeric(9) OUTPUT,
	@RecordType nvarchar(10),
	@InternalNum numeric(9),
	@InternalLineNum numeric(9),
	@CommentType nvarchar(25),
	@Text nvarchar(2000),
	@UserDef1 nvarchar(25),
	@UserDef2 nvarchar(25),
	@UserDef3 nvarchar(25),
	@UserDef4 nvarchar(25),
	@UserDef5 nvarchar(25),
	@UserDef6 nvarchar(25),
	@UserDef7 numeric(19,5),
	@UserDef8 numeric(19,5),
	@UserStamp nvarchar(30),
	@ProcessStamp nvarchar(100),
	@DateTimeStamp datetime
AS
	INSERT INTO COMMENT_TEXT(
		COMMENT_TYPE,
		DATE_TIME_STAMP,
		INTERNAL_LINE_NUM,
		INTERNAL_NUM,
		PROCESS_STAMP,
		RECORD_TYPE,
		TEXT,
		USER_DEF1,
		USER_DEF2,
		USER_DEF3,
		USER_DEF4,
		USER_DEF5,
		USER_DEF6,
		USER_DEF7,
		USER_DEF8,
		USER_STAMP
	) VALUES (
		@CommentType,
		@DateTimeStamp,
		@InternalLineNum,
		@InternalNum,
		@ProcessStamp,
		@RecordType,
		@Text,
		@UserDef1,
		@UserDef2,
		@UserDef3,
		@UserDef4,
		@UserDef5,
		@UserDef6,
		@UserDef7,
		@UserDef8,
		@UserStamp
	)
SELECT @InternalCommentId = SCOPE_IDENTITY()



