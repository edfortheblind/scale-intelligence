-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */




      
CREATE PROCEDURE [dbo].[RPT_1348_Reprinting_Archive2](    
		-- [comment omitted]
		@SHIPMENT_ID NVARCHAR(15)    
	)
AS    
BEGIN    
	SELECT DISTINCT 
		  N'<literal:1>'		= CASE sd.[IS_DRMO] WHEN '<literal:2>' THEN CAST('<literal:3>' As CHAR(3)) ELSE '<literal:4>' END        
		, N'<literal:5>'	= CASE sd.[IS_DRMO] WHEN '<literal:6>' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],22,3) As CHAR(3)),CAST(SPACE(3) As CHAR(3)))         
									ELSE CAST(SPACE(3) As CHAR(3)) END        
		, N'<literal:7>'			= CASE sd.[IS_DRMO] WHEN '<literal:8>' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],1,1) As CHAR(1)),CAST(SPACE(1) As CHAR(1)))        
									ELSE CAST(SPACE(1) As CHAR(1)) END        
		, N'<literal:9>'	= CAST(UPPER(LTRIM(RTRIM(sd.[quantity_um]))) As CHAR(2))        
		, N'<literal:10>'		= CAST(sd.total_qty As integer)         
		, N'<literal:11>'	= CASE sd.[IS_DRMO] WHEN '<literal:12>' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],2,6) As CHAR(6)),CAST(SPACE(6) As CHAR(1))) ELSE CAST(SPACE(6) As CHAR(6)) END        
		, N'<literal:13>'		= CASE sd.[IS_DRMO] WHEN '<literal:14>' THEN ISNULL(CAST(SUBSTRING(sd.[user_def6],8,1) As CHAR(1)),CAST(SPACE(1) As CHAR(1))) ELSE CAST(SPACE(1) As CHAR(1)) END        
		, N'<literal:15>'		= CASE sd.[IS_DRMO] WHEN '<literal:16>' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],9,2) As CHAR(2)),CAST(SPACE(2) As CHAR(1))) ELSE CAST(SPACE(2) As CHAR(2)) END        
		, N'<literal:17>'		= CASE sd.[IS_DRMO] WHEN '<literal:18>' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],11,3) As CHAR(3)),CAST(SPACE(3) As CHAR(1))) ELSE CAST(SPACE(3) As CHAR(3)) END        
		, N'<literal:19>'		= CASE sd.[IS_DRMO] WHEN '<literal:20>' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],14,3) As CHAR(3)),CAST(SPACE(3) As CHAR(1))) ELSE CAST(SPACE(3) As CHAR(3)) END        
		, N'<literal:21>'	= CASE sd.[IS_DRMO] WHEN '<literal:22>' THEN (        
										CASE LEN(sd.[priority])         
										 WHEN 1 THEN CAST('<literal:23>' + CAST(CAST(sd.[priority] As INT) As VARCHAR) As CHAR(2))         
										 ELSE CAST(CAST(sd.[priority] As INT) As CHAR(2)) END        
										 )         
										ELSE CAST(SPACE(2) As CHAR(2)) END        
		, N'<literal:24>'		= CASE sd.[IS_DRMO] WHEN '<literal:25>' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],17,3) As CHAR(3)), CAST(SPACE(3) As CHAR(3))) ELSE CAST(SPACE(3) As CHAR(3)) END        
		, N'<literal:26>'		= CASE sd.[IS_DRMO] WHEN '<literal:27>' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],20,2) As CHAR(2)), CAST(SPACE(2) As CHAR(2))) ELSE CAST('<literal:28>' As CHAR(2)) END        
		, N'<literal:29>'		= CASE sd.[IS_DRMO] WHEN '<literal:30>' THEN CAST(N'<literal:31>' As CHAR(3)) ELSE CAST(SPACE(3) As CHAR(3)) END        
		, N'<literal:32>'		= CAST(SPACE(1) As CHAR(1))        
		, N'<literal:33>'		= CASE sd.[IS_DRMO] WHEN '<literal:34>' THEN CAST(sd.[USER_DEF2] As CHAR(1)) ELSE CAST('<literal:35>' As CHAR(1)) END        
		, N'<literal:36>'		= CAST(SPACE(1) As CHAR(1))        
		, N'<literal:37>'		= CAST(sd.item_list_price As DECIMAL(12,2))     
		, N'<literal:38>' = CAST((sd.total_qty * sd.item_list_price) As DECIMAL(12,2))  -- [comment omitted]
		, N'<literal:39>'	= CASE sd.[IS_DRMO] WHEN '<literal:40>' THEN (        
											CASE SUBSTRING(sh.[user_def6],22,3) WHEN '<literal:41>' THEN '<literal:42>'         
											 ELSE '<literal:43>' END        
										 )        
									 ELSE '<literal:44>' END
		, N'<literal:45>'	= CASE sd.[IS_DRMO] WHEN '<literal:46>' THEN '<literal:47>' ELSE '<literal:48>' END        
		, N'<literal:49>'	= CASE sd.[IS_DRMO] WHEN '<literal:50>' THEN sd.[customer] ELSE '<literal:51>' END        
		, N'<literal:52>'	= CASE sd.[IS_DRMO] WHEN '<literal:53>' THEN '<literal:54>' ELSE '<literal:55>' END        
		, N'<literal:56>'	= '<literal:57>'	-- [comment omitted]
		, N'<literal:58>'	= '<literal:59>' 	-- [comment omitted]
		, N'<literal:60>'		= '<literal:61>'	-- [comment omitted]
		, N'<literal:62>'	= '<literal:63>'	-- [comment omitted]
		, N'<literal:64>'  = '<literal:65>'	-- [comment omitted]
		, N'<literal:66>'		    = '<literal:67>'	-- [comment omitted]
		, N'<literal:68>'	= '<literal:69>'	-- [comment omitted]
		, N'<literal:70>'			= '<literal:71>'	-- [comment omitted]
		, N'<literal:72>'	= '<literal:73>'	-- [comment omitted]
		, N'<literal:74>'	= '<literal:75>'	-- [comment omitted]
		, N'<literal:76>'			= '<literal:77>'	-- [comment omitted]
		, N'<literal:78>'			= '<literal:79>'	-- [comment omitted]
		, N'<literal:80>' = '<literal:81>'	-- [comment omitted]
		, N'<literal:82>'	= (sd.[item_desc] + CASE WHEN sd.item_size IS NULL THEN '<literal:83>' ELSE ('<literal:84>' + sd.[item_size]) END)        
		, N'<literal:85>'		= '<literal:86>'	-- [comment omitted]
		, N'<literal:87>'		= '<literal:88>'	-- [comment omitted]
		, N'<literal:89>'  = CAST(sd.[total_weight] As DECIMAL(12,2))        
		, N'<literal:90>'	= '<literal:91>'	-- [comment omitted]
		, N'<literal:92>'		= '<literal:93>'	-- [comment omitted]
		, N'<literal:94>'	= '<literal:95>'	-- [comment omitted]
		, N'<literal:96>'		= UPPER(LTRIM(RTRIM(sd.[erp_order])))        
		, N'<literal:97>'			= UPPER(LTRIM(RTRIM(sd.[item])))        
		, N'<literal:98>'			= CASE sd.[IS_DRMO] WHEN '<literal:99>' THEN 
										'<literal:100>'
										+ CAST(UPPER(LTRIM(RTRIM(sd.[quantity_um]))) As CHAR(2))
										+ RIGHT('<literal:101>' + CAST(CAST(sd.[total_qty] As integer) As NVARCHAR(5)),5)
										+ CASE sd.[IS_DRMO] WHEN '<literal:102>' THEN sd.[user_def2] ELSE CAST('<literal:103>' As CHAR(1)) END
										+ ISNULL(CAST(SUBSTRING(sh.[user_def6],12,2) As VARCHAR(2)), CAST(SPACE(2) As CHAR(2)))
										+ RIGHT('<literal:104>' + CAST(CAST(sd.item_list_price * 100 As integer) As NVARCHAR(7))
										,7)
									ELSE '<literal:105>' END
		, N'<literal:106>'	= '<literal:107>' + ISNULL(sd.[MARK_FOR_ATTENTION_TO], '<literal:108>')
									-- [comment omitted]
		, N'<literal:109>'		= ISNULL(sd.[customer_po],'<literal:110>')
		, N'<literal:111>'			= icr.X_REF_ITEM-- [comment omitted]
		, N'<literal:112>'		= CASE sd.[IS_DRMO] WHEN '<literal:113>' THEN '<literal:114>' ELSE '<literal:115>' END        
		, N'<literal:116>'	= CASE sd.[IS_DRMO] WHEN '<literal:117>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[customer]))),'<literal:118>') ELSE '<literal:119>' END        
		, N'<literal:120>' = CASE sd.[IS_DRMO] WHEN '<literal:121>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_name]))),'<literal:122>') ELSE '<literal:123>' END        
		, N'<literal:124>'	= CASE sd.[IS_DRMO] WHEN '<literal:125>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_address1]))),'<literal:126>') ELSE '<literal:127>' END        
		, N'<literal:128>'	= CASE sd.[IS_DRMO] WHEN '<literal:129>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_address2]))),'<literal:130>') ELSE '<literal:131>' END        
		, N'<literal:132>'	= CASE sd.[IS_DRMO] WHEN '<literal:133>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_address3]))),'<literal:134>') ELSE '<literal:135>' END        
		, N'<literal:136>'	= CASE sd.[IS_DRMO] WHEN '<literal:137>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_city]))),'<literal:138>') ELSE '<literal:139>' END        
		, N'<literal:140>'	= CASE sd.[IS_DRMO] WHEN '<literal:141>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_state]))),'<literal:142>') ELSE '<literal:143>' END        
		, N'<literal:144>'		= CASE sd.[IS_DRMO] WHEN '<literal:145>' THEN sd.[mark_for_postal_code] ELSE '<literal:146>' END        
		, N'<literal:147>' = CASE sd.[IS_DRMO] WHEN '<literal:148>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_country]))),'<literal:149>') ELSE '<literal:150>' END        
		, sd.[OK_1348]        
		, sd.[IS_DRMO]        
	FROM dbo.SCI_SHIPPING_CONTAINER_VIEW scp WITH(NOLOCK)        
	INNER JOIN dbo.SCI_SHIPPING_CONTAINER_VIEW scc WITH(NOLOCK)        
		ON scp.CONTAINER_ID  = scc.PARENT_CONTAINER_ID         
	INNER JOIN (            
				SELECT internal_shipment_num
					, internal_shipment_line_num        
					, status1        
					, requested_qty
					, [priority]        
					, item        
					, LTRIM(RTRIM(item_desc)) '<literal:151>'        
					, LTRIM(RTRIM(item_size)) '<literal:152>'        
					, quantity_um        
					, CASE status2        
						WHEN 999 THEN quantity_at_sts1        
						ELSE total_qty END '<literal:153>'		-- [comment omitted]
					, total_weight        
					, mark_for        
					, mark_for_name        
					, mark_for_attention_to            
					, mark_for_address1            
					, mark_for_address2            
					, mark_for_address3            
					, mark_for_city            
					, mark_for_state            
					, mark_for_postal_code            
					, mark_for_country            
					, erp_order            
					, customer         
					, customer_po           
					, item_list_price
					, user_def2
					, user_def6
					, CASE WHEN status1 >= 650 THEN quantity_at_sts1 ELSE 0 END +             
						CASE WHEN status2 >= 650 THEN quantity_at_sts2 ELSE 0 END +             
						CASE WHEN status3 >= 650 THEN quantity_at_sts3 ELSE 0 END +             
						CASE WHEN status4 >= 650 THEN quantity_at_sts4 ELSE 0 END +             
						CASE WHEN status5 >= 650 THEN quantity_at_sts5 ELSE 0 END +             
						CASE WHEN status6 >= 650 THEN quantity_at_sts6 ELSE 0 END +           
						CASE WHEN status7 >= 650 THEN quantity_at_sts7 ELSE 0 END +          
						CASE WHEN status8 >= 650 THEN quantity_at_sts8 ELSE 0 END +           
						CASE WHEN status9 >= 650 THEN quantity_at_sts9 ELSE 0 END +           
						CASE WHEN status10 >= 650 THEN quantity_at_sts10 ELSE 0 END            
						AS completed        
					, CASE WHEN LTRIM(RTRIM(mark_for_name)) LIKE '<literal:154>' THEN '<literal:155>'        
						ELSE CASE WHEN (             
									CASE WHEN status1 >= 650 THEN quantity_at_sts1 ELSE 0 END +             
									CASE WHEN status2 >= 650 THEN quantity_at_sts2 ELSE 0 END +             
									CASE WHEN status3 >= 650 THEN quantity_at_sts3 ELSE 0 END +             
									CASE WHEN status4 >= 650 THEN quantity_at_sts4 ELSE 0 END +             
									CASE WHEN status5 >= 650 THEN quantity_at_sts5 ELSE 0 END +             
									CASE WHEN status6 >= 650 THEN quantity_at_sts6 ELSE 0 END +           
									CASE WHEN status7 >= 650 THEN quantity_at_sts7 ELSE 0 END +           
									CASE WHEN status8 >= 650 THEN quantity_at_sts8 ELSE 0 END +           
									CASE WHEN status9 >= 650 THEN quantity_at_sts9 ELSE 0 END +           
									CASE WHEN status10 >= 650 THEN quantity_at_sts10 ELSE 0 END           
									) = requested_qty THEN '<literal:156>' 
							END        
						END As OK_1348
					, CASE WHEN LTRIM(RTRIM(mark_for_name)) LIKE '<literal:157>' THEN '<literal:158>'
						ELSE '<literal:159>' END As IS_DRMO
				FROM dbo.SCI_SHIPMENT_DETAIL_VIEW WITH(NOLOCK)
				) sd            
		ON scc.internal_shipment_num = sd.internal_shipment_num
		AND scc.internal_shipment_line_num = sd.internal_shipment_line_num
	LEFT OUTER JOIN dbo.SCI_SHIPMENT_HEADER_VIEW sh WITH(NOLOCK)
		ON scp.internal_shipment_num = sh.internal_shipment_num
	LEFT OUTER JOIN dbo.ITEM_CROSS_REFERENCE icr WITH(NOLOCK)
		ON sd.ITEM = icr.ITEM
		AND sd.QUANTITY_UM = icr.QUANTITY_UM
	-- [comment omitted]
	WHERE sh.SHIPMENT_ID = @SHIPMENT_ID
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
END