-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
-- [comment omitted]


/* [comment omitted] */






-- [comment omitted]


CREATE PROCEDURE MetaTrans_GetPrintSelectedDocuments(
@internalNum int, @printProcess int, @culture nvarchar(10), @username nvarchar(30))

AS
	SET NOCOUNT ON;

	-- [comment omitted]
	Declare @documentPrinter nvarchar(25);
	Declare @labelPrinter nvarchar(25);
	select @documentPrinter = DEFAULT_DOCUMENT_PRINTER,
	@labelPrinter = DEFAULT_LABEL_PRINTER
	from USER_PROFILE where USER_NAME=@userName;

	if (@printProcess = 30)
	begin 
		-- [comment omitted]
		SELECT 
			N'<literal:1>' AS N'<literal:2>',
			N'<literal:3>' AS N'<literal:4>', 
			@printProcess AS N'<literal:5>', 
			SL.INTERNAL_LOAD_NUM AS N'<literal:6>',
			SL.INTERNAL_LOAD_NUM AS N'<literal:7>', 
			N'<literal:8>' AS N'<literal:9>', 
			N'<literal:10>' AS N'<literal:11>', 
			N'<literal:12>' AS N'<literal:13>', 
			N'<literal:14>' AS N'<literal:15>', 
			SL.WAREHOUSE AS N'<literal:16>',
			@documentPrinter as N'<literal:17>',
			@labelPrinter as N'<literal:18>'
		FROM 
			SHIPPING_LOAD SL 
		WHERE 
			INTERNAL_LOAD_NUM = @internalNum;
	end 
	else if (@printProcess = 20)
	begin
		-- [comment omitted]
		SELECT 
			N'<literal:19>' AS N'<literal:20>',      
			N'<literal:21>' AS N'<literal:22>',       
			@printProcess AS N'<literal:23>',       
			CCP.INTERNAL_PLAN_NUM AS N'<literal:24>',      
			CCP.INTERNAL_PLAN_NUM AS N'<literal:25>',       
			N'<literal:26>' AS N'<literal:27>',       
			N'<literal:28>' AS N'<literal:29>',       
			N'<literal:30>' AS N'<literal:31>',       
			N'<literal:32>' AS N'<literal:33>',       
			N'<literal:34>' AS N'<literal:35>',      
			@documentPrinter as N'<literal:36>',      
			@labelPrinter as N'<literal:37>'
		FROM 
			CYCLE_COUNT_PLAN CCP 
		WHERE 
			INTERNAL_PLAN_NUM = @internalNum;
	end
	else if (@printProcess = 50)
	begin
		-- [comment omitted]
		SELECT 
			N'<literal:38>' AS N'<literal:39>',
			N'<literal:40>' AS N'<literal:41>', 
			@printProcess AS N'<literal:42>', 
			RC.INTERNAL_REC_CONT_NUM AS N'<literal:43>',
			RC.CONTAINER_ID AS N'<literal:44>', 
			N'<literal:45>' AS N'<literal:46>', 
			N'<literal:47>' AS N'<literal:48>', 
			N'<literal:49>' AS N'<literal:50>', 
			RC.COMPANY AS N'<literal:51>', 
			RC.FROM_WAREHOUSE AS N'<literal:52>',
			@documentPrinter as N'<literal:53>',
			@labelPrinter as N'<literal:54>'
		FROM 
			RECEIPT_CONTAINER RC 
		WHERE 
			INTERNAL_REC_CONT_NUM = @internalNum;
	end
	else if (@printProcess = 70 or @printProcess = 170) 
	begin
		-- [comment omitted]
		SELECT 
			N'<literal:55>' AS N'<literal:56>',
			N'<literal:57>' AS N'<literal:58>', 
			@printProcess AS N'<literal:59>', 
			SH.INTERNAL_SHIPMENT_NUM AS N'<literal:60>',
			SH.SHIPMENT_ID AS N'<literal:61>', 
			N'<literal:62>' AS N'<literal:63>', 
			N'<literal:64>' AS N'<literal:65>', 
			N'<literal:66>' AS N'<literal:67>', 
			SH.COMPANY AS N'<literal:68>',
			SH.WAREHOUSE AS N'<literal:69>',
			@documentPrinter as N'<literal:70>',
			@labelPrinter as N'<literal:71>'
		FROM 
			SHIPMENT_HEADER SH 
		WHERE 
			INTERNAL_SHIPMENT_NUM = @internalNum;
	end
	else if (@printProcess = 80)
	begin
		-- [comment omitted]
		SELECT 
			N'<literal:72>' AS N'<literal:73>',
			N'<literal:74>' AS N'<literal:75>', 
			@printProcess AS N'<literal:76>', 
			SC.INTERNAL_CONTAINER_NUM AS N'<literal:77>',
			SC.CONTAINER_ID AS N'<literal:78>', 
			N'<literal:79>' AS N'<literal:80>', 
			N'<literal:81>' AS N'<literal:82>', 
			N'<literal:83>' AS N'<literal:84>', 
			SC.COMPANY AS N'<literal:85>', 
			SC.WAREHOUSE AS N'<literal:86>',
			@documentPrinter as N'<literal:87>',
			@labelPrinter as N'<literal:88>'
		FROM 
			SHIPPING_CONTAINER SC 
		WHERE 
			INTERNAL_CONTAINER_NUM = @internalNum;
	end
	else if (@printProcess = 110)
	begin
		-- [comment omitted]
		SELECT 
			N'<literal:89>' AS N'<literal:90>',
			N'<literal:91>' AS N'<literal:92>', 
			@printProcess AS N'<literal:93>', 
			WOH.INTERNAL_WORK_ORDER_NUM AS N'<literal:94>',
			WOH.WORK_ORDER_ID AS N'<literal:95>', 
			N'<literal:96>' AS N'<literal:97>', 
			N'<literal:98>' AS N'<literal:99>', 
			N'<literal:100>' AS N'<literal:101>', 
			WOH.COMPANY AS N'<literal:102>', 
			WOH.WAREHOUSE AS N'<literal:103>',
			@documentPrinter as N'<literal:104>',
			@labelPrinter as N'<literal:105>'
		FROM 
			WORK_ORDER_HEADER WOH 
		WHERE 
			INTERNAL_WORK_ORDER_NUM = @internalNum;
	end
	else if (@printProcess = 120) 
	begin 
		-- [comment omitted]
		SELECT 
			N'<literal:106>' AS N'<literal:107>',
			N'<literal:108>' AS N'<literal:109>', 
			@printProcess AS N'<literal:110>', 
			WOPU.INTERNAL_PUTAWAY_NUM AS N'<literal:111>',
			WOPU.PUTAWAY_UNIT_ID AS N'<literal:112>', 
			N'<literal:113>' AS N'<literal:114>', 
			N'<literal:115>' AS N'<literal:116>', 
			N'<literal:117>' AS N'<literal:118>', 
			WOPU.COMPANY AS N'<literal:119>', 
			WOPU.WAREHOUSE AS N'<literal:120>',
			@documentPrinter as N'<literal:121>',
			@labelPrinter as N'<literal:122>'
		FROM 
			WORK_ORDER_PUTAWAY_UNIT WOPU
		WHERE 
			INTERNAL_PUTAWAY_NUM = @internalNum;
	end
	else if (@printProcess = 130) 
	begin 
		-- [comment omitted]
		SELECT 
			N'<literal:123>' AS N'<literal:124>',
			N'<literal:125>' AS N'<literal:126>', 
			@printProcess AS N'<literal:127>', 
			WI.INTERNAL_INSTRUCTION_NUM AS N'<literal:128>',
			WI.WORK_UNIT AS N'<literal:129>', 
			N'<literal:130>' AS N'<literal:131>', 
			N'<literal:132>' AS N'<literal:133>', 
			N'<literal:134>' AS N'<literal:135>', 
			WI.COMPANY AS N'<literal:136>', 
			WI.FROM_WHS AS N'<literal:137>',
			@documentPrinter as N'<literal:138>',
			@labelPrinter as N'<literal:139>'
		FROM 
			WORK_INSTRUCTION_VIEW WI -- [comment omitted]
		WHERE 
			INTERNAL_INSTRUCTION_NUM = @internalNum;
	end
	else if (@printProcess = 140)
	begin 
		-- [comment omitted]
		SELECT 
			N'<literal:140>' AS N'<literal:141>',
			N'<literal:142>' AS N'<literal:143>', 
			@printProcess AS N'<literal:144>', 
			RH.INTERNAL_RECEIPT_NUM AS N'<literal:145>',
			RH.RECEIPT_ID AS N'<literal:146>', 
			N'<literal:147>' AS N'<literal:148>', 
			N'<literal:149>' AS N'<literal:150>', 
			N'<literal:151>' AS N'<literal:152>', 
			RH.COMPANY AS N'<literal:153>', 
			RH.WAREHOUSE AS N'<literal:154>',
			@documentPrinter as N'<literal:155>',
			@labelPrinter as N'<literal:156>'
		FROM 
			RECEIPT_HEADER RH 
		WHERE 
			INTERNAL_RECEIPT_NUM = @internalNum;
	end
	else if (@printProcess = 150)
	begin 
		-- [comment omitted]
		SELECT 
			N'<literal:157>' AS N'<literal:158>',
			N'<literal:159>' AS N'<literal:160>', 
			@printProcess AS N'<literal:161>', 
			POH.OBJECT_ID AS N'<literal:162>',
			POH.PURCHASE_ORDER_ID AS N'<literal:163>', 
			N'<literal:164>' AS N'<literal:165>', 
			N'<literal:166>' AS N'<literal:167>', 
			N'<literal:168>' AS N'<literal:169>', 
			POH.COMPANY AS N'<literal:170>', 
			POH.WAREHOUSE AS N'<literal:171>',
			@documentPrinter as N'<literal:172>',
			@labelPrinter as N'<literal:173>'
		FROM 
			PURCHASE_ORDER_HEADER POH
		WHERE 
			OBJECT_ID = @internalNum;
	end
	else if (@printProcess = 160)
	begin
		-- [comment omitted]
		SELECT top 1 
			N'<literal:174>' AS N'<literal:175>',
			N'<literal:176>' AS N'<literal:177>', 
			@printProcess AS N'<literal:178>', 
			SC.WORLD_EASE_ID AS N'<literal:179>',
			SC.WORLD_EASE_ID AS N'<literal:180>', 
			N'<literal:181>' AS N'<literal:182>', 
			(SELECT TOP 1 SCR.SHIPPER_CODE FROM SHIPPER_CROSS_REFERENCE SCR WHERE SCR.WAREHOUSE = SH.WAREHOUSE AND (SCR.COMPANY = SH.COMPANY OR SCR.COMPANY IS NULL) ORDER BY SCR.COMPANY DESC) AS N'<literal:183>', 
			N'<literal:184>' AS N'<literal:185>', 
			SH.COMPANY AS N'<literal:186>', 
			SH.WAREHOUSE AS N'<literal:187>',
			@documentPrinter as N'<literal:188>',
			@labelPrinter as N'<literal:189>'
		FROM 
			SHIPPING_CONTAINER SC INNER JOIN SHIPMENT_HEADER SH ON SH.INTERNAL_SHIPMENT_NUM = SC.INTERNAL_SHIPMENT_NUM 
		WHERE 
			WORLD_EASE_ID = @internalNum;
	end
	else if (@printProcess = 210) 
	begin 
		-- [comment omitted]
		SELECT 
			N'<literal:190>' AS N'<literal:191>',
			N'<literal:192>' AS N'<literal:193>', 
			@printProcess AS N'<literal:194>', 
			LI.INTERNAL_LOCATION_INV AS N'<literal:195>',
			LI.LOGISTICS_UNIT AS N'<literal:196>', 
			N'<literal:197>' AS N'<literal:198>', 
			N'<literal:199>' AS N'<literal:200>', 
			N'<literal:201>' AS N'<literal:202>', 
			LI.COMPANY AS N'<literal:203>', 
			LI.warehouse AS N'<literal:204>',
			@documentPrinter as N'<literal:205>',
			@labelPrinter as N'<literal:206>'
		FROM 
			LOCATION_INVENTORY LI 
		WHERE 
			INTERNAL_LOCATION_INV = @internalNum;
	end

	select 
		N'<literal:207>' AS N'<literal:208>', 
		N'<literal:209>' as N'<literal:210>', 
		DT.DOCUMENT_TYPE AS N'<literal:211>', 
		DT.DESCRIPTION AS N'<literal:212>', 
		case when ((PRINT_PROC1 = @printProcess and DEFAULT1 = N'<literal:213>') 
			or (PRINT_PROC2 = @printProcess and DEFAULT2 = N'<literal:214>') 
			or (PRINT_PROC3 = @printProcess and DEFAULT3 = N'<literal:215>') 
			or (PRINT_PROC4 = @printProcess and DEFAULT4 = N'<literal:216>') 
			or (PRINT_PROC5 = @printProcess and DEFAULT5 = N'<literal:217>'))
			then N'<literal:218>' else N'<literal:219>' end as N'<literal:220>'
		from 
			DOCUMENT_TYPE DT 
		where  
			(PRINT_PROC1 = @printProcess or PRINT_PROC2 = @printProcess or PRINT_PROC3 = @printProcess or PRINT_PROC4 = @printProcess or PRINT_PROC5 = @printProcess) and  
			 DOCUMENT_TYPE !=(case when (select count(FEATURE_NAME) from FEATURE_MANAGEMENT where FEATURE_NAME = N'<literal:221>' and ENABLED =N'<literal:222>')>0 then N'<literal:223>'
                  when PRINT_PROC1 != 80 then N'<literal:224>'
				  else N'<literal:225>'
                 end);