---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	180074	| RJR	| 06/15/16	| Created
	201058  | DN    | 03/27/17  | added fields documentprinter and labelprinter to printselected and new parameter username
	217285	| RSP	| 01/04/18	| Replaced WORK_INSTRUCTION with WORK_INSTRUCTION_VIEW to select archived work instruction from IA_WORK_INSTRUCTION table 
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE MetaTrans_GetPrintSelectedDocuments(
@internalNum int, @printProcess int, @culture nvarchar(10), @username nvarchar(30))

AS
	SET NOCOUNT ON;

	-- please note company and warehouse are required
	Declare @documentPrinter nvarchar(25);
	Declare @labelPrinter nvarchar(25);
	select @documentPrinter = DEFAULT_DOCUMENT_PRINTER,
	@labelPrinter = DEFAULT_LABEL_PRINTER
	from USER_PROFILE where USER_NAME=@userName;

	if (@printProcess = 30)
	begin 
		--load level docs
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			SL.INTERNAL_LOAD_NUM AS N'InternalNum',
			SL.INTERNAL_LOAD_NUM AS N'Id', 
			N'SHIPPING_LOAD_NUM' AS N'IdLabel', 
			N'' AS N'ShipperCode', 
			N'' AS N'CarrierSymbol', 
			N'' AS N'Company', 
			SL.WAREHOUSE AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			SHIPPING_LOAD SL 
		WHERE 
			INTERNAL_LOAD_NUM = @internalNum;
	end 
	else if (@printProcess = 20)
	begin
		--Cycle Count Plan Docs
		SELECT 
			N'SCALAR' AS N'EntityType',      
			N'PrintSelected' AS N'EntityName',       
			@printProcess AS N'PrintProcess',       
			CCP.INTERNAL_PLAN_NUM AS N'InternalNum',      
			CCP.INTERNAL_PLAN_NUM AS N'Id',       
			N'PLANNUMBER' AS N'IdLabel',       
			N'' AS N'ShipperCode',       
			N'' AS N'CarrierSymbol',       
			N'' AS N'Company',       
			N'' AS N'Warehouse',      
			@documentPrinter as N'DocumentPrinter',      
			@labelPrinter as N'LabelPrinter'
		FROM 
			CYCLE_COUNT_PLAN CCP 
		WHERE 
			INTERNAL_PLAN_NUM = @internalNum;
	end
	else if (@printProcess = 50)
	begin
		--receipt container level docs
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			RC.INTERNAL_REC_CONT_NUM AS N'InternalNum',
			RC.CONTAINER_ID AS N'Id', 
			N'CONTAINERIDPROMPT' AS N'IdLabel', 
			N'' AS N'ShipperCode', 
			N'' AS N'CarrierSymbol', 
			RC.COMPANY AS N'Company', 
			RC.FROM_WAREHOUSE AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			RECEIPT_CONTAINER RC 
		WHERE 
			INTERNAL_REC_CONT_NUM = @internalNum;
	end
	else if (@printProcess = 70 or @printProcess = 170) 
	begin
		--shipment level docs
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			SH.INTERNAL_SHIPMENT_NUM AS N'InternalNum',
			SH.SHIPMENT_ID AS N'Id', 
			N'SHIPMENTID' AS N'IdLabel', 
			N'' AS N'ShipperCode', 
			N'' AS N'CarrierSymbol', 
			SH.COMPANY AS N'Company',
			SH.WAREHOUSE AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			SHIPMENT_HEADER SH 
		WHERE 
			INTERNAL_SHIPMENT_NUM = @internalNum;
	end
	else if (@printProcess = 80)
	begin
		--shipping container level docs
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			SC.INTERNAL_CONTAINER_NUM AS N'InternalNum',
			SC.CONTAINER_ID AS N'Id', 
			N'CONTAINERIDPROMPT' AS N'IdLabel', 
			N'' AS N'ShipperCode', 
			N'' AS N'CarrierSymbol', 
			SC.COMPANY AS N'Company', 
			SC.WAREHOUSE AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			SHIPPING_CONTAINER SC 
		WHERE 
			INTERNAL_CONTAINER_NUM = @internalNum;
	end
	else if (@printProcess = 110)
	begin
		--work order level docs
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			WOH.INTERNAL_WORK_ORDER_NUM AS N'InternalNum',
			WOH.WORK_ORDER_ID AS N'Id', 
			N'WORKORDERID' AS N'IdLabel', 
			N'' AS N'ShipperCode', 
			N'' AS N'CarrierSymbol', 
			WOH.COMPANY AS N'Company', 
			WOH.WAREHOUSE AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			WORK_ORDER_HEADER WOH 
		WHERE 
			INTERNAL_WORK_ORDER_NUM = @internalNum;
	end
	else if (@printProcess = 120) 
	begin 
		-- work order finished item level docs
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			WOPU.INTERNAL_PUTAWAY_NUM AS N'InternalNum',
			WOPU.PUTAWAY_UNIT_ID AS N'Id', 
			N'PUTAWAYUNITID' AS N'IdLabel', 
			N'' AS N'ShipperCode', 
			N'' AS N'CarrierSymbol', 
			WOPU.COMPANY AS N'Company', 
			WOPU.WAREHOUSE AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			WORK_ORDER_PUTAWAY_UNIT WOPU
		WHERE 
			INTERNAL_PUTAWAY_NUM = @internalNum;
	end
	else if (@printProcess = 130) 
	begin 
		--work instruction level docs
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			WI.INTERNAL_INSTRUCTION_NUM AS N'InternalNum',
			WI.WORK_UNIT AS N'Id', 
			N'WORKUNIT' AS N'IdLabel', 
			N'' AS N'ShipperCode', 
			N'' AS N'CarrierSymbol', 
			WI.COMPANY AS N'Company', 
			WI.FROM_WHS AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			WORK_INSTRUCTION_VIEW WI -- todo: should this be the view or not? 
		WHERE 
			INTERNAL_INSTRUCTION_NUM = @internalNum;
	end
	else if (@printProcess = 140)
	begin 
		--receipt header level docs
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			RH.INTERNAL_RECEIPT_NUM AS N'InternalNum',
			RH.RECEIPT_ID AS N'Id', 
			N'RECEIPT_ID' AS N'IdLabel', 
			N'' AS N'ShipperCode', 
			N'' AS N'CarrierSymbol', 
			RH.COMPANY AS N'Company', 
			RH.WAREHOUSE AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			RECEIPT_HEADER RH 
		WHERE 
			INTERNAL_RECEIPT_NUM = @internalNum;
	end
	else if (@printProcess = 150)
	begin 
		--purchase order level docs
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			POH.OBJECT_ID AS N'InternalNum',
			POH.PURCHASE_ORDER_ID AS N'Id', 
			N'PURCHASE_ORDER_ID' AS N'IdLabel', 
			N'' AS N'ShipperCode', 
			N'' AS N'CarrierSymbol', 
			POH.COMPANY AS N'Company', 
			POH.WAREHOUSE AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			PURCHASE_ORDER_HEADER POH
		WHERE 
			OBJECT_ID = @internalNum;
	end
	else if (@printProcess = 160)
	begin
		--UPS world ease level docs
		SELECT top 1 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			SC.WORLD_EASE_ID AS N'InternalNum',
			SC.WORLD_EASE_ID AS N'Id', 
			N'WORLDEASEID' AS N'IdLabel', 
			(SELECT TOP 1 SCR.SHIPPER_CODE FROM SHIPPER_CROSS_REFERENCE SCR WHERE SCR.WAREHOUSE = SH.WAREHOUSE AND (SCR.COMPANY = SH.COMPANY OR SCR.COMPANY IS NULL) ORDER BY SCR.COMPANY DESC) AS N'ShipperCode', 
			N'CONNECTSHIP_UPS.UPS' AS N'CarrierSymbol', 
			SH.COMPANY AS N'Company', 
			SH.WAREHOUSE AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			SHIPPING_CONTAINER SC INNER JOIN SHIPMENT_HEADER SH ON SH.INTERNAL_SHIPMENT_NUM = SC.INTERNAL_SHIPMENT_NUM 
		WHERE 
			WORLD_EASE_ID = @internalNum;
	end
	else if (@printProcess = 210) 
	begin 
		--Location Inventory docs
		SELECT 
			N'SCALAR' AS N'EntityType',
			N'PrintSelected' AS N'EntityName', 
			@printProcess AS N'PrintProcess', 
			LI.INTERNAL_LOCATION_INV AS N'InternalNum',
			LI.LOGISTICS_UNIT AS N'Id', 
			N'LICENSE_PLATE' AS N'IdLabel', 
			N'' AS N'ShipperCode', 
			N'' AS N'CarrierSymbol', 
			LI.COMPANY AS N'Company', 
			LI.warehouse AS N'Warehouse',
			@documentPrinter as N'DocumentPrinter',
			@labelPrinter as N'LabelPrinter'
		FROM 
			LOCATION_INVENTORY LI 
		WHERE 
			INTERNAL_LOCATION_INV = @internalNum;
	end

	select 
		N'ID_DESC_TABLE' AS N'EntityType', 
		N'DocumentTypes' as N'EntityName', 
		DT.DOCUMENT_TYPE AS N'Identifier', 
		DT.DESCRIPTION AS N'Description', 
		case when ((PRINT_PROC1 = @printProcess and DEFAULT1 = N'Y') 
			or (PRINT_PROC2 = @printProcess and DEFAULT2 = N'Y') 
			or (PRINT_PROC3 = @printProcess and DEFAULT3 = N'Y') 
			or (PRINT_PROC4 = @printProcess and DEFAULT4 = N'Y') 
			or (PRINT_PROC5 = @printProcess and DEFAULT5 = N'Y'))
			then N'Y' else N'N' end as N'DEFAULT'
		from 
			DOCUMENT_TYPE DT 
		where  
			(PRINT_PROC1 = @printProcess or PRINT_PROC2 = @printProcess or PRINT_PROC3 = @printProcess or PRINT_PROC4 = @printProcess or PRINT_PROC5 = @printProcess) and  
			 DOCUMENT_TYPE !=(case when (select count(FEATURE_NAME) from FEATURE_MANAGEMENT where FEATURE_NAME = N'FEATURE_3325_COLLATE_DOCUMENT' and ENABLED =N'Y')>0 then N'0'
                  when PRINT_PROC1 != 80 then N'0'
				  else N'420'
                 end);