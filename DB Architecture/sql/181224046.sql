-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE LoadAdditionalConfigsSummary      
    @configsToLoad NVARCHAR(MAX)      
AS      
BEGIN      
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
    CREATE TABLE #configsKeyValData (      
        FormattedKey NVARCHAR(MAX),      
        FormattedValue NVARCHAR(MAX)      
    );      
      
    SET @configsToLoad = LTRIM(RTRIM(@configsToLoad));      
      
    INSERT INTO #configsKeyValData (FormattedKey, FormattedValue)      
    SELECT        
        configsData.[Key],       
        N'<literal:1>'+STRING_AGG(QUOTENAME(arrayData.Value, N'<literal:2>'), N'<literal:3>')+N'<literal:4>' AS FormattedValue      
    FROM OPENJSON(@configsToLoad) AS configsData      
    CROSS APPLY OPENJSON(configsData.Value) AS arrayData        
    GROUP BY configsData.[Key]      
    UNION ALL      
    SELECT [Key],N'<literal:5>' AS FormattedValue  FROM OPENJSON(@configsToLoad) AS configsData WHERE configsData.Value = N'<literal:6>';      
      
-- [comment omitted]
      
    DECLARE @query NVARCHAR(MAX) = N'<literal:7>';      
    DECLARE @whereClause NVARCHAR(MAX) = N'<literal:8>';      
    DECLARE @values NVARCHAR(MAX)=N'<literal:9>';      
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:10>')      
    BEGIN       
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:11>'; 
        IF @values IS NOT NULL AND @values <> N'<literal:12>'      
        BEGIN      
        SET @whereClause =N'<literal:13>'+ @values;         
        SET @query = N'<literal:14>'





 + @whereClause + N'<literal:15>'
; 
		END 			  
		SET  @whereClause  = N'<literal:16>';      
		SET @values =N'<literal:17>';      
    END      
      
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:18>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:19>';     
        IF @values IS NOT NULL AND @values <> N'<literal:20>'      
        BEGIN      
        SET @whereClause = N'<literal:21>'+ @values + N'<literal:22>';  
		SET @query = @query + N'<literal:23>'





 + @whereClause + N'<literal:24>'
; 
		END 					 
        SET  @whereClause  = N'<literal:25>';      
        SET @values =N'<literal:26>';      
    END      
      
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:27>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:28>';
        IF @values IS NOT NULL AND @values <> N'<literal:29>'      
        BEGIN       
        IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:30>' and [FormattedValue] like N'<literal:31>')
		BEGIN
		SET @query = @query + N'<literal:32>'





;      
         END
		IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:33>' and [FormattedValue] like N'<literal:34>')
		BEGIN
		SET @query = @query + N'<literal:35>'




;  
		END
		END 
    END

-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:36>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:37>';
        IF @values IS NOT NULL AND @values <> N'<literal:38>'     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:39>' and [FormattedValue] like N'<literal:40>')
		BEGIN		
		SET @query = @query + N'<literal:41>'



;    
		END								
		END
    END     	
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:42>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:43>';
        IF @values IS NOT NULL AND @values <> N'<literal:44>'     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:45>' and [FormattedValue] like N'<literal:46>')
		BEGIN		
		SET @query = @query + N'<literal:47>'



;    
		END								
		END 
    END  
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:48>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:49>';  
        IF @values IS NOT NULL AND @values <> N'<literal:50>'       
        BEGIN   
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:51>' and [FormattedValue] like N'<literal:52>')  
  BEGIN    
  SET @query = @query + N'<literal:53>'



;      
  END          
  END   
  END 
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:54>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:55>';
        IF @values IS NOT NULL AND @values <> N'<literal:56>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:57>')
		    BEGIN
		    SET @query = @query + N'<literal:58>'



;      
        END
		    END 
    END
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:59>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:60>';
        IF @values IS NOT NULL AND @values <> N'<literal:61>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:62>')
		    BEGIN
		    SET @query = @query + N'<literal:63>'



;      
        END
		    END 
    END
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:64>')
    BEGIN
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:65>';
        IF @values IS NOT NULL AND @values <> N'<literal:66>'
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:67>')
            BEGIN
                SET @query = @query + N'<literal:68>'



