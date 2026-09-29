-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















	
CREATE PROCEDURE WOHB_UpdateQtyAvailToBuild(
	@iIntWONum numeric(9) = 0)
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	declare @dOnHandQty numeric(19,5);
	declare @dSavePercent float =0.0;
	declare @dTotalPercent float =0.0;
	declare @dTtlQtyNeeded numeric(14,5);
	declare @bug47265FeatureFlag nchar(2);

    SELECT @bug47265FeatureFlag = dbo.fn_GetFeatureEnabled(N'<literal:1>', NULL);
	
	-- [comment omitted]
	DECLARE curDetails CURSOR READ_ONLY FOR
		SELECT SUM(ON_HAND_QTY + TOTAL_QTY_USED) AS ON_HAND_QTY,
			   -- [comment omitted]
			   SUM(TOTAL_CONVERTED_QTY_NEEDED) AS ORIG_TOTAL_QTY_NEEDED 
		  FROM WORK_ORDER_DETAIL
		 WHERE INTERNAL_WORK_ORDER_NUM = @iIntWONum
		 GROUP BY BUILD_LEVEL,BUILD_SEQUENCE
		 ORDER BY BUILD_LEVEL, BUILD_SEQUENCE;
		 
	open curDetails;
	
	-- [comment omitted]
	FETCH NEXT FROM curDetails INTO
		@dOnHandQty, @dTtlQtyNeeded;
		
	-- [comment omitted]
	set @dSavePercent = 1.0;
	set @dTotalPercent = 1.0;
	while (@@FETCH_STATUS = 0)
	begin
		-- [comment omitted]
		-- [comment omitted]
		set @dTotalPercent = @dOnHandQty / @dTtlQtyNeeded;
		
		-- [comment omitted]
		-- [comment omitted]
		if(@dTotalPercent < @dSavePercent)
			set @dSavePercent = @dTotalPercent;
			
		-- [comment omitted]
		FETCH NEXT FROM curDetails INTO
			@dOnHandQty, @dTtlQtyNeeded;
	end -- [comment omitted]
	
	-- [comment omitted]
	if(@dTotalPercent < @dSavePercent)
		set @dSavePercent = @dTotalPercent;

	-- [comment omitted]
	CLOSE curDetails;
	DEALLOCATE curDetails;

	-- [comment omitted]
	 IF (@bug47265FeatureFlag = N'<literal:2>')
    BEGIN
        UPDATE WORK_ORDER_HEADER
           SET QTY_AVAIL_TO_BUILD = (QTY_TO_BE_BUILT * @dSavePercent) - QTY_BUILT,
               PROCESS_STAMP = N'<literal:3>',
               DATE_TIME_STAMP = GETUTCDATE()
         WHERE INTERNAL_WORK_ORDER_NUM = @iIntWONum;
    END
    ELSE
    BEGIN
        UPDATE WORK_ORDER_HEADER
           SET QTY_AVAIL_TO_BUILD = FLOOR((QTY_TO_BE_BUILT * @dSavePercent) - QTY_BUILT),
               PROCESS_STAMP = N'<literal:4>',
               DATE_TIME_STAMP = GETUTCDATE()
         WHERE INTERNAL_WORK_ORDER_NUM = @iIntWONum;
    END

	if (@@ERROR <> 0) return -1;
-- [comment omitted]


