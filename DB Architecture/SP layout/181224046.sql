CREATE PROCEDURE LoadAdditionalConfigsSummary      
    @configsToLoad NVARCHAR(MAX)      
AS      
BEGIN      
--------------Note----------------    
--* while adding UNION in the Query ,you should insert space ' ' before union *-----    
--------------------------------    
    CREATE TABLE #configsKeyValData (      
        FormattedKey NVARCHAR(MAX),      
        FormattedValue NVARCHAR(MAX)      
    );      
      
    SET @configsToLoad = LTRIM(RTRIM(@configsToLoad));      
      
    INSERT INTO #configsKeyValData (FormattedKey, FormattedValue)      
    SELECT        
        configsData.[Key],       
        N'('+STRING_AGG(QUOTENAME(arrayData.Value, N''''), N', ')+N')' AS FormattedValue      
    FROM OPENJSON(@configsToLoad) AS configsData      
    CROSS APPLY OPENJSON(configsData.Value) AS arrayData        
    GROUP BY configsData.[Key]      
    UNION ALL      
    SELECT [Key],N'' AS FormattedValue  FROM OPENJSON(@configsToLoad) AS configsData WHERE configsData.Value = N'[]';      
      
-----------------Declaration -----------------------      
      
    DECLARE @query NVARCHAR(MAX) = N'';      
    DECLARE @whereClause NVARCHAR(MAX) = N'';      
    DECLARE @values NVARCHAR(MAX)=N'';      
---------------------------------------------------- Handle Generic ----------------------------------------      
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'Generic')      
    BEGIN       
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'Generic'; 
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN      
        SET @whereClause =N'WHERE GENERIC_CONFIG_HEADER.RECORD_TYPE IN '+ @values;         
        SET @query = N' UNION SELECT GENERIC_CONFIG_HEADER.RECORD_TYPE AS RecordType,       
                             COUNT(GENERIC_CONFIG_DETAIL.DESCRIPTION) AS NumberOfRecords,       
                             MIN(GENERIC_CONFIG_HEADER.DESCRIPTION) AS Description,       
                             ''Generic'' AS ConfigType       
							 FROM GENERIC_CONFIG_HEADER       
							 LEFT JOIN GENERIC_CONFIG_DETAIL ON GENERIC_CONFIG_HEADER.RECORD_TYPE = GENERIC_CONFIG_DETAIL.RECORD_TYPE       
							 ' + @whereClause + N'      
							 GROUP BY GENERIC_CONFIG_HEADER.RECORD_TYPE'; 
		END 			  
		SET  @whereClause  = N'';      
		SET @values =N'';      
    END      
      
---------------------------------------------------- Handle System ----------------------------------------      
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'System')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'System';     
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN      
        SET @whereClause = N'WHERE SYSTEM_CONFIG_HEADER.RECORD_TYPE IN  '+ @values + N' AND NOT ( SYSTEM_CONFIG_DETAIL.SYS_KEY in (''40'', ''50'', ''60'', ''70'') AND SYSTEM_CONFIG_DETAIL.RECORD_TYPE = ''LABOR'')';  
		SET @query = @query + N' UNION SELECT SYSTEM_CONFIG_HEADER.RECORD_TYPE AS RecordType,       
									  COUNT(SYSTEM_CONFIG_DETAIL.DESCRIPTION) AS NumberOfRecords,       
                                      MIN(SYSTEM_CONFIG_HEADER.DESCRIPTION) AS Description,       
                                      ''System'' AS ConfigType       
                                      FROM SYSTEM_CONFIG_HEADER       
                                      LEFT JOIN SYSTEM_CONFIG_DETAIL ON SYSTEM_CONFIG_HEADER.RECORD_TYPE = SYSTEM_CONFIG_DETAIL.RECORD_TYPE       
                                      ' + @whereClause + N'      
                                      GROUP BY SYSTEM_CONFIG_HEADER.RECORD_TYPE'; 
		END 					 
        SET  @whereClause  = N'';      
        SET @values =N'';      
    END      
      
---------------------------------------------------- Handle RuleSetAssignment ----------------------------------------      
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'RuleSetAssignment')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'RuleSetAssignment';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
        IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'RuleSetAssignment' and [FormattedValue] like N'%IN RS CRIT%')
		BEGIN
		SET @query = @query + N' UNION SELECT RECORD_TYPE AS RecordType,      
									  COUNT(*) AS NumberOfRecords,       
                                      ''Locating Rule Assignment'' AS Description, 
						              ''Inbound RuleSet Assignment'' AS ConfigType
                                      FROM RULE_SET_ASSIGNMENT 
									  WHERE [RECORD_TYPE] like ''%IN RS CRIT%''            
                                      GROUP BY RECORD_TYPE';      
         END
		IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'RuleSetAssignment' and [FormattedValue] like N'%OUT RS CRIT%')
		BEGIN
		SET @query = @query + N' UNION SELECT RECORD_TYPE AS RecordType,      
									  COUNT(*) AS NumberOfRecords,       
                                      ''Allocation Rule Assignment'' AS Description, 
			                          ''Outbound RuleSet Assignment'' AS ConfigType
                                      FROM RULE_SET_ASSIGNMENT WHERE [RECORD_TYPE] like ''%OUT RS CRIT%''            
                                      GROUP BY RECORD_TYPE';  
		END
		END 
    END

---------------------------------------------------- Handle AccessorialHeader ----------------------------------------      
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'AccessorialHeader')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'AccessorialHeader';
        IF @values IS NOT NULL AND @values <> N''     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'AccessorialHeader' and [FormattedValue] like N'%AccessorialHeader%')
		BEGIN		
		SET @query = @query + N' UNION SELECT ''AccessorialHeader'' AS RecordType,      
									  COUNT(*) AS NumberOfRecords,       
                                      ''Accessorial Code'' AS Description, 
						              ''Accessorial Code'' AS ConfigType
									  FROM ACCESSORIAL_HEADER';    
		END								
		END
    END     	
---------------------------------------------------- Handle CarrierGroup ----------------------------------------      
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'CarrierGroup')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'CarrierGroup';
        IF @values IS NOT NULL AND @values <> N''     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'CarrierGroup' and [FormattedValue] like N'%CarrierGroup%')
		BEGIN		
		SET @query = @query + N' UNION SELECT ''CarrierGroup'' AS RecordType,      
									  COUNT(*) AS NumberOfRecords,       
                                      ''Carrier Group'' AS Description, 
						              ''CarrierGroup'' AS ConfigType
									  FROM CARRIER_GROUP_HEADER';    
		END								
		END 
    END  
---------------------------------------------------- Handle ShipperCode ----------------------------------------        
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ShipperCode')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ShipperCode';  
        IF @values IS NOT NULL AND @values <> N''       
        BEGIN   
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ShipperCode' and [FormattedValue] like N'%ShipperCode%')  
  BEGIN    
  SET @query = @query + N' UNION SELECT ''ShipperCode'' AS RecordType,        
           COUNT(*) AS NumberOfRecords,         
                                      ''Shipper Code'' AS Description,   
                    ''Shipper Code'' AS ConfigType  
           FROM SHIPPER_CODE';      
  END          
  END   
  END 
------------------------------------------------------- Handle Container Group ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ContainerGroupHeader')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ContainerGroupHeader';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ContainerGroupHeader')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''CONTAINER GROUP'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_CONTAINERGROUP'' AS Description, 
						                  ''Container Group'' AS ConfigType
                                          FROM CONTAINER_GROUP_HEADER';      
        END
		    END 
    END
------------------------------------------------------- Handle Text Message----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'TEXTMESSAGE')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'TEXTMESSAGE';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'TEXTMESSAGE')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''TEXTMESSAGE'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_TEXTMESSAGE'' AS Description, 
						                  ''Text Message'' AS ConfigType
                                          FROM TEXT_MESSAGE';      
        END
		    END 
    END
------------------------------------------------------- Handle Text Message Assignment----------------------------------------------------------
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'TEXTMESSAGEASSIGNMENT')
    BEGIN
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'TEXTMESSAGEASSIGNMENT';
        IF @values IS NOT NULL AND @values <> N''
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'TEXTMESSAGEASSIGNMENT')
            BEGIN
                SET @query = @query + N' UNION SELECT ''TEXTMESSAGEASSIGNMENT'' AS RecordType,      
                                                  COUNT(*) AS NumberOfRecords,       
                                                  ''CWA_TEXTMESSAGEASSIGNMENT'' AS Description, 
                                                  ''Text Message Assignment'' AS ConfigType
                                                  FROM TEXT_MESSAGE_ASSIGNMENT';
            END
        END
    END
------------------------------------------------------- Handle Comment Type----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'COMMENTTYPE')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'COMMENTTYPE';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'COMMENTTYPE')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''COMMENTTYPE'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_COMMENTTYPE'' AS Description, 
						                  ''Comment Type'' AS ConfigType
                                          FROM COMMENT_TYPE';      
        END
		    END 
    END
------------------------------------------------------- Handle Advanced Allocation----------------------------------------------------------
	    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ADVANCEDALLOCATION')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ADVANCEDALLOCATION';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ADVANCEDALLOCATION')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''ADVANCEDALLOCATION'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_ADVANCEDALLOCATION'' AS Description, 
						                  ''Advanced Allocation'' AS ConfigType
                                          FROM ADVANCED_ALLOCATION';      
        END
		    END 
    END
	
------------------------------------------------------- Handle Cycle Count Threshold ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'CYCLECOUNTTHRESHOLD')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'CYCLECOUNTTHRESHOLD';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'CYCLECOUNTTHRESHOLD')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''CYCLECOUNTTHRESHOLD'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CYCLECOUNTTHRESHOLD'' AS Description, 
						                  ''Cycle Count Threshold'' AS ConfigType
                                          FROM CYCLE_COUNT_THRESHOLD';      
        END
		    END 
    END
----------------------------------------------------------- Handle Immediate Needs Trigger--------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ImmediateNeedsTrigger')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ImmediateNeedsTrigger';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ImmediateNeedsTrigger')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''ImmediateNeedsTrigger'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_IMMEDIATENEEDSTRIGGER'' AS Description, 
						                  ''Immediate Need Trigger'' AS ConfigType
                                          FROM IMMEDIATE_NEEDS_TRIGGER';      
        END
		    END 
    END
----------------------------------------------------------- Handle Next Number-----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'NextNumber')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'NextNumber';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'NextNumber')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''NextNumber'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_NEXTNUMBER'' AS Description, 
						                  ''Next Number'' AS ConfigType
                                          FROM NEXT_NUMBER';      
        END
		    END 
    END
------------------------------------------------------- Handle Application Identifier ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'APPIDENTIFIER')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'APPIDENTIFIER';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'APPIDENTIFIER')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''APPIDENTIFIER'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''APPIDENTIFIER'' AS Description, 
						                  ''Application Identifier'' AS ConfigType
                                          FROM APP_IDENTIFIER';      
        END
		    END 
    END
------------------------------------------------------- Handle Pallet Building Master Header----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'PalletBuildingMasterHeader')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'PalletBuildingMasterHeader';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'PalletBuildingMasterHeader')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''PalletBuildingMasterHeader'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_PALLETBUILDINGMASTER'' AS Description, 
						                  ''Pallet Building MasterHeader'' AS ConfigType
                                          FROM PALLET_BUILDING_MASTER_HEADER';      
        END
		    END 
    END
------------------------------------------------------- Handle Work Group -------------------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'WorkGroup')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'WorkGroup';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'WorkGroup')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''WorkGroup'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_WORKGROUP'' AS Description, 
						                  ''Work Group'' AS ConfigType
                                          FROM GENERIC_CONFIG_DETAIL where RECORD_TYPE= ''WORK GROUP''';      
        END
		    END 
    END
------------------------------------------------------- Handle Container Type ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ContainerType')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ContainerType';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ContainerType')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''CONTAINER TYPE'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_CONTAINERTYPE'' AS Description, 
						                  ''Container Type'' AS ConfigType
                                          FROM CONTAINER_TYPE';      
        END
		    END 
    END

------------------------------------------------------- Handle Filter Config Type ----------------------------------------------------------
  IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'FilterConfig')      
    BEGIN 
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'FilterConfig';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN  
		SET @whereClause =N'WHERE FILTER_CONFIG_HEADER.RECORD_TYPE IN '+ @values;   
		SET @query = @query + N' UNION SELECT FILTER_CONFIG_HEADER.RECORD_TYPE AS RecordType,      
					COUNT(FILTER_CONFIG_DETAIL.OBJECT_ID) AS NumberOfRecords,       
					min(FILTER_CONFIG_HEADER.Description) AS Description, 
					''FilterConfig'' AS ConfigType
					FROM  FILTER_CONFIG_HEADER 
					
					left join FILTER_CONFIG_DETAIL on FILTER_CONFIG_HEADER.RECORD_TYPE = FILTER_CONFIG_DETAIL.RECORD_TYPE 
					' + @whereClause + N'            
					GROUP BY FILTER_CONFIG_HEADER.RECORD_TYPE';      
			
		END
		 SET  @whereClause  = N'';      
        SET @values =N''; 
		END

	
------------------------------------------------------- Handle Yard Location ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'DockLocationYardloc')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'DockLocationYardloc';
        IF @values IS NOT NULL AND @values <> N''     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'DockLocationYardloc' and [FormattedValue] like N'%DockLocationYardloc%')
		BEGIN		
		SET @query = @query + N' UNION SELECT ''DockLocationYardloc'' AS RecordType,      
									  COUNT(*) AS NumberOfRecords,       
                                      ''CWA_YARDLOCATION'' AS Description, 
						              ''Yard Location'' AS ConfigType
									  FROM DOCK_LOCATION WHERE RECORD_TYPE = ''YARDLOCAREA'' ';    
		END								
		END
    END 