;
            END
        END
    END
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:69>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:70>';
        IF @values IS NOT NULL AND @values <> N'<literal:71>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:72>')
		    BEGIN
		    SET @query = @query + N'<literal:73>'



;      
        END
		    END 
    END
-- [comment omitted]
	    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:74>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:75>';
        IF @values IS NOT NULL AND @values <> N'<literal:76>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:77>')
		    BEGIN
		    SET @query = @query + N'<literal:78>'



;      
        END
		    END 
    END
	
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:79>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:80>';
        IF @values IS NOT NULL AND @values <> N'<literal:81>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:82>')
		    BEGIN
		    SET @query = @query + N'<literal:83>'



;      
        END
		    END 
    END
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:84>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:85>';
        IF @values IS NOT NULL AND @values <> N'<literal:86>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:87>')
		    BEGIN
		    SET @query = @query + N'<literal:88>'



;      
        END
		    END 
    END
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:89>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:90>';
        IF @values IS NOT NULL AND @values <> N'<literal:91>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:92>')
		    BEGIN
		    SET @query = @query + N'<literal:93>'



;      
        END
		    END 
    END
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:94>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:95>';
        IF @values IS NOT NULL AND @values <> N'<literal:96>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:97>')
		    BEGIN
		    SET @query = @query + N'<literal:98>'



;      
        END
		    END 
    END
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:99>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:100>';
        IF @values IS NOT NULL AND @values <> N'<literal:101>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:102>')
		    BEGIN
		    SET @query = @query + N'<literal:103>'



;      
        END
		    END 
    END
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:104>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:105>';
        IF @values IS NOT NULL AND @values <> N'<literal:106>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:107>')
		    BEGIN
		    SET @query = @query + N'<literal:108>'



;      
        END
		    END 
    END
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:109>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:110>';
        IF @values IS NOT NULL AND @values <> N'<literal:111>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:112>')
		    BEGIN
		    SET @query = @query + N'<literal:113>'



;      
        END
		    END 
    END

-- [comment omitted]
  IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:114>')      
    BEGIN 
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:115>';
        IF @values IS NOT NULL AND @values <> N'<literal:116>'      
        BEGIN  
		SET @whereClause =N'<literal:117>'+ @values;   
		SET @query = @query + N'<literal:118>'






 + @whereClause + N'<literal:119>'
;      
			
		END
		 SET  @whereClause  = N'<literal:120>';      
        SET @values =N'<literal:121>'; 
		END

	
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:122>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:123>';
        IF @values IS NOT NULL AND @values <> N'<literal:124>'     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:125>' and [FormattedValue] like N'<literal:126>')
		BEGIN		
		SET @query = @query + N'<literal:127>'



;    
		END								
		END
    END 
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:128>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:129>';
        IF @values IS NOT NULL AND @values <> N'<literal:130>'     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:131>' and [FormattedValue] like N'<literal:132>')
		BEGIN		
		SET @query = @query + N'<literal:133>'



;    
		END								
		END
    END 
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:134>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:135>';
        IF @values IS NOT NULL AND @values <> N'<literal:136>'     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:137>')
		BEGIN		
		SET @query = @query + N'<literal:138>'



;    
		END								
		END
    END 
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:139>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:140>';
        IF @values IS NOT NULL AND @values <> N'<literal:141>'     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:142>')
		BEGIN		
		SET @query = @query + N'<literal:143>'



;    
		END								
		END
    END 
-- [comment omitted]
  
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:144>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:145>';  
        IF @values IS NOT NULL AND @values <> N'<literal:146>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:147>')  
      BEGIN  
      SET @query = @query + N'<literal:148>'



;        
        END  
      END   
    END
    -- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:149>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:150>';
        IF @values IS NOT NULL AND @values <> N'<literal:151>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:152>')
		    BEGIN
		    SET @query = @query + N'<literal:153>'



;      
        END
		    END 
    END
-- [comment omitted]
  
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:154>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:155>';  
        IF @values IS NOT NULL AND @values <> N'<literal:156>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:157>')  
      BEGIN  
      SET @query = @query + N'<literal:158>'



;        
        END  
      END   
    END
	
