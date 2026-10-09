/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9593		| RAB			| 10/09/02	| Modified for standards.
	11920		| TDL			| 06/16/03	| Include Built Qty in Calculation
	12380		| TDL			| 09/26/03	| Calculate considering orignal qty needed
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	15829		| NNP			| 08/01/05	| Made cursor Read_Only
	19384		| TDL			| 06/27/06	| Include Total Used to get On Hand since it is no longer included in on hand
	65093		| DN			| 02/10/10	| Modified to round off calculated value
	142111      | KSS           | 05/30/14  | Modified to Floor of calculated value
	263361      | PS			| 02/24/21  | Modified datatype of dSavePercent ,dTotalPercent to float
	Updates the WorkOrderHeaders qtyAvailToBuild field based on
	the status of its WorkOrderDetails.
	
	Parameters
		int		iIntWONum		WorkOrderHeader being updated.
*/	
CREATE PROCEDURE WOHB_UpdateQtyAvailToBuild(
	@iIntWONum numeric(9) = 0)
AS
	SET NOCOUNT ON;

	-- local variables
	declare @dOnHandQty numeric(19,5);
	declare @dSavePercent float =0.0;
	declare @dTotalPercent float =0.0;
	declare @dTtlQtyNeeded numeric(14,5);
	declare @bug47265FeatureFlag nchar(2);

    SELECT @bug47265FeatureFlag = dbo.fn_GetFeatureEnabled(N'BUG_47265_WORKORDERDECIMALQTY', NULL);
	
	-- retrieve the WorkOrderDetail totals grouped by build level/sequence
	DECLARE curDetails CURSOR READ_ONLY FOR
		SELECT SUM(ON_HAND_QTY + TOTAL_QTY_USED) AS ON_HAND_QTY,
			   -- Do not want to include extra quantity brought forward
			   SUM(TOTAL_CONVERTED_QTY_NEEDED) AS ORIG_TOTAL_QTY_NEEDED 
		  FROM WORK_ORDER_DETAIL
		 WHERE INTERNAL_WORK_ORDER_NUM = @iIntWONum
		 GROUP BY BUILD_LEVEL,BUILD_SEQUENCE
		 ORDER BY BUILD_LEVEL, BUILD_SEQUENCE;
		 
	open curDetails;
	
	-- fetch the first record.
	FETCH NEXT FROM curDetails INTO
		@dOnHandQty, @dTtlQtyNeeded;
		
	-- Loop through the records to calculate the % that can be built
	set @dSavePercent = 1.0;
	set @dTotalPercent = 1.0;
	while (@@FETCH_STATUS = 0)
	begin
		-- Caculate the percentage of components that can be built for the given
		-- build level/sequence level combination
		set @dTotalPercent = @dOnHandQty / @dTtlQtyNeeded;
		
		-- If this is the smallest percentage so far save it 
		-- since it indicates the smallest percentage of quantity we can build
		if(@dTotalPercent < @dSavePercent)
			set @dSavePercent = @dTotalPercent;
			
		-- fetch the next record.
		FETCH NEXT FROM curDetails INTO
			@dOnHandQty, @dTtlQtyNeeded;
	end -- end while through WorkOrderDetails
	
	-- Check the last percent 
	if(@dTotalPercent < @dSavePercent)
		set @dSavePercent = @dTotalPercent;

	-- close and deallocate the details
	CLOSE curDetails;
	DEALLOCATE curDetails;

	-- update the header
	 IF (@bug47265FeatureFlag = N'Y')
    BEGIN
        UPDATE WORK_ORDER_HEADER
           SET QTY_AVAIL_TO_BUILD = (QTY_TO_BE_BUILT * @dSavePercent) - QTY_BUILT,
               PROCESS_STAMP = N'WOHB_UpdateQtyAvailToBuild',
               DATE_TIME_STAMP = GETUTCDATE()
         WHERE INTERNAL_WORK_ORDER_NUM = @iIntWONum;
    END
    ELSE
    BEGIN
        UPDATE WORK_ORDER_HEADER
           SET QTY_AVAIL_TO_BUILD = FLOOR((QTY_TO_BE_BUILT * @dSavePercent) - QTY_BUILT),
               PROCESS_STAMP = N'WOHB_UpdateQtyAvailToBuild',
               DATE_TIME_STAMP = GETUTCDATE()
         WHERE INTERNAL_WORK_ORDER_NUM = @iIntWONum;
    END

	if (@@ERROR <> 0) return -1;
-- end WOHB_UpdateQtyAvailToBuild