---------------------------------------------------- Handle Consolidation Location ----------------------------------------      
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'DockLocationConsolloc')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'DockLocationConsolloc';
        IF @values IS NOT NULL AND @values <> N''     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'DockLocationConsolloc' and [FormattedValue] like N'%DockLocationConsolloc%')
		BEGIN		
		SET @query = @query + N' UNION SELECT ''DockLocationConsolloc'' AS RecordType,      
									  COUNT(*) AS NumberOfRecords,       
                                      ''Consolidation Location'' AS Description, 
						              ''Dock Location'' AS ConfigType
									  FROM DOCK_LOCATION WHERE RECORD_TYPE like ''%CONSOLLOCAREA%'' ';    
		END								
		END
    END 
------------------------------------------------------- Handle Freight Consolidator ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'FreightConsolidator')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'FreightConsolidator';
        IF @values IS NOT NULL AND @values <> N''     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'FreightConsolidator')
		BEGIN		
		SET @query = @query + N' UNION SELECT ''FreightConsolidator'' AS RecordType,      
									  COUNT(*) AS NumberOfRecords,       
                                      ''CWA_FREIGHTCONSOLIDATOR'' AS Description, 
						              ''Freight Consolidator'' AS ConfigType
									  FROM GENERIC_ADDRESS_DETAIL WHERE RECORD_TYPE like ''%CONSOL%'' ';    
		END								
		END
    END 