-- [comment omitted]
  
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:159>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:160>';  
        IF @values IS NOT NULL AND @values <> N'<literal:161>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:162>')  
      BEGIN  
      SET @query = @query + N'<literal:163>'



;        
        END  
      END   
    END 
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:164>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:165>';
        IF @values IS NOT NULL AND @values <> N'<literal:166>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:167>')
		    BEGIN
		    SET @query = @query + N'<literal:168>'



;      
        END
      END
    END
-- [comment omitted]


    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:169>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:170>';
        IF @values IS NOT NULL AND @values <> N'<literal:171>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:172>')
		    BEGIN
		    SET @query = @query + N'<literal:173>'



;      
        END
		    END 
    END	

    		-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:174>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:175>';
        IF @values IS NOT NULL AND @values <> N'<literal:176>'     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:177>' and [FormattedValue] like N'<literal:178>')
		BEGIN		
		SET @query = @query + N'<literal:179>'



;    
		END								
		END
    END

-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:180>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:181>';
        IF @values IS NOT NULL AND @values <> N'<literal:182>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:183>')
		    BEGIN
		    SET @query = @query + N'<literal:184>'



;      
        END
		    END 

    END
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:185>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:186>';
        IF @values IS NOT NULL AND @values <> N'<literal:187>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:188>')
		    BEGIN
		    SET @query = @query + N'<literal:189>'



;      
        END
		    END 
    END
	
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:190>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:191>';
        IF @values IS NOT NULL AND @values <> N'<literal:192>'     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:193>' and [FormattedValue] like N'<literal:194>')
		BEGIN		
		SET @query = @query + N'<literal:195>'



;    
		END								
		END
    END 
    
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:196>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:197>';
        IF @values IS NOT NULL AND @values <> N'<literal:198>'     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:199>' and [FormattedValue] like N'<literal:200>')
		BEGIN		
		SET @query = @query + N'<literal:201>'



;
		END								
		END
    END
    
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:202>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:203>';
        IF @values IS NOT NULL AND @values <> N'<literal:204>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:205>')
		    BEGIN
		    SET @query = @query + N'<literal:206>'



;      
            END
		  END 
    END
    
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:207>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:208>';
        IF @values IS NOT NULL AND @values <> N'<literal:209>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:210>')
		    BEGIN
		    SET @query = @query + N'<literal:211>'



;      
            END
		  END 
    END
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:212>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:213>';
        IF @values IS NOT NULL AND @values <> N'<literal:214>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:215>')
		    BEGIN
		    SET @query = @query + N'<literal:216>'



;      
            END
		  END 
    END
	
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:217>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:218>';
        IF @values IS NOT NULL AND @values <> N'<literal:219>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:220>')
		    BEGIN
		    SET @query = @query + N'<literal:221>'



;      
            END
		  END 
    END


-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:222>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:223>';
        IF @values IS NOT NULL AND @values <> N'<literal:224>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:225>')
		    BEGIN
		    SET @query = @query + N'<literal:226>'



;      
            END
		  END 
    END

-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:227>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:228>';
        IF @values IS NOT NULL AND @values <> N'<literal:229>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:230>')
		    BEGIN
		    SET @query = @query + N'<literal:231>'



;      
            END
		  END 
    END

-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:232>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:233>';
        IF @values IS NOT NULL AND @values <> N'<literal:234>'     
        BEGIN 
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:235>')
		BEGIN		
		SET @query = @query + N'<literal:236>'



;    
		END								
		END 
    END
	-- [comment omitted]

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:237>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:238>';  
        IF @values IS NOT NULL AND @values <> N'<literal:239>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:240>')  
      BEGIN  
      SET @query = @query + N'<literal:241>'



;        
        END  
      END   
    END 
 -- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:242>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:243>';  
        IF @values IS NOT NULL AND @values <> N'<literal:244>'       
        BEGIN   
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:245>' and [FormattedValue] like N'<literal:246>')  
  BEGIN    
  SET @query = @query + N'<literal:247>'



;      
  END          
  END  
    END 
 -- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:248>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:249>';  
        IF @values IS NOT NULL AND @values <> N'<literal:250>'       
        BEGIN   
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:251>' and [FormattedValue] like N'<literal:252>')  
  BEGIN    
  SET @query = @query + N'<literal:253>'



