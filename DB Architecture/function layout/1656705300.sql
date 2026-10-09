/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	19875		| SSG		| 09/18/06	| Created.
	19909		| SSG		| 09/20/06	| Added condition to check Mark For Work Creation.
	
	Query the Replenishment Request table giving us a count of all rows that meet the criteria passed
	
	Parameters
		String	Item			The Item.
		String	Comapny			company.
		String	ToLoc			The To location.
		String	ToWhs			The warehouse.
				
	Return : Count of Records that have Work Created = N and Marked for Work Creation = Y plus the count of the records that have Work Created = Y with open work.
*/

-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;


CREATE FUNCTION INVfn_DoOpenRplnExist(
	@Item nvarchar(50),
	@Company nvarchar(25),
	@To_Loc nvarchar(25),
	@To_Whs nvarchar(25),
	@IncludeRequestsMarkedForWorkCreation nchar(1) = N'Y'
	) 

RETURNS numeric(9)	

AS
BEGIN

	DECLARE @iCount numeric(9);

	IF @Company = N''
	SET @Company = NULL;

	SET @iCount = 0;

	IF(@IncludeRequestsMarkedForWorkCreation = N'Y')
	BEGIN

	-- Retrieve information from the Replenishment Request table.
	SELECT @iCount = SUM(REPREQ.REQUESTCOUNT)
	FROM
      		(SELECT COUNT(N'x') AS REQUESTCOUNT
            	FROM REPLENISHMENT_REQUEST
            	WHERE MARKED_FOR_WORK_CREATION = N'Y' 
             	AND WORK_CREATED = N'N'
		AND ITEM = @Item
		AND ISNULL(COMPANY, N'!') = ISNULL(@Company, N'!')
		AND TO_LOC = @TO_LOC
		AND TO_WHS = @TO_WHS

        UNION

      		SELECT COUNT(N'x') AS REQUESTCOUNT 
	        FROM REPLENISHMENT_REQUEST, 
                WORK_INSTRUCTION
                WHERE REPLENISHMENT_REQUEST.WORK_CREATED = N'Y'
		AND REPLENISHMENT_REQUEST.ITEM = @Item
		AND ISNULL(REPLENISHMENT_REQUEST.COMPANY, N'!') = ISNULL(@Company, N'!')
		AND REPLENISHMENT_REQUEST.TO_LOC = @TO_LOC
		AND REPLENISHMENT_REQUEST.TO_WHS = @TO_WHS
       		AND WORK_INSTRUCTION.INTERNAL_NUM_TYPE = N'Replenishment'
       		AND WORK_INSTRUCTION.INTERNAL_NUM = REPLENISHMENT_REQUEST.INTERNAL_RPLN_REQ_NUM
       		AND (WORK_INSTRUCTION.CONDITION = N'In Process'
		OR WORK_INSTRUCTION.CONDITION= N'Open')) REPREQ;

	END;
	ELSE
	BEGIN

	SELECT @iCount = SUM(REPREQ.REQUESTCOUNT)
	FROM
      		(SELECT COUNT(N'x') AS REQUESTCOUNT
            	FROM REPLENISHMENT_REQUEST
            	WHERE WORK_CREATED = N'N'
		AND ITEM = @Item
		AND ISNULL(COMPANY, N'!') = ISNULL(@Company, N'!')
		AND TO_LOC = @TO_LOC
		AND TO_WHS = @TO_WHS

        UNION

      		SELECT COUNT(N'x') AS REQUESTCOUNT 
	        FROM REPLENISHMENT_REQUEST, 
                WORK_INSTRUCTION
                WHERE REPLENISHMENT_REQUEST.WORK_CREATED = N'Y'
		AND REPLENISHMENT_REQUEST.ITEM = @Item
		AND ISNULL(REPLENISHMENT_REQUEST.COMPANY, N'!') = ISNULL(@Company, N'!')
		AND REPLENISHMENT_REQUEST.TO_LOC = @TO_LOC
		AND REPLENISHMENT_REQUEST.TO_WHS = @TO_WHS
       		AND WORK_INSTRUCTION.INTERNAL_NUM_TYPE = N'Replenishment'
       		AND WORK_INSTRUCTION.INTERNAL_NUM = REPLENISHMENT_REQUEST.INTERNAL_RPLN_REQ_NUM
       		AND (WORK_INSTRUCTION.CONDITION = N'In Process'
		OR WORK_INSTRUCTION.CONDITION= N'Open')) REPREQ;

	END;

	RETURN @iCount;

END -- END INVfn_DoOpenRplnExist