------------------------------------------------------- Handle Intermediate Consignee ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'IntermediateConsignee')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'IntermediateConsignee';
        IF @values IS NOT NULL AND @values <> N''     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'IntermediateConsignee')
		BEGIN		
		SET @query = @query + N' UNION SELECT ''IntermediateConsignee'' AS RecordType,      
									  COUNT(*) AS NumberOfRecords,       
                                      ''CWA_INTERMEDIATECONSIGNEE'' AS Description, 
						              ''Intermediate Consignee'' AS ConfigType
									  FROM GENERIC_ADDRESS_DETAIL WHERE RECORD_TYPE like ''%INTERMEDIATECONSIGNEE%'' ';    
		END								
		END
    END 
------------------------------------------------------- Handle Container Class ----------------------------------------------------------  
  
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ContainerClass')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ContainerClass';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ContainerClass')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''CONTAINER CLASS'' AS RecordType,        
               COUNT(*) AS NumberOfRecords,         
                                          ''CWA_CONTAINERCLASS'' AS Description,   
                        ''Container Class'' AS ConfigType  
                                          FROM CONTAINER_CLASS';        
        END  
      END   
    END
    ------------------------------------------------------- Handle Rating Service Endpoint ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'RatingServiceEndpoint')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'RatingServiceEndpoint';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'RatingServiceEndpoint')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''RatingServiceEndpoint'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_RATINGSERVICEENDPOINT'' AS Description, 
						                  ''Rating Service Endpoint'' AS ConfigType
                                          FROM DYNAMIC_CALLING_DETAIL where RECORD_TYPE= ''RATSER EP''';      
        END
		    END 
    END
------------------------------------------------------- Handle Packing Criteria----------------------------------------------------------  
  
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'PackingCriteria')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'PackingCriteria';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'PackingCriteria')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''PACKING CRITERIA'' AS RecordType,        
               COUNT(*) AS NumberOfRecords,         
                                          ''CWA_PACKINGCRITERIA'' AS Description,   
                        ''Packing Criteria'' AS ConfigType  
                                          FROM PACKING_CRITERIA_HEADER';        
        END  
      END   
    END
	
------------------------------------------------------- Handle Packing Class ----------------------------------------------------------  
  
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'PackingClass')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'PackingClass';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'PackingClass')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''PACKING CLASS'' AS RecordType,        
               COUNT(*) AS NumberOfRecords,         
                                          ''CWA_PACKINGCLASS'' AS Description,   
                        ''Packing Class'' AS ConfigType  
                                          FROM PACKING_CLASS';        
        END  
      END   
    END 
------------------------------------------------------- Handle Comment Type Document Assignment ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'CommTypeDocAssignment')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'CommTypeDocAssignment';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'CommTypeDocAssignment')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''CommTypeDocAssignment'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_COMMENTTYPEDOCASSIGNMENT'' AS Description, 
						                  ''CommTypeDocAssignment'' AS ConfigType
                                          FROM COMMENT_TYPE_DOC_ASSIGNMENT';      
        END
      END
    END
------------------------------------------------------- Handle DIF Outgoing Endpoint ---------------------------------------------------


    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'DIFOutGoingEndpoint')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'DIFOutGoingEndpoint';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'DIFOutGoingEndpoint')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''DIFOutGoingEndpoint'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_DIFOUTGOINGENDPOINT'' AS Description, 
						                  ''DIF Outgoing Endpoint'' AS ConfigType
                                          FROM DYNAMIC_CALLING_DETAIL where RECORD_TYPE= ''DIFOGEP''';      
        END
		    END 
    END	

    		---------------------------------------------------- Handle Consolidation Criteria ----------------------------------------      
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ConsolidationCriteria')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ConsolidationCriteria';
        IF @values IS NOT NULL AND @values <> N''     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ConsolidationCriteria' and [FormattedValue] like N'%ConsolidationCriteria%')
		BEGIN		
		SET @query = @query + N' UNION SELECT ''ConsolidationCriteria'' AS RecordType,      
									  COUNT(*) AS NumberOfRecords,       
                                      ''CWA_CONSOLIDATIONCRITERIA'' AS Description, 
						              ''ConsolidationCriteria'' AS ConfigType
									  FROM CONSOLIDATION_CRITERIA';    
		END								
		END
    END