;      
  END          
  END  
    END   
   -- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:254>')            
    BEGIN            
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:255>';      
        IF @values IS NOT NULL AND @values <> N'<literal:256>'           
        BEGIN       
     IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:257>' and [FormattedValue] like N'<literal:258>')      
  BEGIN        
  SET @query = @query + N'<literal:259>'



;          
  END              
  END      
    END      

	-- [comment omitted]

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:260>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:261>';  
        IF @values IS NOT NULL AND @values <> N'<literal:262>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:263>')  
      BEGIN  
      SET @query = @query + N'<literal:264>'



;          
        END  
      END   
    END 

-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:265>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:266>';
        IF @values IS NOT NULL AND @values <> N'<literal:267>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:268>')
		    BEGIN
		    SET @query = @query + N'<literal:269>'



;
            END
		  END 
    END
-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:270>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:271>';
        IF @values IS NOT NULL AND @values <> N'<literal:272>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:273>')
		    BEGIN
		    SET @query = @query + N'<literal:274>'



;      
            END
		  END 
    END
	-- [comment omitted]

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:275>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:276>';  
        IF @values IS NOT NULL AND @values <> N'<literal:277>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:278>')  
      BEGIN  
      SET @query = @query + N'<literal:279>'



;
        END  
      END   
    END 
	-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:280>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:281>';  
        IF @values IS NOT NULL AND @values <> N'<literal:282>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:283>')  
      BEGIN  
      SET @query = @query + N'<literal:284>'



;        
        END  
      END   
    END 

	-- [comment omitted]

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:285>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:286>';  
        IF @values IS NOT NULL AND @values <> N'<literal:287>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:288>')  
      BEGIN  
      SET @query = @query + N'<literal:289>'



;
        END  
      END   
    END 
	

	-- [comment omitted]

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:290>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:291>';  
        IF @values IS NOT NULL AND @values <> N'<literal:292>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:293>')  
      BEGIN  
      SET @query = @query + N'<literal:294>'



;
        END  
      END   
    END 

	-- [comment omitted]

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:295>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:296>';  
        IF @values IS NOT NULL AND @values <> N'<literal:297>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:298>')  
      BEGIN  
      SET @query = @query + N'<literal:299>'



;
        END  
      END   
    END 		
	
	-- [comment omitted]

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:300>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:301>';  
        IF @values IS NOT NULL AND @values <> N'<literal:302>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:303>')  
      BEGIN  
      SET @query = @query + N'<literal:304>'



;
        END  
      END   
    END 

	-- [comment omitted]

      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:305>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:306>';  
        IF @values IS NOT NULL AND @values <> N'<literal:307>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:308>')  
      BEGIN  
      SET @query = @query + N'<literal:309>'



;
        END  
      END   
    END 		
	
	-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:310>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:311>';
        IF @values IS NOT NULL AND @values <> N'<literal:312>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:313>')
		    BEGIN
		    SET @query = @query + N'<literal:314>'



;      
        END
		    END 
    END
  -- [comment omitted]
         IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:315>')
    BEGIN
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:316>';
        IF @values IS NOT NULL AND @values <> N'<literal:317>'
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:318>')
        BEGIN  
        SET @query = @query + N'<literal:319>'



;
END
END
END
    

-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:320>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:321>';  
        IF @values IS NOT NULL AND @values <> N'<literal:322>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:323>')  
      BEGIN  
      SET @query = @query + N'<literal:324>'



  ;
        END  
      END   
    END 

-- [comment omitted]
    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:325>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:326>';
        IF @values IS NOT NULL AND @values <> N'<literal:327>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:328>')
		    BEGIN
		    SET @query = @query + N'<literal:329>'



;      
            END
		  END 
    END
	
-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:330>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:331>';  
        IF @values IS NOT NULL AND @values <> N'<literal:332>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:333>')  
      BEGIN  
      SET @query = @query + N'<literal:334>'



 ;
        END  
      END   
    END 
-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:335>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:336>';
        IF @values IS NOT NULL AND @values <> N'<literal:337>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:338>')
		    BEGIN
		    SET @query = @query + N'<literal:339>'



;
        END
		    END 
    END
	
