-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE TRAV_CC_Reconcile (@culture nvarchar(100))
AS
BEGIN 
	DECLARE @WorkUnit NVARCHAR(max)

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]

	DECLARE sl_workunits CURSOR LOCAL STATIC READ_ONLY FORWARD_ONLY
	FOR
		SELECT work_unit
		FROM work_instruction WITH(NOLOCK)
		WHERE INTERNAL_NUM_TYPE = N'<literal:1>'
		AND condition = N'<literal:2>'
		GROUP BY work_unit
		HAVING Count(work_unit) = 1
		ORDER BY work_unit ASC;

	OPEN sl_workunits;
	
	FETCH next FROM sl_workunits INTO @WorkUnit
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
	
		-- [comment omitted]
		
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		
		UPDATE work_instruction
		SET condition = N'<literal:3>',
		process_stamp = N'<literal:4>'
		WHERE work_unit = @WorkUnit
		AND instruction_type = N'<literal:5>'
		AND INTERNAL_NUM_TYPE = N'<literal:6>'
		 
		EXEC Deactivatework @WorkUnit

		FETCH next FROM sl_workunits INTO @WorkUnit
	END;
	
	CLOSE sl_workunits
	DEALLOCATE sl_workunits
	
	-- [comment omitted]
	-- [comment omitted]

END