------------------------------------------------------- Handle DIF Event Execution Endpoint ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'DIFEventExecutionEndpoint')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'DIFEventExecutionEndpoint';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'DIFEventExecutionEndpoint')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''DIFEventExecutionEndpoint'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_DIFEVENTEXECUTIONENDPOINT'' AS Description, 
						                  ''DIF Event Execution Endpoint'' AS ConfigType
                                          FROM DYNAMIC_CALLING_DETAIL where RECORD_TYPE= ''DIFEVEXEP''';      
        END
		    END 

    END
-------------------------------------------------------Handle Warehouse Mobile Endpoint ----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'WarehouseMobileEndpoint')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'WarehouseMobileEndpoint';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'WarehouseMobileEndpoint')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''WarehouseMobileEndpoint'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_WAREHOUSEMOBILEENDPOINT'' AS Description, 
						                  ''Warehouse Mobile Endpoint'' AS ConfigType
                                          FROM DYNAMIC_CALLING_DETAIL where RECORD_TYPE= ''WMENDPOINT''';      
        END
		    END 
    END
	
---------------------------------------------------- Handle Carrier EDI reference ----------------------------------------      
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'CarrierEDIReference')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'CarrierEDIReference';
        IF @values IS NOT NULL AND @values <> N''     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'CarrierEDIReference' and [FormattedValue] like N'%CarrierEDIReference%')
		BEGIN		
		SET @query = @query + N' UNION SELECT ''CarrierEDIReference'' AS RecordType,
									  COUNT(DISTINCT rating_id) AS NumberOfRecords,
                                      ''Carrier EDI Reference'' AS Description, 
						              ''CarrierEDIReference'' AS ConfigType
									  FROM CARRIER_EDI_REFERENCE WHERE customer IS NULL';    
		END								
		END
    END 
    
