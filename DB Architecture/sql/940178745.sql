-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










	



CREATE PROCEDURE ADT_LogAudit(
	@stMethodName nvarchar(500),
	@stReturnValue nvarchar(max),
	@stMessage nvarchar(max),
	@stParm1Label nvarchar(2000) = null,
	@stParm1 nvarchar(max),
	@stParm2Label nvarchar(2000) = null,
	@stParm2 nvarchar(max),
	@stParm3Label nvarchar(2000) = null,
	@stParm3 nvarchar(max),
	@stParm4Label nvarchar(2000) = null,
	@stParm4 nvarchar(max),
	@stParm5Label nvarchar(2000) = null,
	@stParm5 nvarchar(max),
	@stParm6Label nvarchar(2000) = null,
	@stParm6 nvarchar(max),
	@stParm7Label nvarchar(2000) = null,
	@stParm7 nvarchar(max),
	@stParm8Label nvarchar(2000) = null,
	@stParm8 nvarchar(max),
	@stParm9Label nvarchar(2000) = null,
	@stParm9 nvarchar(max),
	@stParm10Label nvarchar(2000) = null,
	@stParm10 nvarchar(max),
	@stUserName nvarchar(30),
	@stWarehouse nvarchar(50),
	@stMachineName nvarchar(50) = null,
	@stCallStack nvarchar(max) = null,
	@stClassName nvarchar(500) = null)
AS

	SET NOCOUNT ON;

	declare @internalId numeric(9);
	declare @parm1 nvarchar(max);
	declare @parm2 nvarchar(max);
	declare @parm3 nvarchar(max);
	declare @parm4 nvarchar(max);
	declare @parm5 nvarchar(max);
	declare @parm6 nvarchar(max);
	declare @parm7 nvarchar(max);
	declare @parm8 nvarchar(max);
	declare @parm9 nvarchar(max);
	declare @parm10 nvarchar(max);
	declare @className nvarchar(500);
	declare @maxFieldLength INT;
	declare @currentDate datetime;

	if (@stClassName IS NOT NULL)
		set @className = @stClassName;
	else
		set @className = @stMethodName;
		
	set @currentDate = GETUTCDATE();
	
	INSERT INTO AUDIT_LOG
		(CLASS_NAME,
		DATE_TIME_STAMP,
		LOGGED_DATE_TIME,
		METHOD_NAME,
		PROCESS_STAMP,
		RECORD_TYPE,
		USER_STAMP,
		WAREHOUSE,
		MACHINE_NAME)
	VALUES
		(@className, -- [comment omitted]
		@currentDate, -- [comment omitted]
		@currentDate, -- [comment omitted]
		@stMethodName, -- [comment omitted]
		@stMethodName, -- [comment omitted]
		N'<literal:1>', -- [comment omitted]
		@stUserName, -- [comment omitted]
		@stWarehouse,
		@stMachineName);

	set @internalId = scope_identity();
	set @maxFieldLength = 1998;

	if (@stParm1 IS NOT NULL)
	begin
		set @parm1 = ISNULL(@stParm1Label,N'<literal:2>') + @stParm1;
		exec ADT_IAuditLogValue @internalId, 0, @parm1, @stUserName, @currentDate;
	end;

	if (@stParm2 IS NOT NULL)
	begin
		set @parm2 = ISNULL(@stparm2Label,N'<literal:3>') + @stparm2;
		exec ADT_IAuditLogValue @internalId, 1, @parm2, @stUserName, @currentDate;
	end;

	if (@stParm3 IS NOT NULL)
	begin
		set @parm3 = ISNULL(@stparm3Label,N'<literal:4>') + @stparm3;
		exec ADT_IAuditLogValue @internalId, 2, @parm3, @stUserName, @currentDate;
	end;

	if (@stParm4 IS NOT NULL)
	begin
		set @parm4 = ISNULL(@stparm4Label,N'<literal:5>') + @stparm4;
		exec ADT_IAuditLogValue @internalId, 3, @parm4, @stUserName, @currentDate;
	end;

	if (@stParm5 IS NOT NULL)
	begin
		set @parm5 = ISNULL(@stparm5Label,N'<literal:6>') + @stparm5;
		exec ADT_IAuditLogValue @internalId, 4, @parm5, @stUserName, @currentDate;
	end;

	if (@stParm6 IS NOT NULL)
	begin
		set @parm6 = ISNULL(@stparm6Label,N'<literal:7>') + @stparm6;
		exec ADT_IAuditLogValue @internalId, 5, @parm6, @stUserName, @currentDate;
	end;

	if (@stParm7 IS NOT NULL)
	begin
		set @parm7 = ISNULL(@stparm7Label,N'<literal:8>') + @stparm7;
		exec ADT_IAuditLogValue @internalId, 6, @parm7, @stUserName, @currentDate;
	end;

	if (@stParm8 IS NOT NULL)
	begin
		set @parm8 = ISNULL(@stparm8Label,N'<literal:9>') + @stparm8;
		exec ADT_IAuditLogValue @internalId, 7, @parm8, @stUserName, @currentDate;
	end;
	
	if (@stParm9 IS NOT NULL)
	begin
		set @parm9 = ISNULL(@stParm9Label,N'<literal:10>') + @stParm9;
		exec ADT_IAuditLogValue @internalId, 8, @parm9, @stUserName, @currentDate;
	end;

	if (@stParm10 IS NOT NULL)
	begin
		set @parm10 = ISNULL(@stparm10Label,N'<literal:11>') + @stparm10;
		exec ADT_IAuditLogValue @internalId, 9, @parm10, @stUserName, @currentDate;
	end;

	if (@stReturnValue IS NOT NULL)
	begin
		exec ADT_IAuditLogValue @internalId, 10, @stReturnValue, @stUserName, @currentDate;
	end;

	if (@stCallStack IS NOT NULL)
	begin
		exec ADT_IAuditLogValue @internalId, 11, @stCallStack, @stUserName, @currentDate;
	end;

	if (@stMessage IS NOT NULL)
	begin
		exec ADT_IAuditLogValue @internalId, 12, @stMessage, @stUserName, @currentDate;
	end;

