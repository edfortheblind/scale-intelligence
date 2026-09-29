-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */




      
CREATE PROCEDURE [dbo].[RPT_1348_Reprinting_Archive](    
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
		, N'<literal:106>'		= ISNULL(sd.[customer_po],'<literal:107>')
		, N'<literal:108>'	= '<literal:109>' + ISNULL(sd.[MARK_FOR_ATTENTION_TO], '<literal:110>')
									-- [comment omitted]
		, N'<literal:111>'		= CASE sd.[IS_DRMO] WHEN '<literal:112>' THEN '<literal:113>' ELSE '<literal:114>' END        
		, N'<literal:115>'	= CASE sd.[IS_DRMO] WHEN '<literal:116>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[customer]))),'<literal:117>') ELSE '<literal:118>' END        
		, N'<literal:119>' = CASE sd.[IS_DRMO] WHEN '<literal:120>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_name]))),'<literal:121>') ELSE '<literal:122>' END        
		, N'<literal:123>'	= CASE sd.[IS_DRMO] WHEN '<literal:124>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_address1]))),'<literal:125>') ELSE '<literal:126>' END        
		, N'<literal:127>'	= CASE sd.[IS_DRMO] WHEN '<literal:128>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_address2]))),'<literal:129>') ELSE '<literal:130>' END        
		, N'<literal:131>'	= CASE sd.[IS_DRMO] WHEN '<literal:132>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_address3]))),'<literal:133>') ELSE '<literal:134>' END        
		, N'<literal:135>'	= CASE sd.[IS_DRMO] WHEN '<literal:136>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_city]))),'<literal:137>') ELSE '<literal:138>' END        
		, N'<literal:139>'	= CASE sd.[IS_DRMO] WHEN '<literal:140>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_state]))),'<literal:141>') ELSE '<literal:142>' END        
		, N'<literal:143>'		= CASE sd.[IS_DRMO] WHEN '<literal:144>' THEN sd.[mark_for_postal_code] ELSE '<literal:145>' END        
		, N'<literal:146>' = CASE sd.[IS_DRMO] WHEN '<literal:147>' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_country]))),'<literal:148>') ELSE '<literal:149>' END        
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
					, LTRIM(RTRIM(item_desc)) '<literal:150>'        
					, LTRIM(RTRIM(item_size)) '<literal:151>'        
					, quantity_um        
					, CASE status2        
						WHEN 999 THEN quantity_at_sts1        
						ELSE total_qty END '<literal:152>'		-- [comment omitted]
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
					, CASE WHEN LTRIM(RTRIM(mark_for_name)) LIKE '<literal:153>' THEN '<literal:154>'        
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
									) = requested_qty THEN '<literal:155>' 
							END        
						END As OK_1348
					, CASE WHEN LTRIM(RTRIM(mark_for_name)) LIKE '<literal:156>' THEN '<literal:157>'
						ELSE '<literal:158>' END As IS_DRMO
				FROM dbo.SCI_SHIPMENT_DETAIL_VIEW WITH(NOLOCK)
				) sd            
		ON scc.internal_shipment_num = sd.internal_shipment_num         
		AND scc.internal_shipment_line_num = sd.internal_shipment_line_num         
	LEFT OUTER JOIN dbo.SCI_SHIPMENT_HEADER_VIEW sh WITH(NOLOCK)        
		ON scp.internal_shipment_num = sh.internal_shipment_num            
	-- [comment omitted]
	WHERE sh.SHIPMENT_ID = @SHIPMENT_ID
	-- [comment omitted]
	-- [comment omitted]
END