---------------------------------------------------- Handle Wave Picking Group ----------------------------------------      
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'WavePickingGroup')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'WavePickingGroup';
        IF @values IS NOT NULL AND @values <> N''     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'WavePickingGroup' and [FormattedValue] like N'%WavePickingGroup%')
		BEGIN		
		SET @query = @query + N' UNION SELECT ''WavePickingGroup'' AS RecordType,
									  COUNT(*) AS NumberOfRecords,
                                      ''Wave Picking Group'' AS Description,
						              ''WavePickingGroup'' AS ConfigType
									  FROM PICKING_GROUP_HEADER';
		END								
		END
    END
    
--------------------------------------------------- Handle Estimaed Work Rates----------------------------------------------------------
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'EstWorkRates')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'EstWorkRates';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'EstWorkRates')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''EstWorkRates'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_ESTIMATEDWORKRATEMENU'' AS Description, 
						                  ''EstWorkRates'' AS ConfigType
                                          FROM ESTIMATED_WORK_RATES';      
            END
		  END 
    END
    
--------------------------------------------------- Handle Pro Number----------------------------------------------------------
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ProNumber')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ProNumber';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ProNumber')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''ProNumber'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''Pro Number'' AS Description, 
						                  ''ProNumber'' AS ConfigType
                                          FROM PRO_NUMBER';      
            END
		  END 
    END
--------------------------------------------------- Handle Shipper Cross reference----------------------------------------------------------
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ShipperCrossRef')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ShipperCrossRef';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ShipperCrossRef')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''ShipperCrossRef'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''Shipper Cross Reference'' AS Description, 
						                  ''ShipperCrossRef'' AS ConfigType
                                          FROM SHIPPER_CROSS_REFERENCE';      
            END
		  END 
    END
	
--------------------------------------------------- Handle Dashboard Widgets----------------------------------------------------------
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'DashboardWidgets')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'DashboardWidgets';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'DashboardWidgets')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''DashboardWidgets'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''Dashboard Widgets'' AS Description, 
						                  ''DashboardWidgets'' AS ConfigType
                                          FROM DASHBOARD_WIDGETS';      
            END
		  END 
    END


--------------------------------------------------- Handle Dashboard Menu Layout --------
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'MenuScreen')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'MenuScreen';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'MenuScreen')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''MenuScreen'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_MENUSCREEN'' AS Description, 
						                  ''MenuScreen'' AS ConfigType
                                          FROM Main_Ui_Screen';      
            END
		  END 
    END

--------------------------------------------------- Handle Scheduled Jobs----------------------------------------------------------
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ScheduledJob')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ScheduledJob';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ScheduledJob')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''ScheduledJob'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''Scheduled Jobs'' AS Description, 
						                  ''ScheduledJob'' AS ConfigType
                                          FROM SCHEDULED_JOBS';      
            END
		  END 
    END

