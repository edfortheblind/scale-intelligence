
-- =============================================
-- Author:		
-- Create date: 2015-12-11
-- Description:	Convert numeric status to text
-- =============================================

CREATE FUNCTION [dbo].[ILSTransactionTypeToText_fn] 
(
	@status INT
)
RETURNS VARCHAR(30)
AS
BEGIN

	DECLARE @Result VARCHAR(30)

	SET @Result = (
			SELECT CASE @status
				WHEN 10 THEN '010 - Cancel Check In'
				WHEN 20 THEN '020 - Check In'
				WHEN 30 THEN '030 - Immediate Needs Allocation'
				WHEN 40 THEN '040 - Inventory Adjustment'
				WHEN 50 THEN '050 - Inventory Status Change'
				WHEN 60 THEN '060 - Inventory Transfer'
				WHEN 70 THEN '070 - Load Confirmation'
				WHEN 80 THEN '080 - Locating'
				WHEN 90 THEN '090 - Location Override'
				WHEN 100 THEN '100 - Over Pick Adjustment'
				WHEN 110 THEN '110 - Pack Confirmation'
				WHEN 120 THEN '120 - Pick & Put Confirmation'
				WHEN 130 THEN '130 - Pick Confirmation'
				WHEN 140 THEN '140 - Putaway Confirmation'
				WHEN 150 THEN '150 - Quantity Adjustment'
				WHEN 160 THEN '160 - REceipt Container Delete'
				WHEN 165 THEN '165 - Receipt Container Cancel'
				WHEN 170 THEN '170 - Replenishment Allocation'
				WHEN 180 THEN '180 - Replensihment Deallocation'
				WHEN 190 THEN '190 - Shipment Allocation'
				WHEN 200 THEN '200 - Shipment Deallocation'
				WHEN 210 THEN '210 - Shipping Container Close'
				WHEN 220 THEN '220 - Shipping Container Delete'
				WHEN 230 THEN '230 - Shipping Container Open'
				WHEN 240 THEN '240 - Short Pick Adjustment'
				WHEN 250 THEN '250 - Under Pick Adjustment'
				WHEN 260 THEN '260 - Unlocate'
				WHEN 270 THEN '270 - Unpack Confirmation'
				WHEN 280 THEN '280 - Work Instruction Change'
				WHEN 290 THEN '290 - Work Instruction Delete'
				WHEN 300 THEN '300 - Work Order Allocation'
				WHEN 310 THEN '310 - Work Order Deallocation'
				WHEN 320 THEN '320 - Work Unit End'
				WHEN 330 THEN '330 - Work Unit Start'
				WHEN 340 THEN '340 - Lot Change'
				WHEN 350 THEN '350 - Company Transfer'
				WHEN 360 THEN '360 - Warehouse Transfer'
				WHEN 370 THEN '370 - Override Pick'
				WHEN 380 THEN '380 - Shipping Container Transfer'
				WHEN 390 THEN '390 - Dock Location Pick'
				WHEN 400 THEN '400 - Dock Location Putaway'
				WHEN 410 THEN '410 - Dock Transfer'
				WHEN 420 THEN '420 - Dock Locating'
				WHEN 430 THEN '430 - Short Putaway Adjustment'
				WHEN 440 THEN '440 - VAS Activity Confirmation'
				WHEN 450 THEN '450 - QC Confirmation'
				ELSE CAST(@status AS VARCHAR)
				END
		)

	RETURN @Result

END