-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:340>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:341>';  
        IF @values IS NOT NULL AND @values <> N'<literal:342>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:343>')  
      BEGIN  
      SET @query = @query + N'<literal:344>'



 ;
        END  
      END   
    END 

-- [comment omitted]

    IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:345>')      
    BEGIN      
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:346>';
        IF @values IS NOT NULL AND @values <> N'<literal:347>'      
        BEGIN       
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:348>')
		    BEGIN
		    SET @query = @query + N'<literal:349>'



;
        END
		    END 
    END
	
-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:350>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:351>';  
        IF @values IS NOT NULL AND @values <> N'<literal:352>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:353>')  
      BEGIN  
      SET @query = @query + N'<literal:354>'



 ;
        END  
      END   
    END 


-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:355>')        
    BEGIN        
        SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:356>';  
        IF @values IS NOT NULL AND @values <> N'<literal:357>'        
        BEGIN         
            IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:358>')  
      BEGIN  
      SET @query = @query + N'<literal:359>'



 ;
        END  
      END   
    END 
  	
-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:360>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:361>';  
        IF @values IS NOT NULL AND @values <> N'<literal:362>' 
		BEGIN  
			SET @query = @query + N'<literal:363>'



 ;
		END
	  END
  	
-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:364>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:365>';  
        IF @values IS NOT NULL AND @values <> N'<literal:366>' 
		BEGIN  
			SET @query = @query + N'<literal:367>'



 ;
		END
	  END

-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:368>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:369>';  
        IF @values IS NOT NULL AND @values <> N'<literal:370>' 
		BEGIN  
			SET @query = @query + N'<literal:371>'



 ;
		END
	  END

-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:372>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:373>';  
        IF @values IS NOT NULL AND @values <> N'<literal:374>' 
		BEGIN  
			SET @query = @query + N'<literal:375>'



 ;
		END
	  END

-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:376>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:377>';  
        IF @values IS NOT NULL AND @values <> N'<literal:378>' 
		BEGIN  
			SET @query = @query + N'<literal:379>'



 ;
		END
	  END
        	
-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:380>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:381>';  
        IF @values IS NOT NULL AND @values <> N'<literal:382>' 
		BEGIN  
			SET @query = @query + N'<literal:383>'



 ;
		END
	  END
-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:384>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:385>';  
        IF @values IS NOT NULL AND @values <> N'<literal:386>' 
		BEGIN  
			IF EXISTS(SELECT [FormattedValue] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:387>')
			BEGIN
			SET @query = @query + N'<literal:388>'



 ;
			END
		END
	  END

-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:389>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:390>';  
        IF @values IS NOT NULL AND @values <> N'<literal:391>' 
		BEGIN  
			SET @query = @query + N'<literal:392>'



 ;
		END
	  END

-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:393>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:394>';  
        IF @values IS NOT NULL AND @values <> N'<literal:395>' 
		BEGIN  
			SET @query = @query + N'<literal:396>'



 ;
		END
	  END
        	
-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:397>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:398>';  
        IF @values IS NOT NULL AND @values <> N'<literal:399>' 
		BEGIN  
			SET @query = @query + N'<literal:400>'



 ;
		END
	  END

-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:401>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:402>';  
        IF @values IS NOT NULL AND @values <> N'<literal:403>' 
		BEGIN  
			SET @query = @query + N'<literal:404>'



 ;
		END
	  END

        	
-- [comment omitted]
      IF EXISTS (SELECT [FormattedKey] FROM #configsKeyValData WHERE [FormattedKey] = N'<literal:405>')        
	  BEGIN        
		SELECT @values = FormattedValue FROM #configsKeyValData WHERE FormattedKey = N'<literal:406>';  
        IF @values IS NOT NULL AND @values <> N'<literal:407>' 
		BEGIN  
			SET @query = @query + N'<literal:408>'



 ;
		END
	  END

-- [comment omitted]
    IF @query IS NOT NULL AND @query <> N'<literal:409>'      
 -- [comment omitted]
  BEGIN      
  IF LEFT(@query, 6) = N'<literal:410>'      
   BEGIN      
      SET @query = SUBSTRING(@query, 7, LEN(@query) - 6);  -- [comment omitted]
  END      
        EXEC sp_executesql @query;      
    END      
      
    DROP TABLE #configsKeyValData;      
END 