---------------------------------------------------- Handle GroupPicikingWorkSequence ----------------------------------------      
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'WorkRegroupOrder')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'WorkRegroupOrder';
        IF @values IS NOT NULL AND @values <> N''     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'WorkRegroupOrder')
		BEGIN		
		SET @query = @query + N' UNION SELECT ''WorkRegroupOrder'' AS RecordType,      
									  COUNT(*) AS NumberOfRecords,       
                                      ''GROUPPICKINGWORKSEQUENCE'' AS Description, 
						              ''WorkRegroupOrder'' AS ConfigType
									  FROM WORK_REGROUP_ORDER';    
		END								
		END 
    END
	---------------------------------------------------------- Handle Archive Master ----------------------------------------------------------

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ArchiveMaster')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ArchiveMaster';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ArchiveMaster')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''ARCHIVEMASTER'' AS RecordType,        
               COUNT(*) AS NumberOfRecords,         
                                          ''CWA_ARCHIVEMASTER'' AS Description,   
                        ''ArchiveMaster'' AS ConfigType  
                                          FROM ARCHIVE_PREFERENCES';        
        END  
      END   
    END 
 ---------------------------------------------------- Handle CustomStatusFlow header ----------------------------------------        
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'CustomStatusFlowHeader')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'CustomStatusFlowHeader';  
        IF @values IS NOT NULL AND @values <> N''       
        BEGIN   
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'CustomStatusFlowHeader' and [FormattedValue] like N'%CustomStatusFlowHeader%')  
  BEGIN    
  SET @query = @query + N' UNION SELECT ''CustomStatusFlowHeader'' AS RecordType,        
           COUNT(*) AS NumberOfRecords,         
                                      ''CWA_CUSTOMSTATUSFLOW'' AS Description,   
                    ''CustomStatusFlowHeader'' AS ConfigType  
           FROM CUSTOM_STATUS_FLOW_HEADER';      
  END          
  END  
    END 
 ---------------------------------------------------- Handle LabelMasterHeader ----------------------------------------        
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'LabelMasterHeader')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'LabelMasterHeader';  
        IF @values IS NOT NULL AND @values <> N''       
        BEGIN   
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'LabelMasterHeader' and [FormattedValue] like N'%LabelMasterHeader%')  
  BEGIN    
  SET @query = @query + N' UNION SELECT ''LabelMasterHeader'' AS RecordType,        
           COUNT(*) AS NumberOfRecords,         
                                      ''CWA_LABELMASTER'' AS Description,   
                    ''LabelMasterHeader'' AS ConfigType  
           FROM LABEL_MASTER_HEADER';      
  END          
  END  
    END   
   ---------------------------------------------------- Handle StoreLocationAssignment ----------------------------------------            
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'StoreLocationAssignment')            
    BEGIN            
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'StoreLocationAssignment';      
        IF @values IS NOT NULL AND @values <> N''           
        BEGIN       
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'StoreLocationAssignment' and [FormattedValue] like N'%StoreLocationAssignment%')      
  BEGIN        
  SET @query = @query + N' UNION SELECT ''StoreLocationAssignment'' AS RecordType,            
           COUNT(*) AS NumberOfRecords,             
                                      ''CWA_STORELOCATIONASSIGNMENT'' AS Description,       
                    ''StoreLocationAssignment'' AS ConfigType      
           FROM STORE_LOCATION_ASSIGNMENT';          
  END              
  END      
    END      

	---------------------------------------------------------- Handle Vendor ----------------------------------------------------------

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'Vendor')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'Vendor';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'Vendor')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''Vendor'' AS RecordType,        
               COUNT(*) AS NumberOfRecords,         
                                          ''VENDOR'' AS Description,   
                        ''Vendor'' AS ConfigType  
                                          FROM VENDOR';          
        END  
      END   
    END 

--------------------------------------------------- Handle Shipper Cross reference----------------------------------------------------------
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'WhAlerts')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'WhAlerts';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'WhAlerts')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''WhAlerts'' AS RecordType,
									      COUNT(*) AS NumberOfRecords,
                                          ''CWA_WHSALERTS'' AS Description,
						                  ''WhAlerts'' AS ConfigType
                                          FROM WAREHOUSE_ALERT';
            END
		  END 
    END
