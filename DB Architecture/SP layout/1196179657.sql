/* 
	Mod Number	| Programmer		| Date   	| Modification Description
	-----------------------------------------------------------------
	164448		| SAM				| 08/06/15	| Created.
	
	Method Updates CycleCountRequest and its related work instruction with passed in parameters

	Parameters
		String	@WAREHOUSE			Warehouse.
		String	@LOCATION			Location.
		String	@ITEM				item.
		String	@ITEMDESC			Item description.
		String	@COMPANY			Company.
		String	@CONDITION			Condition.
		String	@LOT				LOT.
		String	@logisticsUnit		logisticsUnit.
		String	@invAttributeId		invAttributeId.
		String	@USERSTAMP			USER_STAMP.
		String	@CYCLECOUNTNUM		CYCLECOUNTNUM.	
	
	Output Parameters:
		@CYCLECOUNTNUM   returns internal count num of CycleCountRequest if found else value is 0	
*/

CREATE PROCEDURE CCP_UpdateCCRequestWithWork (@WAREHOUSE      nvarchar(25), 
                                        @LOCATION       nvarchar(25), 
                                        @ITEM           nvarchar(50), 
                                        @ITEMDESC       nvarchar(100), 
                                        @COMPANY        nvarchar(25), 
                                        @CONDITION      nvarchar(25), 
                                        @LOT            nvarchar(25), 
                                        @logisticsUnit  nvarchar(50), 
                                        @invAttributeId numeric(9), 
                                        @USERSTAMP           nvarchar(30),
										@CYCLECOUNTNUM numeric(9) OUTPUT) 
AS 

  SELECT TOP 1 @CYCLECOUNTNUM = INTERNAL_COUNT_NUM 
    FROM   CYCLE_COUNT_REQUEST CCR 
    WHERE  CCR.WAREHOUSE = @WAREHOUSE AND CCR.LOCATION = @LOCATION AND CCR.CONDITION = @CONDITION 
           AND ( CCR.ITEM = @ITEM OR ( CCR.ITEM IS NULL AND @ITEM IS NULL ) ) 
           AND ( CCR.COMPANY = @COMPANY OR ( CCR.COMPANY IS NULL AND @COMPANY IS NULL ) ) 
           AND ( CCR.LOT = @LOT OR ( CCR.LOT IS NULL AND @LOT IS NULL ) ) 
           AND ( CCR.LOGISTICS_UNIT = @LOGISTICSUNIT OR ( CCR.LOGISTICS_UNIT IS NULL AND @LOGISTICSUNIT IS NULL ) ) 
           AND ( (CCR.LOC_INV_ATTRIBUTES_ID is null and @INVATTRIBUTEID = 0) or  
			     (CCR.LOC_INV_ATTRIBUTES_ID = @INVATTRIBUTEID)) 

    IF @CYCLECOUNTNUM IS NULL 
        OR @CYCLECOUNTNUM = 0 
      BEGIN 
          SET @CYCLECOUNTNUM = 0; 
          RETURN; 
      END 
	  
    UPDATE CYCLE_COUNT_REQUEST 
    SET    ITEM = @ITEM, 
           ITEM_DESC = @ITEMDESC, 
           LOT = @LOT, 
           COMPANY = @COMPANY, 
           LOGISTICS_UNIT = @LOGISTICSUNIT, 
           LOC_INV_ATTRIBUTES_ID = @INVATTRIBUTEID, 
           USER_STAMP = @USERSTAMP, 
           PROCESS_STAMP = N'CCP_UpdateCCRequestWithWork', 
           DATE_TIME_STAMP = GETUTCDATE() 
    WHERE  INTERNAL_COUNT_NUM = @CYCLECOUNTNUM; 

    UPDATE WORK_INSTRUCTION 
    SET    ITEM = @ITEM, 
           ITEM_DESC = @ITEMDESC, 
           LOT = @LOT, 
           COMPANY = @COMPANY, 
           LOGISTICS_UNIT = @LOGISTICSUNIT, 
           FROM_LOC_INV_ATTRIBUTES_ID = @INVATTRIBUTEID, 
           USER_STAMP = @USERSTAMP, 
           PROCESS_STAMP = N'CCP_UpdateCCRequestWithWork', 
           DATE_TIME_STAMP = GETUTCDATE() 
    WHERE  INTERNAL_COUNT_NUM = @CYCLECOUNTNUM; 

