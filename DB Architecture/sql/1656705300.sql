-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */
















-- [comment omitted]


CREATE FUNCTION INVfn_DoOpenRplnExist(
	@Item nvarchar(50),
	@Company nvarchar(25),
	@To_Loc nvarchar(25),
	@To_Whs nvarchar(25),
	@IncludeRequestsMarkedForWorkCreation nchar(1) = N'<literal:1>'
	) 

RETURNS numeric(9)	

AS
BEGIN

	DECLARE @iCount numeric(9);

	IF @Company = N'<literal:2>'
	SET @Company = NULL;

	SET @iCount = 0;

	IF(@IncludeRequestsMarkedForWorkCreation = N'<literal:3>')
	BEGIN

	-- [comment omitted]
	SELECT @iCount = SUM(REPREQ.REQUESTCOUNT)
	FROM
      		(SELECT COUNT(N'<literal:4>') AS REQUESTCOUNT
            	FROM REPLENISHMENT_REQUEST
            	WHERE MARKED_FOR_WORK_CREATION = N'<literal:5>' 
             	AND WORK_CREATED = N'<literal:6>'
		AND ITEM = @Item
		AND ISNULL(COMPANY, N'<literal:7>') = ISNULL(@Company, N'<literal:8>')
		AND TO_LOC = @TO_LOC
		AND TO_WHS = @TO_WHS

        UNION

      		SELECT COUNT(N'<literal:9>') AS REQUESTCOUNT 
	        FROM REPLENISHMENT_REQUEST, 
                WORK_INSTRUCTION
                WHERE REPLENISHMENT_REQUEST.WORK_CREATED = N'<literal:10>'
		AND REPLENISHMENT_REQUEST.ITEM = @Item
		AND ISNULL(REPLENISHMENT_REQUEST.COMPANY, N'<literal:11>') = ISNULL(@Company, N'<literal:12>')
		AND REPLENISHMENT_REQUEST.TO_LOC = @TO_LOC
		AND REPLENISHMENT_REQUEST.TO_WHS = @TO_WHS
       		AND WORK_INSTRUCTION.INTERNAL_NUM_TYPE = N'<literal:13>'
       		AND WORK_INSTRUCTION.INTERNAL_NUM = REPLENISHMENT_REQUEST.INTERNAL_RPLN_REQ_NUM
       		AND (WORK_INSTRUCTION.CONDITION = N'<literal:14>'
		OR WORK_INSTRUCTION.CONDITION= N'<literal:15>')) REPREQ;

	END;
	ELSE
	BEGIN

	SELECT @iCount = SUM(REPREQ.REQUESTCOUNT)
	FROM
      		(SELECT COUNT(N'<literal:16>') AS REQUESTCOUNT
            	FROM REPLENISHMENT_REQUEST
            	WHERE WORK_CREATED = N'<literal:17>'
		AND ITEM = @Item
		AND ISNULL(COMPANY, N'<literal:18>') = ISNULL(@Company, N'<literal:19>')
		AND TO_LOC = @TO_LOC
		AND TO_WHS = @TO_WHS

        UNION

      		SELECT COUNT(N'<literal:20>') AS REQUESTCOUNT 
	        FROM REPLENISHMENT_REQUEST, 
                WORK_INSTRUCTION
                WHERE REPLENISHMENT_REQUEST.WORK_CREATED = N'<literal:21>'
		AND REPLENISHMENT_REQUEST.ITEM = @Item
		AND ISNULL(REPLENISHMENT_REQUEST.COMPANY, N'<literal:22>') = ISNULL(@Company, N'<literal:23>')
		AND REPLENISHMENT_REQUEST.TO_LOC = @TO_LOC
		AND REPLENISHMENT_REQUEST.TO_WHS = @TO_WHS
       		AND WORK_INSTRUCTION.INTERNAL_NUM_TYPE = N'<literal:24>'
       		AND WORK_INSTRUCTION.INTERNAL_NUM = REPLENISHMENT_REQUEST.INTERNAL_RPLN_REQ_NUM
       		AND (WORK_INSTRUCTION.CONDITION = N'<literal:25>'
		OR WORK_INSTRUCTION.CONDITION= N'<literal:26>')) REPREQ;

	END;

	RETURN @iCount;

END -- [comment omitted]