--------------------------------------------------- Handle ShiftTime----------------------------------------------------------
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ShiftTime')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ShiftTime';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'ShiftTime')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''ShiftTime'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_SHIFTTIME'' AS Description, 
						                  ''ShiftTime'' AS ConfigType
                                          FROM SHIFT_TIME';      
            END
		  END 
    END
	---------------------------------------------------------- Handle Putaway Group Location ----------------------------------------------------------

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'PutawayLocGrp')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'PutawayLocGrp';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'PutawayLocGrp')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''PutawayLocGrp'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''PUTAWAYLOCATIONGROUP'' AS Description,
										  ''PutawayLocationGroup'' AS ConfigType
                                          FROM PUTAWAY_GROUP_LOCATION';
        END  
      END   
    END 
	---------------------------------------------------------- Handle Security Group ----------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'SecurityGroup')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'SecurityGroup';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'SecurityGroup')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''SECURITYGROUP'' AS RecordType,        
               COUNT(*) AS NumberOfRecords,         
                                          ''CWA_SECURITYGROUP'' AS Description,   
                        ''SecurityGroup'' AS ConfigType  
                                          FROM SECURITY_GROUP';        
        END  
      END   
    END 

	---------------------------------------------------------- Handle Customer ----------------------------------------------------------

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'Customer')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'Customer';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'Customer')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''Customer'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CUSTOMER'' AS Description,
										  ''Customer'' AS ConfigType
                                          FROM CUSTOMER';
        END  
      END   
    END 
	

	---------------------------------------------------------- Handle QC Assignment ----------------------------------------------------------

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'QcAssignment')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'QcAssignment';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'QcAssignment')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''QcAssignment'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''QCASSIGNMENTTITLE'' AS Description,
										  ''QcAssignment'' AS ConfigType
                                          FROM QC_ASSIGNMENT';
        END  
      END   
    END 

	---------------------------------------------------------- VAS Activity ----------------------------------------------------------

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'VasActivity')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'VasActivity';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'VasActivity')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''VasActivity'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''VASACTIVITYTITLE'' AS Description,
										  ''VasActivity'' AS ConfigType
                                          FROM VAS_ACTIVITY';
        END  
      END   
    END 		
	
	---------------------------------------------------------- Vocollect ----------------------------------------------------------

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'Vocollect')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'Vocollect';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'Vocollect')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''Vocollect'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''VOCOLLECT'' AS Description,
										  ''Vocollect'' AS ConfigType
                                          FROM VOCOLLECT_PROFILE';
        END  
      END   
    END 

	---------------------------------------------------------- Labor Plan Header ----------------------------------------------------------

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'LaborPlan')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'LaborPlan';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'LaborPlan')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''LaborPlan'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_LABORPLAN'' AS Description,
										  ''LaborPlan'' AS ConfigType
                                          FROM LABOR_PLAN_HDR';
        END  
      END   
    END 		
	
	----------------------------------------------------------- Handle Notification-----------------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'Notification')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'Notification';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'Notification')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''Notification'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''NOTIFICATION'' AS Description, 
						                  ''Notification'' AS ConfigType
                                          FROM Notification';      
        END
		    END 
    END
  ---------------------------------------------------------- Handle DocumentMaster ----------------------------------------------------------
         IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'DocumentMaster')
    BEGIN
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'DocumentMaster';
        IF @values IS NOT NULL AND @values <> N''
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'DocumentMaster')
        BEGIN  
        SET @query = @query + N' UNION SELECT ''DocumentMaster'' AS RecordType,        
               COUNT(*) AS NumberOfRecords,         
                                          ''CWA_DOCUMENTMASTER'' AS Description,   
                        ''DocumentMaster'' AS ConfigType  
                                          FROM PAPERWORK_MASTER';
END
END
END
    

