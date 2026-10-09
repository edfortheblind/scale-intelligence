
/***************************************************************************************************************************
 Author:		Jason Franklin
 Create date:	2016-12-07
 Description:	1348 sproc for DS3PLAPP (SCALE 2016)
***************************************************************************************************************************/
      
CREATE PROCEDURE [dbo].[RPT_1348_Reprinting_Archive](    
		--@INTERNAL_CONTAINER_NUM numeric(9)    
		@SHIPMENT_ID NVARCHAR(15)    
	)
AS    
BEGIN    
	SELECT DISTINCT 
		  N'mpos_01_dic'		= CASE sd.[IS_DRMO] WHEN 'N' THEN CAST('A5_' As CHAR(3)) ELSE 'A5J' END        
		, N'mpos_04_ric_from'	= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],22,3) As CHAR(3)),CAST(SPACE(3) As CHAR(3)))         
									ELSE CAST(SPACE(3) As CHAR(3)) END        
		, N'mpos_07_ms'			= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],1,1) As CHAR(1)),CAST(SPACE(1) As CHAR(1)))        
									ELSE CAST(SPACE(1) As CHAR(1)) END        
		, N'mpos_23_unit_iss'	= CAST(UPPER(LTRIM(RTRIM(sd.[quantity_um]))) As CHAR(2))        
		, N'mpos_25_qty'		= CAST(sd.total_qty As integer)         
		, N'mpos_45_suppaddress'	= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],2,6) As CHAR(6)),CAST(SPACE(6) As CHAR(1))) ELSE CAST(SPACE(6) As CHAR(6)) END        
		, N'mpos_51_signal'		= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(CAST(SUBSTRING(sd.[user_def6],8,1) As CHAR(1)),CAST(SPACE(1) As CHAR(1))) ELSE CAST(SPACE(1) As CHAR(1)) END        
		, N'mpos_52_fund'		= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],9,2) As CHAR(2)),CAST(SPACE(2) As CHAR(1))) ELSE CAST(SPACE(2) As CHAR(2)) END        
		, N'mpos_54_dist'		= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],11,3) As CHAR(3)),CAST(SPACE(3) As CHAR(1))) ELSE CAST(SPACE(3) As CHAR(3)) END        
		, N'mpos_57_proj'		= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],14,3) As CHAR(3)),CAST(SPACE(3) As CHAR(1))) ELSE CAST(SPACE(3) As CHAR(3)) END        
		, N'mpos_60_priority'	= CASE sd.[IS_DRMO] WHEN 'N' THEN (        
										CASE LEN(sd.[priority])         
										 WHEN 1 THEN CAST('0' + CAST(CAST(sd.[priority] As INT) As VARCHAR) As CHAR(2))         
										 ELSE CAST(CAST(sd.[priority] As INT) As CHAR(2)) END        
										 )         
										ELSE CAST(SPACE(2) As CHAR(2)) END        
		, N'mpos_62_rdd'		= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],17,3) As CHAR(3)), CAST(SPACE(3) As CHAR(3))) ELSE CAST(SPACE(3) As CHAR(3)) END        
		, N'mpos_65_advice'		= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(CAST(SUBSTRING(sh.[user_def6],20,2) As CHAR(2)), CAST(SPACE(2) As CHAR(2))) ELSE CAST(' A' As CHAR(2)) END        
		, N'mpos_67_ric_to'		= CASE sd.[IS_DRMO] WHEN 'N' THEN CAST(N'SMS' As CHAR(3)) ELSE CAST(SPACE(3) As CHAR(3)) END        
		, N'mpos_70_owner'		= CAST(SPACE(1) As CHAR(1))        
		, N'mpos_71_cond'		= CASE sd.[IS_DRMO] WHEN 'N' THEN CAST(sd.[USER_DEF2] As CHAR(1)) ELSE CAST('F' As CHAR(1)) END        
		, N'mpos_72_mgt'		= CAST(SPACE(1) As CHAR(1))        
		, N'mpos_74_unit_p'		= CAST(sd.item_list_price As DECIMAL(12,2))     
		, N'fld_01_total_price' = CAST((sd.total_qty * sd.item_list_price) As DECIMAL(12,2))  -- place holder for report formula        
		, N'fld_02_ship_from'	= CASE sd.[IS_DRMO] WHEN 'N' THEN (        
											CASE SUBSTRING(sh.[user_def6],22,3) WHEN 'STZ' THEN 'SD0131'         
											 ELSE 'SC0103' END        
										 )        
									 ELSE 'SD0131' END
		, N'fld_03_ship_to1'	= CASE sd.[IS_DRMO] WHEN 'N' THEN '' ELSE 'SZ3547' END        
		, N'fld_03_ship_to2'	= CASE sd.[IS_DRMO] WHEN 'N' THEN sd.[customer] ELSE 'DRMO SAN' END        
		, N'fld_03_ship_to3'	= CASE sd.[IS_DRMO] WHEN 'N' THEN '' ELSE 'SATX' END        
		, N'fld_04_mark_for'	= ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_05_doc_date'	= '' 	-- enter 'XXXXX' for testing 1348 printing only
		, N'fld_06_nmfc'		= ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_07_frt_rate'	= ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_08_type_cargo'  = ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_09_ps'		    = ''	-- enter 'XX'	for testing 1348 printing only
		, N'fld_10_qty_recd'	= ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_11_up'			= ''	-- enter 'XX' for testing 1348 printing only
		, N'fld_12_unit_weight'	= ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_13_unit_cube'	= ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_14_ufc'			= ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_15_sl'			= ''	-- enter 'XX' for testing 1348 printing only
		, N'fld_16_frt_class_nom' = ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_17_item_nom'	= (sd.[item_desc] + CASE WHEN sd.item_size IS NULL THEN '' ELSE (', ' + sd.[item_size]) END)        
		, N'fld_18_ty_cont'		= ''	-- enter 'XXXX' for testing 1348 printing only
		, N'fld_19_no_cont'		= ''	-- enter 'XXXX' for testing 1348 printing only
		, N'fld_20_total_weight'  = CAST(sd.[total_weight] As DECIMAL(12,2))        
		, N'fld_21_total_cube'	= ''	-- enter 'XXXXXX' for testing 1348 printing only      
		, N'fld_22_rec_by'		= ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_23_date_recd'	= ''	-- enter 'XXXXXX' for testing 1348 printing only
		, N'fld_24_doc_num'		= UPPER(LTRIM(RTRIM(sd.[erp_order])))        
		, N'fld_25_nsn'			= UPPER(LTRIM(RTRIM(sd.[item])))        
		, N'fld_26_ric'			= CASE sd.[IS_DRMO] WHEN 'N' THEN 
										'STZ'
										+ CAST(UPPER(LTRIM(RTRIM(sd.[quantity_um]))) As CHAR(2))
										+ RIGHT('00000' + CAST(CAST(sd.[total_qty] As integer) As NVARCHAR(5)),5)
										+ CASE sd.[IS_DRMO] WHEN 'N' THEN sd.[user_def2] ELSE CAST('F' As CHAR(1)) END
										+ ISNULL(CAST(SUBSTRING(sh.[user_def6],12,2) As VARCHAR(2)), CAST(SPACE(2) As CHAR(2)))
										+ RIGHT('0000000' + CAST(CAST(sd.item_list_price * 100 As integer) As NVARCHAR(7))
										,7)
									ELSE '' END
		, N'fld_27_cust_po'		= ISNULL(sd.[customer_po],'')
		, N'fld_27_add_data'	= 'POC: ' + ISNULL(sd.[MARK_FOR_ATTENTION_TO], 'CUSTOMER SERVICE, 512-647-4700')
									--+ CHAR(10) + CHAR(13) + '(Please check all containers for DD1348 forms.)'
		, N'fld_27_ship_to'		= CASE sd.[IS_DRMO] WHEN 'N' THEN 'SHIP TO:' ELSE '' END        
		, N'fld_27_customer'	= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[customer]))),'') ELSE '' END        
		, N'fld_27_customer_name' = CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_name]))),'') ELSE '' END        
		, N'fld_27_shipline1'	= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_address1]))),'') ELSE '' END        
		, N'fld_27_shipline2'	= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_address2]))),'') ELSE '' END        
		, N'fld_27_shipline3'	= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_address3]))),'') ELSE '' END        
		, N'fld_27_shipcity'	= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_city]))),'') ELSE '' END        
		, N'fld_27_shipstate'	= CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_state]))),'') ELSE '' END        
		, N'fld_27_shipzip'		= CASE sd.[IS_DRMO] WHEN 'N' THEN sd.[mark_for_postal_code] ELSE '' END        
		, N'fld_27_shipcountry' = CASE sd.[IS_DRMO] WHEN 'N' THEN ISNULL(UPPER(LTRIM(RTRIM(sd.[mark_for_country]))),'') ELSE '' END        
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
					, LTRIM(RTRIM(item_desc)) 'item_desc'        
					, LTRIM(RTRIM(item_size)) 'item_size'        
					, quantity_um        
					, CASE status2        
						WHEN 999 THEN quantity_at_sts1        
						ELSE total_qty END 'total_qty'		-- if shortpick; pulls sts2 qty as total        
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
					, CASE WHEN LTRIM(RTRIM(mark_for_name)) LIKE 'DLA DISPOSITION%' THEN 'Y'        
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
									) = requested_qty THEN 'Y' 
							END        
						END As OK_1348
					, CASE WHEN LTRIM(RTRIM(mark_for_name)) LIKE 'DLA DISPOSITION%' THEN 'Y'
						ELSE 'N' END As IS_DRMO
				FROM dbo.SCI_SHIPMENT_DETAIL_VIEW WITH(NOLOCK)
				) sd            
		ON scc.internal_shipment_num = sd.internal_shipment_num         
		AND scc.internal_shipment_line_num = sd.internal_shipment_line_num         
	LEFT OUTER JOIN dbo.SCI_SHIPMENT_HEADER_VIEW sh WITH(NOLOCK)        
		ON scp.internal_shipment_num = sh.internal_shipment_num            
	--WHERE scp.internal_container_num = @INTERNAL_CONTAINER_NUM
	WHERE sh.SHIPMENT_ID = @SHIPMENT_ID
	--		OR sd.ERP_ORDER = @SHIPMENT_ID)
	--AND OK_1348 = 'Y'        
END