-------------------------------------------------------Peronal Alerts Data Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'PersonalAlerts')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'PersonalAlerts';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'PersonalAlerts')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''PersonalAlerts'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''Personal Alerts Data Query'' AS Description,
										  ''PersonalAlerts'' AS ConfigType
                                          FROM DATA_RETRIEVAL_STMT_DETAIL where STMT_HEADER_KEY_NUM=''10003'''  ;
        END  
      END   
    END 

--------------------------------------------------- Handle Routing Guide ----------------------------------------------------------
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'RoutingGuide')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'RoutingGuide';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'RoutingGuide')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''RoutingGuide'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CWA_ROUTINGGUIDE'' AS Description, 
						                  ''RoutingGuide'' AS ConfigType
                                          FROM ROUTING_GUIDE';      
            END
		  END 
    END
	
-------------------------------------------------------Serial Num Template Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'SerialNumTemplate')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'SerialNumTemplate';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'SerialNumTemplate')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''SerialNumTemplate'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''SERIALNUMTEMPLATENAME'' AS Description,
										  ''SerialNumTemplate'' AS ConfigType
                                          FROM SERIAL_NUM_TEMPLATE' ;
        END  
      END   
    END 
----------------------------------------------------------- Handle Bill of Materials--------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'BillofMaterials')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'BillofMaterials';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'BillofMaterials')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''BillofMaterials'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''UI_CFGBOMH'' AS Description, 
						                  ''BillofMaterials'' AS ConfigType
                                          FROM BILL_OF_MATERIALS_HEADER';
        END
		    END 
    END
	
-------------------------------------------------------Lot Template Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'LotTemplate')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'LotTemplate';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'LotTemplate')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''LotTemplate'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''LOTTEMPLATE'' AS Description,
										  ''LotTemplate'' AS ConfigType
                                          FROM LOT_TEMPLATE' ;
        END  
      END   
    END 

----------------------------------------------------------- Handle Carrier Commitments--------------------------------------------------

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'CARRIERCOMMITMENTS')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'CARRIERCOMMITMENTS';
        IF @values IS NOT NULL AND @values <> N''      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'CARRIERCOMMITMENTS')
		    BEGIN
		    SET @query = @query + N' UNION SELECT ''CARRIERCOMMITMENTS'' AS RecordType,      
									      COUNT(*) AS NumberOfRecords,       
                                          ''CARRIERCOMMITMENTS'' AS Description, 
						                  ''CARRIERCOMMITMENTS'' AS ConfigType
                                          FROM CARRIER_COMMITMENTS';
        END
		    END 
    END
	
-------------------------------------------------------DockAreaCarrierAssignment Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'DockAreaCarrierAssignment')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'DockAreaCarrierAssignment';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'DockAreaCarrierAssignment')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''DockAreaCarrierAssignment'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_DOCKAREACARRIERASSIGNMENT'' AS Description,
										  ''DockAreaCarrierAssignment'' AS ConfigType
                                          FROM DOCK_AREA_CARRIER_ASSIGNMENT' ;
        END  
      END   
    END 


-------------------------------------------------------Interface Data Map Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'InterfaceDataMapHeader')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'InterfaceDataMapHeader';  
        IF @values IS NOT NULL AND @values <> N''        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'InterfaceDataMapHeader')  
      BEGIN  
      SET @query = @query + N' UNION SELECT ''InterfaceDataMapHeader'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_INTERFACEDATAMAP'' AS Description,
										  ''InterfaceDataMapHeader'' AS ConfigType
                                          FROM INTERFACE_DATA_MAP_HEADER' ;
        END  
      END   
    END 
  	
-------------------------------------------------------Receiving Preference Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ReceivingPref')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ReceivingPref';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''ReceivingPref'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_RECEIVINGPREF'' AS Description,
										  ''ReceivingPref'' AS ConfigType
                                          FROM RECEIVING_PREFERENCES' ;
		END
	  END
  	
-------------------------------------------------------Shipping Preference Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ShippingPreferences')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ShippingPreferences';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''ShippingPreferences'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_SHIPPINGPREF'' AS Description,
										  ''ShippingPreferences'' AS ConfigType
                                          FROM SHIPPING_PREFERENCES' ;
		END
	  END

-------------------------------------------------------Labor Group Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'LaborGroup')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'LaborGroup';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''LaborGroup'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_LABORGROUP'' AS Description,
										  ''LaborGroup'' AS ConfigType
                                          FROM LABOR_GROUP' ;
		END
	  END

-------------------------------------------------------Functional Area Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'FunctionalArea')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'FunctionalArea';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''FunctionalArea'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_FUNCTIONALAREA'' AS Description,
										  ''FunctionalArea'' AS ConfigType
                                          FROM FUNCTIONAL_AREA' ;
		END
	  END

-------------------------------------------------------Item Location Assignment------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ItemLocationAssignment')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ItemLocationAssignment';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''ItemLocationAssignment'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_ITEMLOCASSIGN'' AS Description,
										  ''ItemLocationAssignment'' AS ConfigType
                                          FROM ITEM_LOCATION_ASSIGNMENT' ;
		END
	  END
        	
-------------------------------------------------------Packing Preference Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'PackingPreferences')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'PackingPreferences';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''PackingPreferences'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_PACKINGPREF'' AS Description,
										  ''PackingPreferences'' AS ConfigType
                                          FROM PACKING_PREFERENCES' ;
		END
	  END
-------------------------------------------------------Web User------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'WebUser')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'WebUser';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'WebUser')
			BEGIN
			SET @query = @query + N' UNION SELECT ''WebUser'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_WEBUSER'' AS Description,
										  ''WebUser'' AS ConfigType
                                          FROM WEB_USER' ;
			END
		END
	  END

-------------------------------------------------------Generic Config Header Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'GenericConfigHeader')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'GenericConfigHeader';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''GenericConfigHeader'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_GENERICCONFIGURATION'' AS Description,
										  ''GenericConfigHeader'' AS ConfigType
                                          FROM GENERIC_CONFIG_HEADER' ;
		END
	  END

-------------------------------------------------------Item Location Capacity------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ItemLocationCapacity')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ItemLocationCapacity';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''ItemLocationCapacity'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_ITEMLOCCAPACITY'' AS Description,
										  ''ItemLocationCapacity'' AS ConfigType
                                          FROM ITEM_LOCATION_CAPACITY' ;
		END
	  END
        	
-------------------------------------------------------Cycle Count Preference Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'CycleCountPreferences')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'CycleCountPreferences';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''CycleCountPreferences'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_CYCLECOUNTPREF'' AS Description,
										  ''CycleCountPreferences'' AS ConfigType
                                          FROM CYCLE_COUNT_PREFERENCES' ;
		END
	  END

-------------------------------------------------------Item Unit Of Measure------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'ItemUnitOfMeasure')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'ItemUnitOfMeasure';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''ItemUnitOfMeasure'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_ITEMUOM'' AS Description,
										  ''ItemUnitOfMeasure'' AS ConfigType
                                          FROM ITEM_UNIT_OF_MEASURE' ;
		END
	  END

        	
-------------------------------------------------------Work Order Preference Query------------------------------------------------------------
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'WorkOrderPreferences')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'WorkOrderPreferences';  
        IF @values IS NOT NULL AND @values <> N'' 
		BEGIN  
			SET @query = @query + N' UNION SELECT ''WorkOrderPreferences'' AS RecordType,        
										COUNT(*) AS NumberOfRecords,
                                          ''CWA_WOPREF'' AS Description,
										  ''WorkOrderPreferences'' AS ConfigType
                                          FROM WORK_ORDER_PREFERENCES' ;
		END
	  END

--------------------------------------------------------Final Execution------------------------------------------------------------------      
    IF @query IS NOT NULL AND @query <> N''      
 --remove UNION      
  BEGIN      
  IF LEFT(@query, 6) = N' UNION'      
   BEGIN      
      SET @query = SUBSTRING(@query, 7, LEN(@query) - 6);  -- Remove 'UNION ' from the start      
  END      
        EXEC sp_executesql @query;      
    END      
      
    DROP TABLE #configsKeyValData;      
END 
