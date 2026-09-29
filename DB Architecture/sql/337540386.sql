-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















/* [comment omitted] */

























CREATE   PROCEDURE [dbo].[ArchivePurgeRunbook] AS  
BEGIN
SET NOCOUNT ON;
/* [comment omitted] */
DECLARE @ARtableName nvarchar(250); /* [comment omitted] */
DECLARE @ARHistTableName NVARCHAR(250); /* [comment omitted] */
DECLARE @stArchiveID NVARCHAR(25);
DECLARE @FilterArchiveID NVARCHAR(25);
DECLARE @DaysHist NUMERIC(9,0) = 90;
DECLARE @NewArchivePrefTables TABLE (TABLE_NAME NVARCHAR(250))
INSERT INTO @NewArchivePrefTables
VALUES (N'<literal:1>'),
        (N'<literal:2>'),
        (N'<literal:3>'),
        (N'<literal:4>'); /* [comment omitted] */
DECLARE @ArchiveFilterTables TABLE (ARCHIVE_NAME NVARCHAR(50))
INSERT INTO @ArchiveFilterTables
VALUES (N'<literal:5>'),
        (N'<literal:6>'),
        (N'<literal:7>'); /* [comment omitted] */
DECLARE @TABLEDONAME NVARCHAR(50);
DECLARE @DOPATH NVARCHAR(500); /* [comment omitted] */
DECLARE @DataStorageType NVARCHAR(25) = N'<literal:8>'; /* [comment omitted] */
DECLARE @Active NVARCHAR(25) = N'<literal:9>';
DECLARE @AR_Active NVARCHAR(25) = N'<literal:10>'; /* [comment omitted] */
DECLARE @SaveData NVARCHAR(25) = N'<literal:11>';
DECLARE @stArchiveProcess NVARCHAR(25);
DECLARE @FilterStatement NVARCHAR(MAX);
DECLARE @IDENTIFIER NVARCHAR(50);
DECLARE @SYSTEMCREATED NVARCHAR(25);
DECLARE @USER6VALUE NVARCHAR(250);
DECLARE @sequence NUMERIC(5,0); 
DECLARE @attribute NVARCHAR(100);
DECLARE @literalvalue NVARCHAR(200);
DECLARE @operand NVARCHAR(15);
DECLARE @NonProdServerList TABLE (DB_SERVER NVARCHAR(250)) 
INSERT INTO @NonProdServerList
VALUES (N'<literal:12>'),
        (N'<literal:13>'),
        (N'<literal:14>'),
        (N'<literal:15>');
SET @stArchiveProcess = (SELECT TOP 1 IDENTIFIER FROM DYNAMIC_CALLING_DETAIL WHERE RECORD_TYPE='<literal:16>' AND DESCRIPTION='<literal:17>');
SET @sequence = 100;
/* [comment omitted] */
UPDATE ARCHIVE_PREFERENCES
SET SYSTEM_CREATED = N'<literal:18>'
WHERE SYSTEM_CREATED = N'<literal:19>'
	AND (CASE WHEN PROCESS_STAMP LIKE N'<literal:20>' THEN SUBSTRING(PROCESS_STAMP, 9, 1) ELSE NULL END NOT LIKE '<literal:21>'
		OR PROCESS_STAMP IS NULL
		OR PROCESS_STAMP NOT LIKE N'<literal:22>')
	AND ARCHIVE_ID NOT IN (
	'<literal:23>','<literal:24>','<literal:25>','<literal:26>','<literal:27>','<literal:28>','<literal:29>','<literal:30>','<literal:31>','<literal:32>',
	'<literal:33>','<literal:34>','<literal:35>','<literal:36>','<literal:37>','<literal:38>','<literal:39>','<literal:40>','<literal:41>',
	'<literal:42>','<literal:43>','<literal:44>','<literal:45>','<literal:46>','<literal:47>','<literal:48>','<literal:49>','<literal:50>','<literal:51>',
	'<literal:52>','<literal:53>','<literal:54>','<literal:55>','<literal:56>','<literal:57>','<literal:58>','<literal:59>','<literal:60>','<literal:61>',
	'<literal:62>','<literal:63>','<literal:64>','<literal:65>','<literal:66>','<literal:67>','<literal:68>','<literal:69>','<literal:70>','<literal:71>','<literal:72>',
	'<literal:73>',
	'<literal:74>',
	'<literal:75>');
/* [comment omitted] */
UPDATE GENERIC_CONFIG_DETAIL
SET SYSTEM_CREATED = N'<literal:76>'
WHERE RECORD_TYPE='<literal:77>'
AND SYSTEM_CREATED = N'<literal:78>'
    AND (CASE WHEN PROCESS_STAMP LIKE N'<literal:79>' THEN SUBSTRING(PROCESS_STAMP, 9, 1) ELSE NULL END NOT LIKE '<literal:80>'
        OR PROCESS_STAMP IS NULL
        OR PROCESS_STAMP NOT LIKE N'<literal:81>')
    AND IDENTIFIER NOT IN (
    '<literal:82>','<literal:83>','<literal:84>','<literal:85>','<literal:86>','<literal:87>','<literal:88>','<literal:89>',
    '<literal:90>','<literal:91>','<literal:92>','<literal:93>','<literal:94>','<literal:95>','<literal:96>','<literal:97>','<literal:98>','<literal:99>','<literal:100>',
    '<literal:101>','<literal:102>','<literal:103>','<literal:104>','<literal:105>','<literal:106>','<literal:107>','<literal:108>','<literal:109>','<literal:110>',
    '<literal:111>','<literal:112>','<literal:113>','<literal:114>','<literal:115>','<literal:116>','<literal:117>','<literal:118>','<literal:119>','<literal:120>','<literal:121>',
    '<literal:122>','<literal:123>','<literal:124>','<literal:125>','<literal:126>','<literal:127>','<literal:128>','<literal:129>','<literal:130>','<literal:131>','<literal:132>',
    '<literal:133>','<literal:134>','<literal:135>','<literal:136>','<literal:137>','<literal:138>','<literal:139>','<literal:140>','<literal:141>','<literal:142>','<literal:143>',
    '<literal:144>','<literal:145>','<literal:146>','<literal:147>','<literal:148>',
    '<literal:149>',
    '<literal:150>');
/* [comment omitted] */
UPDATE GENERIC_CONFIG_DETAIL
SET SYSTEM_CREATED = N'<literal:151>'
WHERE RECORD_TYPE='<literal:152>'
AND SYSTEM_CREATED = N'<literal:153>'
    AND (CASE WHEN PROCESS_STAMP LIKE N'<literal:154>' THEN SUBSTRING(PROCESS_STAMP, 9, 1) ELSE NULL END NOT LIKE '<literal:155>'
        OR PROCESS_STAMP IS NULL
        OR PROCESS_STAMP NOT LIKE N'<literal:156>')
    AND IDENTIFIER NOT IN (
    '<literal:157>','<literal:158>','<literal:159>','<literal:160>','<literal:161>','<literal:162>','<literal:163>','<literal:164>','<literal:165>','<literal:166>','<literal:167>','<literal:168>',
    '<literal:169>','<literal:170>','<literal:171>','<literal:172>','<literal:173>','<literal:174>','<literal:175>','<literal:176>','<literal:177>','<literal:178>','<literal:179>','<literal:180>',
    '<literal:181>','<literal:182>','<literal:183>','<literal:184>','<literal:185>','<literal:186>','<literal:187>','<literal:188>','<literal:189>','<literal:190>','<literal:191>',
    '<literal:192>','<literal:193>','<literal:194>','<literal:195>','<literal:196>','<literal:197>','<literal:198>','<literal:199>','<literal:200>','<literal:201>','<literal:202>',
    '<literal:203>','<literal:204>','<literal:205>',
    '<literal:206>',
    '<literal:207>',
    '<literal:208>',
    '<literal:209>');
DECLARE @CustomArchivePreferences TABLE (ARCHIVE_NAME NVARCHAR(50)) /* [comment omitted] */
INSERT INTO @CustomArchivePreferences (ARCHIVE_NAME)
(SELECT ARCHIVE_NAME
FROM ARCHIVE_PREFERENCES
WHERE (SYSTEM_CREATED = N'<literal:210>' AND (USER_DEF2 IS NULL OR USER_DEF2 != N'<literal:211>'))
OR LEFT(ARCHIVE_NAME, 4) LIKE UPPER(LEFT(DB_NAME(), 4))); /* [comment omitted] */
DECLARE @ProcessHistoryTypesToSave TABLE (IDENTIFIER NVARCHAR(50))
INSERT INTO @ProcessHistoryTypesToSave
VALUES (N'<literal:212>'), /* [comment omitted] */
    (N'<literal:213>'), /* [comment omitted] */
    (N'<literal:214>'); /* [comment omitted] */
DECLARE @TransactionHistoryTypesToPurge TABLE (IDENTIFIER NVARCHAR(50))
INSERT INTO @TransactionHistoryTypesToPurge
VALUES (N'<literal:215>'), /* [comment omitted] */
    (N'<literal:216>'), /* [comment omitted] */
    (N'<literal:217>'), /* [comment omitted] */
    (N'<literal:218>'), /* [comment omitted] */
    (N'<literal:219>'), /* [comment omitted] */
    (N'<literal:220>'), /* [comment omitted] */
    (N'<literal:221>'), /* [comment omitted] */
    (N'<literal:222>'), /* [comment omitted] */
    (N'<literal:223>'), /* [comment omitted] */
    (N'<literal:224>'), /* [comment omitted] */
    (N'<literal:225>'); /* [comment omitted] */
DECLARE @TransactionHistoryTypesNonDefault TABLE (IDENTIFIER NVARCHAR(50))
INSERT INTO @TransactionHistoryTypesNonDefault
VALUES (N'<literal:226>'), /* [comment omitted] */
    (N'<literal:227>'), /* [comment omitted] */
    (N'<literal:228>'), /* [comment omitted] */
    (N'<literal:229>'), /* [comment omitted] */
    (N'<literal:230>'), /* [comment omitted] */
    (N'<literal:231>'), /* [comment omitted] */
    (N'<literal:232>'); /* [comment omitted] */
DECLARE @ProdArchiveUD5NTables TABLE (ARCHIVE_NAME NVARCHAR(50)) 
INSERT INTO @ProdArchiveUD5NTables
VALUES (N'<literal:233>'),
        (N'<literal:234>'),
        (N'<literal:235>'); /* [comment omitted] */
DECLARE @NonProdArchiveUD5NTables TABLE (ARCHIVE_NAME NVARCHAR(50)) 
INSERT INTO @NonProdArchiveUD5NTables
VALUES (N'<literal:236>'),
        (N'<literal:237>'),
        (N'<literal:238>'); /* [comment omitted] */
DECLARE @ProdArchiveUD6YTables TABLE (ARCHIVE_NAME NVARCHAR(50)) 
INSERT INTO @ProdArchiveUD6YTables
VALUES (N'<literal:239>'),
        (N'<literal:240>'),
        (N'<literal:241>'),
        (N'<literal:242>'),
        (N'<literal:243>'),
        (N'<literal:244>'),
        (N'<literal:245>'),
        (N'<literal:246>'),
        (N'<literal:247>'),
        (N'<literal:248>'),
        (N'<literal:249>'),
        (N'<literal:250>'),
        (N'<literal:251>'),
        (N'<literal:252>'),
        (N'<literal:253>'),
        (N'<literal:254>'),
        (N'<literal:255>'),
        (N'<literal:256>'); /* [comment omitted] */

DECLARE @DaysHistARTablesDefault NUMERIC(5, 0) = 372;
DECLARE @DaysHistMinimumValue NUMERIC(5, 0) = 7;
DECLARE @DaysHistPurgeValue NUMERIC(5, 0) = 30;
DECLARE @DaysHistDefaultValue NUMERIC(5, 0) = 90;
DECLARE @DaysHistMaximumValue NUMERIC(5, 0) = 180;
DECLARE @DaysHistArchivePreferencesMinimum TABLE (ARCHIVE_NAME NVARCHAR(50)) 
INSERT INTO @DaysHistArchivePreferencesMinimum
VALUES (N'<literal:257>'),
        (N'<literal:258>'),
        (N'<literal:259>'),
        (N'<literal:260>'),
        (N'<literal:261>'),
        (N'<literal:262>'),
        (N'<literal:263>'),
        (N'<literal:264>'),
        (N'<literal:265>'),
        (N'<literal:266>'),
        (N'<literal:267>'),
        (N'<literal:268>'),
        (N'<literal:269>'),
        (N'<literal:270>'),
        (N'<literal:271>'),
        (N'<literal:272>'),
        (N'<literal:273>'),
        (N'<literal:274>'),
        (N'<literal:275>'),
        (N'<literal:276>'),
        (N'<literal:277>'),
        (N'<literal:278>'),
        (N'<literal:279>'),
        (N'<literal:280>'); /* [comment omitted] */
DECLARE @DaysHistArchivePreferencesMaximum TABLE (ARCHIVE_NAME NVARCHAR(50)) 
INSERT INTO @DaysHistArchivePreferencesMaximum
VALUES (N'<literal:281>'),
        (N'<literal:282>'),
        (N'<literal:283>'); /* [comment omitted] */
DECLARE @tableName NVARCHAR(250);
DECLARE @truncateSQL NVARCHAR(MAX);
DECLARE @HistType NVARCHAR(50);
DECLARE @DeleteLoopLimit NUMERIC(5, 0) = 10;
DECLARE @DeleteBatchSize NUMERIC(9, 0) = 500000;


/* [comment omitted] */








/* [comment omitted] */
UPDATE ARCHIVE_PREFERENCES
SET USER_DEF1 = CASE WHEN (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
                OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:284>') AND USER_DEF1 IS NOT NULL THEN NULL ELSE USER_DEF1 END,
USER_DEF2 = CASE WHEN (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
                OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:285>') AND USER_DEF2 IS NOT NULL AND USER_DEF2 != N'<literal:286>' THEN NULL ELSE USER_DEF2 END,
USER_DEF3 = CASE WHEN USER_DEF3 IS NOT NULL AND USER_DEF3 != N'<literal:287>' THEN NULL ELSE USER_DEF3 END,
USER_DEF4 = CASE WHEN USER_DEF4 IS NOT NULL AND USER_DEF4 != N'<literal:288>' THEN NULL ELSE USER_DEF4 END,
USER_DEF5 = CASE WHEN (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
                OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:289>') AND USER_DEF5 IS NOT NULL AND USER_DEF5 NOT IN (N'<literal:290>', N'<literal:291>') THEN NULL ELSE USER_DEF5 END,
USER_DEF6 = CASE WHEN (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
                OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:292>') AND USER_DEF6 IS NOT NULL AND USER_DEF6 NOT IN (N'<literal:293>', N'<literal:294>') THEN NULL ELSE USER_DEF6 END,
USER_DEF7 = CASE WHEN (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
                OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:295>') AND USER_DEF7 IS NOT NULL 
                    AND USER_DEF7 NOT IN (
                    0, 
                    @DaysHistMinimumValue, 
                    @DaysHistPurgeValue, 
                    @DaysHistDefaultValue, 
                    @DaysHistMaximumValue) THEN NULL ELSE USER_DEF7 END;

/* [comment omitted] */
UPDATE ARCHIVE_PREFERENCES
SET ARCHIVE_PROCESS = (SELECT TOP 1 IDENTIFIER FROM DYNAMIC_CALLING_DETAIL WHERE RECORD_TYPE='<literal:296>' AND DESCRIPTION='<literal:297>')
WHERE TABLE_DO_NAME = N'<literal:298>'
AND ISNULL(ARCHIVE_PROCESS, N'<literal:299>') <> ISNULL((SELECT TOP 1 IDENTIFIER FROM DYNAMIC_CALLING_DETAIL WHERE RECORD_TYPE='<literal:300>' AND DESCRIPTION='<literal:301>'), N'<literal:302>');

/* [comment omitted] */
SET @stArchiveID = (SELECT ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE ARCHIVE_NAME = N'<literal:303>');
  
/* [comment omitted] */  
IF EXISTS (SELECT 1 FROM FILTER_CONFIG_HEADER WHERE RECORD_TYPE = N'<literal:304>' + @stArchiveID)  
BEGIN  
    UPDATE ARCHIVE_PREFERENCES  
    SET DATA_FILTER = NULL  
    WHERE ARCHIVE_ID = @stArchiveID;  
  
    DELETE FROM FILTER_STATEMENT  
    WHERE RECORD_TYPE = N'<literal:305>' + @stArchiveID;  
  
    DELETE FROM FILTER_CONFIG_DETAIL  
    WHERE RECORD_TYPE = N'<literal:306>' + @stArchiveID;  
  
    DELETE FROM FILTER_CONFIG_HEADER  
    WHERE RECORD_TYPE = N'<literal:307>' + @stArchiveID; 
END

IF @stArchiveID IS NOT NULL
BEGIN
    DELETE FROM ARCHIVE_PREFERENCES
    WHERE ARCHIVE_ID = @stArchiveID;
END
 

SET @stArchiveID = (SELECT ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE ARCHIVE_NAME = N'<literal:308>'); 
  
/* [comment omitted] */  
IF EXISTS (SELECT 1 FROM FILTER_CONFIG_HEADER WHERE RECORD_TYPE = N'<literal:309>' + @stArchiveID)  
BEGIN  
    UPDATE ARCHIVE_PREFERENCES  
    SET DATA_FILTER = NULL  
    WHERE ARCHIVE_ID = @stArchiveID;  
  
    DELETE FROM FILTER_STATEMENT  
    WHERE RECORD_TYPE = N'<literal:310>' + @stArchiveID;  
  
    DELETE FROM FILTER_CONFIG_DETAIL  
    WHERE RECORD_TYPE = N'<literal:311>' + @stArchiveID;  
  
    DELETE FROM FILTER_CONFIG_HEADER  
    WHERE RECORD_TYPE = N'<literal:312>' + @stArchiveID; 
END

IF @stArchiveID IS NOT NULL
BEGIN
    DELETE FROM ARCHIVE_PREFERENCES
    WHERE ARCHIVE_ID = @stArchiveID;
END 

/* [comment omitted] */

IF (SELECT SYS_KEY FROM SYSTEM_CONFIG_DETAIL WITH(NOLOCK) 
        WHERE ISNUMERIC(CAST(SYS_KEY AS VARCHAR)) = 1 
        AND CAST(CASE WHEN SYS_KEY NOT LIKE N'<literal:313>' THEN SYS_KEY ELSE 0 END AS INT) = 5000) IS NULL
    SET @stArchiveID = 5000;
ELSE
BEGIN
    SET @stArchiveID = (SELECT TOP 1 CAST(T.SYS_KEY AS INT) + 1 AS NEXT_AVAILABLE_NUMBER
                        FROM (
                            SELECT 
                                SYS_KEY,
                                LEAD(CAST(SYS_KEY AS INT)) OVER (ORDER BY SYS_KEY) AS NEXT_NUMBER
                            FROM SYSTEM_CONFIG_DETAIL
                            WHERE ISNUMERIC(CAST(SYS_KEY AS VARCHAR)) = 1
                                AND SYS_KEY NOT LIKE N'<literal:314>'
                                AND CAST(CASE WHEN SYS_KEY NOT LIKE N'<literal:315>' THEN SYS_KEY ELSE 0 END AS INT) BETWEEN 5000 AND 9999
                        ) AS T
                        WHERE T.NEXT_NUMBER > CAST(T.SYS_KEY AS INT) + 1
                        ORDER BY T.SYS_KEY);

    IF @stArchiveID IS NULL
    BEGIN
        SET @stArchiveID = (SELECT CONVERT(NVARCHAR, MAX(
        CASE
            WHEN ISNUMERIC(CAST(SYS_KEY AS VARCHAR)) = 1
                    AND CAST(SYS_KEY AS INT) BETWEEN 5000 AND 9999
            THEN CAST(SYS_KEY AS INT)  /* [comment omitted] */
            ELSE 4999 /* [comment omitted] */
        END + 1
        ))
        FROM SYSTEM_CONFIG_DETAIL)
    END
END

IF NOT EXISTS (SELECT 1 FROM SYSTEM_CONFIG_DETAIL WHERE DESCRIPTION = N'<literal:316>')
BEGIN
    INSERT INTO [dbo].[SYSTEM_CONFIG_DETAIL]
               ([SYS_KEY]
               ,[DESCRIPTION]
               ,[SYSTEM_VALUE]
               ,[RECORD_TYPE]
               ,[LOOKUP_KEY]
               ,[SYSTEM_CREATED]
               ,[USER_DEF1]
               ,[USER_DEF2]
               ,[USER_DEF3]
               ,[USER_DEF4]
               ,[USER_DEF5]
               ,[USER_DEF6]
               ,[USER_DEF7]
               ,[USER_DEF8]
               ,[USER_STAMP]
               ,[PROCESS_STAMP]
               ,[DATE_TIME_STAMP]
               ,[VALUE_REQUIRED]
               ,[WAREHOUSE]
               ,[COMPANY])
         VALUES
               (@stArchiveID,  /* [comment omitted] */
               N'<literal:317>', /* [comment omitted] */
               N'<literal:318>',                    /* [comment omitted] */
               N'<literal:319>',            /* [comment omitted] */
               N'<literal:320>',                   /* [comment omitted] */
               N'<literal:321>',                    /* [comment omitted] */
               NULL,                    /* [comment omitted] */
               NULL,                    /* [comment omitted] */
               NULL,                    /* [comment omitted] */
               N'<literal:322>',                    /* [comment omitted] */
               NULL,                    /* [comment omitted] */
               NULL,                    /* [comment omitted] */
               0,                       /* [comment omitted] */
               0,                       /* [comment omitted] */
               N'<literal:323>',      /* [comment omitted] */
               N'<literal:324>',  /* [comment omitted] */
               GETUTCDATE(),            /* [comment omitted] */
               N'<literal:325>',                    /* [comment omitted] */
               NULL,                    /* [comment omitted] */
               NULL                     /* [comment omitted] */
               );
END
ELSE IF EXISTS (SELECT 1 FROM SYSTEM_CONFIG_DETAIL WHERE DESCRIPTION = N'<literal:326>')
BEGIN
    UPDATE SYSTEM_CONFIG_DETAIL
    SET SYS_KEY = @stArchiveID
    WHERE DESCRIPTION = N'<literal:327>';
END

/* [comment omitted] */
DECLARE cFilterDelete CURSOR FAST_FORWARD READ_ONLY FOR
SELECT ARCHIVE_ID
FROM ARCHIVE_PREFERENCES
WHERE ARCHIVE_NAME IN (
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = '<literal:328>'
 AND TABLE_NAME NOT LIKE '<literal:329>'
 AND TABLE_NAME NOT LIKE N'<literal:330>'
 AND TABLE_NAME NOT LIKE N'<literal:331>' + UPPER(LEFT(DB_NAME(), 4)) + N'<literal:332>'
    AND (TABLE_NAME LIKE '<literal:333>'
  OR TABLE_NAME IN (SELECT TABLE_NAME COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS FROM @NewArchivePrefTables))
UNION ALL
SELECT CASE 
 WHEN RECORD_TYPE = N'<literal:334>' THEN N'<literal:335>' + LEFT(GCD.IDENTIFIER, 34) 
 WHEN RECORD_TYPE = N'<literal:336>' THEN N'<literal:337>' + LEFT(GCD.IDENTIFIER, 30) END COLLATE SQL_Latin1_General_CP1_CI_AS AS TABLE_NAME
FROM GENERIC_CONFIG_DETAIL GCD WITH(NOLOCK)
WHERE RECORD_TYPE IN (N'<literal:338>', N'<literal:339>'))
AND (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
    OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:340>')
ORDER BY 1
OPEN cFilterDelete
FETCH NEXT FROM cFilterDelete INTO @stArchiveID
 
WHILE @@FETCH_STATUS = 0 
BEGIN


    /* [comment omitted] */  
    IF EXISTS (SELECT 1 FROM FILTER_CONFIG_HEADER WHERE RECORD_TYPE = N'<literal:341>' + @stArchiveID)  
    BEGIN  
        UPDATE ARCHIVE_PREFERENCES  
        SET DATA_FILTER = NULL  
        WHERE ARCHIVE_ID = @stArchiveID;  
  
        DELETE FROM FILTER_STATEMENT  
        WHERE RECORD_TYPE = N'<literal:342>' + @stArchiveID;  
  
        DELETE FROM FILTER_CONFIG_DETAIL  
        WHERE RECORD_TYPE = N'<literal:343>' + @stArchiveID;  
  
        DELETE FROM FILTER_CONFIG_HEADER  
        WHERE RECORD_TYPE = N'<literal:344>' + @stArchiveID; 
 
    END   

    DELETE FROM ARCHIVE_PREFERENCES
    WHERE ARCHIVE_ID = @stArchiveID;


    FETCH NEXT FROM cFilterDelete INTO @stArchiveID
 
END
 
CLOSE cFilterDelete
DEALLOCATE cFilterDelete

/* [comment omitted] */
UPDATE ARCHIVE_PREFERENCES
SET USER_DEF5 = CASE 
        WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList)
            AND ARCHIVE_NAME IN (SELECT ARCHIVE_NAME FROM @NonProdArchiveUD5NTables) THEN N'<literal:345>' 
        WHEN (SELECT @@SERVERNAME) NOT IN (SELECT DB_SERVER FROM @NonProdServerList)
            AND ARCHIVE_NAME IN (SELECT ARCHIVE_NAME FROM @ProdArchiveUD5NTables) THEN N'<literal:346>'
        WHEN ARCHIVE_NAME LIKE '<literal:347>' THEN @AR_Active
        ELSE N'<literal:348>' END,
    USER_STAMP = N'<literal:349>',
    PROCESS_STAMP = N'<literal:350>',
    DATE_TIME_STAMP = GETUTCDATE()
WHERE (USER_DEF5 IS NULL
    OR (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
        OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:351>'))
AND ARCHIVE_NAME NOT IN (SELECT ARCHIVE_NAME FROM @CustomArchivePreferences);

/* [comment omitted] */

UPDATE ARCHIVE_PREFERENCES
SET ACTIVE = USER_DEF5,
    RUN_BY_DEFAULT = USER_DEF5,
    USER_STAMP = N'<literal:352>',
    PROCESS_STAMP = N'<literal:353>',
    DATE_TIME_STAMP = GETUTCDATE()
WHERE (ACTIVE != USER_DEF5
    OR RUN_BY_DEFAULT != USER_DEF5)
AND (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
    OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:354>')
AND UPPER(USER_DEF5) IN (N'<literal:355>', N'<literal:356>')
AND ARCHIVE_NAME NOT IN (SELECT ARCHIVE_NAME FROM @CustomArchivePreferences);

/* [comment omitted] */

UPDATE ARCHIVE_PREFERENCES
SET USER_DEF6 = CASE WHEN (SELECT @@SERVERNAME) NOT IN (SELECT DB_SERVER FROM @NonProdServerList)
            AND ARCHIVE_NAME IN (SELECT ARCHIVE_NAME FROM @ProdArchiveUD6YTables) THEN N'<literal:357>' 
        ELSE N'<literal:358>' END,
    USER_STAMP = N'<literal:359>',
    PROCESS_STAMP = N'<literal:360>',
    DATE_TIME_STAMP = GETUTCDATE()
WHERE (USER_DEF6 IS NULL
    OR (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
        OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:361>'))
AND ARCHIVE_NAME NOT LIKE N'<literal:362>'
AND ARCHIVE_NAME NOT LIKE N'<literal:363>'
AND ARCHIVE_NAME NOT IN (SELECT ARCHIVE_NAME FROM @CustomArchivePreferences);

/* [comment omitted] */

UPDATE ARCHIVE_PREFERENCES
SET SAVE_DATA = USER_DEF6,
    USER_STAMP = N'<literal:364>',
    PROCESS_STAMP = N'<literal:365>',
    DATE_TIME_STAMP = GETUTCDATE()
WHERE SAVE_DATA != USER_DEF6 
AND (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
    OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:366>')
AND UPPER(USER_DEF6) IN (N'<literal:367>', N'<literal:368>')
AND ARCHIVE_NAME NOT IN (SELECT ARCHIVE_NAME FROM @CustomArchivePreferences);

/* [comment omitted] */
UPDATE ARCHIVE_PREFERENCES
SET USER_DEF7 = @DaysHistMinimumValue
WHERE ARCHIVE_NAME IN (SELECT ARCHIVE_NAME FROM @DaysHistArchivePreferencesMinimum)
AND (ISNULL(USER_DEF7, 0) = 0
    OR (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
        OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:369>'))
AND ARCHIVE_NAME NOT IN (SELECT ARCHIVE_NAME FROM @CustomArchivePreferences);

/* [comment omitted] */
UPDATE ARCHIVE_PREFERENCES
SET USER_DEF7 = CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList)
    THEN @DaysHistDefaultValue
    ELSE @DaysHistMaximumValue
    END
WHERE ARCHIVE_NAME IN (SELECT ARCHIVE_NAME FROM @DaysHistArchivePreferencesMaximum)
AND (ISNULL(USER_DEF7, 0) = 0
    OR (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
        OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:370>'))
AND ARCHIVE_NAME NOT IN (SELECT ARCHIVE_NAME FROM @CustomArchivePreferences);

/* [comment omitted] */
UPDATE ARCHIVE_PREFERENCES
SET USER_DEF7 = CASE WHEN ARCHIVE_NAME IN (SELECT ARCHIVE_NAME FROM @DaysHistArchivePreferencesMinimum)
    THEN @DaysHistMinimumValue
    WHEN RIGHT(ARCHIVE_NAME, LEN(ARCHIVE_NAME) - CHARINDEX(N'<literal:371>', ARCHIVE_NAME, 14)) IN (SELECT IDENTIFIER FROM @ProcessHistoryTypesToSave)
    THEN @DaysHistDefaultValue
    ELSE @DaysHistPurgeValue
    END
WHERE ARCHIVE_NAME LIKE N'<literal:372>'
AND (ISNULL(USER_DEF7, 0) = 0
    OR (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
        OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:373>'));

/* [comment omitted] */
UPDATE ARCHIVE_PREFERENCES
SET USER_DEF7 = CASE WHEN ARCHIVE_NAME IN (SELECT ARCHIVE_NAME FROM @DaysHistArchivePreferencesMinimum)
    THEN @DaysHistMinimumValue
    WHEN RIGHT(ARCHIVE_NAME, LEN(ARCHIVE_NAME) - CHARINDEX(N'<literal:374>', ARCHIVE_NAME, 14)) IN (SELECT IDENTIFIER FROM @TransactionHistoryTypesToPurge)
        OR RIGHT(ARCHIVE_NAME, LEN(ARCHIVE_NAME) - CHARINDEX(N'<literal:375>', ARCHIVE_NAME, 14)) IN (SELECT IDENTIFIER FROM @TransactionHistoryTypesNonDefault)
    THEN @DaysHistPurgeValue
    ELSE @DaysHistDefaultValue
    END
WHERE ARCHIVE_NAME LIKE N'<literal:376>'
AND (ISNULL(USER_DEF7, 0) = 0
    OR (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
        OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:377>'));

/* [comment omitted] */
UPDATE ARCHIVE_PREFERENCES
SET USER_DEF7 = CASE WHEN ARCHIVE_NAME IN (N'<literal:378>', N'<literal:379>')
        AND (SELECT ISNULL(USER_DEF4, N'<literal:380>') FROM ARCHIVE_PREFERENCES WITH(NOLOCK) WHERE ARCHIVE_NAME = N'<literal:381>') <> N'<literal:382>'
        AND USER_DEF4 IS NULL OR USER_DEF4 <> N'<literal:383>'
    THEN @DaysHistDefaultValue
    ELSE @DaysHistARTablesDefault
    END
WHERE ARCHIVE_NAME LIKE '<literal:384>'
AND (ISNULL(USER_DEF7, 0) = 0
    OR (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
        OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:385>'));

/* [comment omitted] */
UPDATE ARCHIVE_PREFERENCES
SET USER_DEF7 = @DaysHistDefaultValue
WHERE ISNULL(USER_DEF7, 0) = 0
AND ARCHIVE_NAME NOT IN (SELECT ARCHIVE_NAME FROM @CustomArchivePreferences);

/* [comment omitted] */

UPDATE ARCHIVE_PREFERENCES
SET DAYS_HIST = USER_DEF7,
    USER_STAMP = N'<literal:386>',
    PROCESS_STAMP = N'<literal:387>',
    DATE_TIME_STAMP = GETUTCDATE()
WHERE ISNULL(DAYS_HIST, 0) != USER_DEF7
AND (CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END IS NULL
    OR CASE WHEN (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList) THEN USER_DEF3 ELSE USER_DEF4 END <> N'<literal:388>')
AND ISNULL(USER_DEF7, 0) > 0
AND ARCHIVE_NAME NOT IN (SELECT ARCHIVE_NAME FROM @CustomArchivePreferences);

/* [comment omitted] */






DECLARE cArchiveCreate CURSOR FAST_FORWARD READ_ONLY FOR
SELECT TABLE_NAME, NULL AS IDENTIFIER, NULL AS SYSTEM_CREATED
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = '<literal:389>'
	AND TABLE_NAME NOT LIKE '<literal:390>'
	AND TABLE_NAME NOT LIKE N'<literal:391>'
	AND TABLE_NAME NOT LIKE N'<literal:392>' + UPPER(LEFT(DB_NAME(), 4)) + N'<literal:393>'
    AND (TABLE_NAME LIKE '<literal:394>'
		OR TABLE_NAME IN (SELECT TABLE_NAME COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS FROM @NewArchivePrefTables))
UNION ALL
SELECT CASE 
	WHEN RECORD_TYPE = N'<literal:395>' THEN N'<literal:396>' + LEFT(GCD.IDENTIFIER, 34) 
	WHEN RECORD_TYPE = N'<literal:397>' THEN N'<literal:398>' + LEFT(GCD.IDENTIFIER, 30) END COLLATE SQL_Latin1_General_CP1_CI_AS AS TABLE_NAME, 
	GCD.IDENTIFIER, GCD.SYSTEM_CREATED
FROM GENERIC_CONFIG_DETAIL GCD WITH(NOLOCK)
WHERE RECORD_TYPE IN (N'<literal:399>', N'<literal:400>')
ORDER BY TABLE_NAME
OPEN cArchiveCreate
FETCH NEXT FROM cArchiveCreate INTO @ARtableName, @IDENTIFIER, @SYSTEMCREATED
 
WHILE @@FETCH_STATUS = 0 
BEGIN
    /* [comment omitted] */
    SET @ARHistTableName = (SELECT LEFT(@ARtableName, CHARINDEX(N'<literal:401>', @ARtableName, 14)-1) 
        WHERE @ARtableName LIKE N'<literal:402>'
            OR @ARtableName LIKE N'<literal:403>');
    SET @DOPATH = (SELECT TOP 1 DO_PATH FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = @ARHistTableName AND @ARHistTableName IN (N'<literal:404>', N'<literal:405>'));
    /* [comment omitted] */
    SET @stArchiveID = (SELECT ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE ARCHIVE_NAME = @ARtableName);

    /* [comment omitted] */
    IF @stArchiveID IS NULL  
    BEGIN
        IF (SELECT ARCHIVE_ID FROM ARCHIVE_PREFERENCES WITH(NOLOCK) 
                WHERE ISNUMERIC(CAST(ARCHIVE_ID AS VARCHAR)) = 1 
                AND CAST(CASE WHEN ARCHIVE_ID NOT LIKE N'<literal:406>' THEN ARCHIVE_ID ELSE 0 END AS INT) = 5000) IS NULL
            SET @stArchiveID = 5000;
        ELSE
        BEGIN
            SET @stArchiveID = (SELECT TOP 1 CAST(T.ARCHIVE_ID AS INT) + 1 AS NEXT_AVAILABLE_NUMBER
                                FROM (
                                    SELECT 
                                        ARCHIVE_ID,
                                        LEAD(CAST(ARCHIVE_ID AS INT)) OVER (ORDER BY ARCHIVE_ID) AS NEXT_NUMBER
                                    FROM ARCHIVE_PREFERENCES
                                    WHERE ISNUMERIC(CAST(ARCHIVE_ID AS VARCHAR)) = 1
                                        AND ARCHIVE_ID NOT LIKE N'<literal:407>'
                                        AND CAST(CASE WHEN ARCHIVE_ID NOT LIKE N'<literal:408>' THEN ARCHIVE_ID ELSE 0 END AS INT) BETWEEN 5000 AND 9999
                                ) AS T
                                WHERE T.NEXT_NUMBER > CAST(T.ARCHIVE_ID AS INT) + 1
                                ORDER BY T.ARCHIVE_ID);

            IF @stArchiveID IS NULL
            BEGIN
                SET @stArchiveID = (SELECT CONVERT(NVARCHAR, MAX(
                CASE
                    WHEN ISNUMERIC(CAST(ARCHIVE_ID AS VARCHAR)) = 1
                            AND CAST(ARCHIVE_ID AS INT) BETWEEN 5000 AND 9999
                    THEN CAST(ARCHIVE_ID AS INT)  /* [comment omitted] */
                    ELSE 4999 /* [comment omitted] */
                END + 1
                ))
                FROM ARCHIVE_PREFERENCES)
            END
        END

        IF (@ARtableName LIKE '<literal:409>' 
			AND (EXISTS (SELECT N'<literal:410>' FROM SYSTEM_CONFIG_DETAIL 
					WHERE DESCRIPTION = N'<literal:411>' 
					AND (SYSTEM_VALUE = N'<literal:412>' 
					OR USER_DEF4 = N'<literal:413>')) /* [comment omitted] */
				OR NOT EXISTS (SELECT N'<literal:414>' FROM SYSTEM_CONFIG_DETAIL 
					WHERE DESCRIPTION = N'<literal:415>')
				OR (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList)))	
        BEGIN
            SET @DaysHist = CASE WHEN @ARtableName IN (N'<literal:416>', N'<literal:417>')
                    AND (SELECT ISNULL(USER_DEF4, N'<literal:418>') FROM ARCHIVE_PREFERENCES WITH(NOLOCK) WHERE ARCHIVE_NAME = N'<literal:419>') <> N'<literal:420>'
                THEN @DaysHistDefaultValue
                ELSE @DaysHistARTablesDefault
                END
            SET @SaveData = N'<literal:421>';
            SET @Active = @AR_Active;
            SET @DataStorageType = N'<literal:422>';
        END
        ELSE IF (@ARtableName LIKE '<literal:423>' AND 
            EXISTS (SELECT N'<literal:424>' FROM SYSTEM_CONFIG_DETAIL 
                WHERE DESCRIPTION = N'<literal:425>' 
                AND SYSTEM_VALUE = N'<literal:426>' 
                AND USER_DEF4 = N'<literal:427>')) /* [comment omitted] */
        BEGIN
            SET @DaysHist = CASE WHEN @ARtableName IN (N'<literal:428>', N'<literal:429>')
                    AND (SELECT ISNULL(USER_DEF4, N'<literal:430>') FROM ARCHIVE_PREFERENCES WITH(NOLOCK) WHERE ARCHIVE_NAME = N'<literal:431>') <> N'<literal:432>'
                THEN @DaysHistDefaultValue
                ELSE @DaysHistARTablesDefault
                END;
            SET @SaveData = N'<literal:433>';
            SET @Active = @AR_Active;
            SET @DataStorageType = N'<literal:434>';
        END
        ELSE IF @ARtableName IN (SELECT TABLE_NAME FROM @NewArchivePrefTables)
        BEGIN
            SET @DaysHist = @DaysHistMinimumValue;
            SET @SaveData = N'<literal:435>';
            SET @Active = N'<literal:436>';
            SET @DataStorageType = N'<literal:437>';
        END
        ELSE IF @ARHistTableName IN (N'<literal:438>')
        BEGIN
            SET @DaysHist = CASE WHEN @ARtableName IN (SELECT ARCHIVE_NAME FROM @DaysHistArchivePreferencesMinimum)
                            THEN @DaysHistMinimumValue
                            WHEN @IDENTIFIER IN (SELECT IDENTIFIER FROM @ProcessHistoryTypesToSave) OR @SYSTEMCREATED = N'<literal:439>'
                            THEN @DaysHistDefaultValue
                            ELSE @DaysHistPurgeValue
                            END
            SET @SaveData = CASE WHEN (@IDENTIFIER IN (SELECT IDENTIFIER FROM @ProcessHistoryTypesToSave) OR @SYSTEMCREATED = N'<literal:440>')
                                    AND (SELECT @@SERVERNAME) NOT IN (SELECT DB_SERVER FROM @NonProdServerList)
                            THEN N'<literal:441>'
                            ELSE N'<literal:442>'
                            END
            SET @Active = N'<literal:443>';
            SET @DataStorageType = N'<literal:444>';
        END
        ELSE IF @ARHistTableName IN (N'<literal:445>')
        BEGIN
            SET @DaysHist = CASE WHEN @ARtableName IN (SELECT ARCHIVE_NAME FROM @DaysHistArchivePreferencesMinimum)
                            THEN @DaysHistMinimumValue
                            WHEN @IDENTIFIER IN (SELECT IDENTIFIER FROM @TransactionHistoryTypesToPurge)
                                OR @IDENTIFIER IN (SELECT IDENTIFIER FROM @TransactionHistoryTypesNonDefault)
                            THEN @DaysHistPurgeValue
                            ELSE @DaysHistDefaultValue
                            END
            SET @SaveData = CASE WHEN @IDENTIFIER IN (SELECT IDENTIFIER FROM @TransactionHistoryTypesToPurge)
                                    OR (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList)
                            THEN N'<literal:446>'
                            ELSE N'<literal:447>'
                            END
            SET @Active = N'<literal:448>';
            SET @DataStorageType = N'<literal:449>';
        END

        INSERT INTO [ARCHIVE_PREFERENCES]
            ([ARCHIVE_ID]
            ,[ARCHIVE_NAME]
            ,[ARCHIVE_PROCESS]
            ,[TABLE_DO_NAME]
            ,[DO_PATH]
            ,[DAYS_HIST]
            ,[DATA_FILTER]
            ,[SAVE_DATA]
            ,[RUN_BY_DEFAULT]
            ,[LAST_ARCH_DATE_TIME]
            ,[SYSTEM_CREATED]
            ,[ACTIVE]
            ,[USER_DEF1]
            ,[USER_DEF2]
            ,[USER_DEF3]
            ,[USER_DEF4]
            ,[USER_DEF5]
            ,[USER_DEF6]
            ,[USER_DEF7]
            ,[USER_DEF8]
            ,[USER_STAMP]
            ,[PROCESS_STAMP]
            ,[DATE_TIME_STAMP]
            ,[DATA_STORAGE_TYPE])
        VALUES 
            (@stArchiveID, /* [comment omitted] */
            @ARtableName, /* [comment omitted] */
            CASE WHEN @ARHistTableName IS NOT NULL AND @ARHistTableName = N'<literal:450>' THEN 
                (SELECT TOP 1 IDENTIFIER FROM DYNAMIC_CALLING_DETAIL WHERE RECORD_TYPE='<literal:451>' AND DESCRIPTION='<literal:452>')
                ELSE @stArchiveProcess END, /* [comment omitted] */
            CASE WHEN @ARHistTableName IS NOT NULL THEN @ARHistTableName ELSE @ARtableName END, /* [comment omitted] */
            @DOPATH, /* [comment omitted] */
            @DaysHist, /* [comment omitted] */
            NULL, /* [comment omitted] */
            @SaveData, /* [comment omitted] */
            @Active, /* [comment omitted] */
            NULL, /* [comment omitted] */
            N'<literal:453>', /* [comment omitted] */
            @Active, /* [comment omitted] */
            CASE 
	            WHEN @ARtableName = N'<literal:454>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:455>')
	            WHEN @ARtableName = N'<literal:456>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:457>')
	            WHEN @ARtableName = N'<literal:458>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:459>')
	            WHEN @ARtableName = N'<literal:460>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:461>')
	            WHEN @ARtableName = N'<literal:462>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:463>')
	            WHEN @ARtableName = N'<literal:464>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:465>')
	            WHEN @ARtableName = N'<literal:466>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:467>')
	            WHEN @ARtableName = N'<literal:468>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:469>')
	            WHEN @ARtableName = N'<literal:470>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:471>')
	            WHEN @ARtableName = N'<literal:472>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:473>')
	            WHEN @ARtableName = N'<literal:474>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:475>')
	            WHEN @ARtableName = N'<literal:476>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:477>')
	            WHEN @ARtableName = N'<literal:478>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:479>')
	            WHEN @ARtableName = N'<literal:480>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:481>')
                WHEN @ARtableName = N'<literal:482>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:483>')
                WHEN @ARtableName = N'<literal:484>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:485>')
	            WHEN @ARtableName = N'<literal:486>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:487>')
                WHEN @ARtableName = N'<literal:488>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:489>')
	            WHEN @ARtableName = N'<literal:490>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:491>')
                WHEN @ARtableName = N'<literal:492>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:493>')
	            WHEN @ARtableName = N'<literal:494>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:495>')
                WHEN @ARtableName = N'<literal:496>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:497>')
	            WHEN @ARtableName = N'<literal:498>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:499>')
	            WHEN @ARtableName = N'<literal:500>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:501>')
	            WHEN @ARtableName = N'<literal:502>' THEN (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = N'<literal:503>')
                ELSE (SELECT TOP 1 ARCHIVE_ID FROM ARCHIVE_PREFERENCES WHERE TABLE_DO_NAME = REPLACE(@ARtableName, N'<literal:504>', N'<literal:505>') 
                        AND REPLACE(@ARtableName, N'<literal:506>', N'<literal:507>') NOT IN (N'<literal:508>', N'<literal:509>'))
            END, /* [comment omitted] */
            N'<literal:510>', /* [comment omitted] */
            NULL, /* [comment omitted] */
            NULL, /* [comment omitted] */
            CASE WHEN @ARtableName LIKE '<literal:511>' THEN @AR_Active ELSE NULL END, /* [comment omitted] */
            @SaveData, /* [comment omitted] */
            @DaysHist, /* [comment omitted] */
            0, /* [comment omitted] */
            N'<literal:512>', /* [comment omitted] */
            N'<literal:513>', /* [comment omitted] */
            GETUTCDATE(), /* [comment omitted] */
            @DataStorageType /* [comment omitted] */
            )
    END
    FETCH NEXT FROM cArchiveCreate INTO @ARtableName, @IDENTIFIER, @SYSTEMCREATED
 
END
 
CLOSE cArchiveCreate
DEALLOCATE cArchiveCreate

/* [comment omitted] */
DECLARE cFilterCreate CURSOR FAST_FORWARD READ_ONLY FOR
SELECT ARCHIVE_ID, LEFT(ARCHIVE_NAME, 25), TABLE_DO_NAME, DO_PATH, CASE WHEN GCDP.IDENTIFIER IS NULL THEN GCDT.IDENTIFIER ELSE GCDP.IDENTIFIER END AS IDENTIFIER
FROM ARCHIVE_PREFERENCES AP WITH(NOLOCK)
LEFT OUTER JOIN GENERIC_CONFIG_DETAIL GCDP WITH(NOLOCK)
ON GCDP.RECORD_TYPE = N'<literal:514>'
AND LEFT(GCDP.IDENTIFIER, 34) = LEFT(REPLACE(AP.ARCHIVE_NAME, N'<literal:515>', N'<literal:516>'), 34)
LEFT OUTER JOIN GENERIC_CONFIG_DETAIL GCDT WITH(NOLOCK)
ON GCDT.RECORD_TYPE = N'<literal:517>'
AND LEFT(GCDT.IDENTIFIER, 30) = LEFT(REPLACE(AP.ARCHIVE_NAME, N'<literal:518>', N'<literal:519>'), 30)
WHERE ARCHIVE_NAME IN (SELECT ARCHIVE_NAME FROM @ArchiveFilterTables)
	OR (ARCHIVE_NAME LIKE N'<literal:520>'
		OR ARCHIVE_NAME LIKE N'<literal:521>')
ORDER BY ARCHIVE_NAME
OPEN cFilterCreate
FETCH NEXT FROM cFilterCreate INTO @stArchiveID, @ARtableName, @TABLEDONAME, @DOPATH, @IDENTIFIER
 
WHILE @@FETCH_STATUS = 0 
BEGIN

    SET @FilterArchiveID = N'<literal:522>' + @stArchiveID;
    SET @FilterStatement = NULL;
    SET @attribute = NULL;
    SET @operand = NULL;
    SET @literalvalue = NULL;
  
    /* [comment omitted] */
    IF EXISTS (SELECT N'<literal:523>' FROM FILTER_CONFIG_HEADER WHERE RECORD_TYPE = @FilterArchiveID)  
    BEGIN  
        UPDATE ARCHIVE_PREFERENCES  
        SET DATA_FILTER = NULL  
        WHERE ARCHIVE_ID = @stArchiveID;  
  
        DELETE FROM FILTER_STATEMENT  
        WHERE RECORD_TYPE = @FilterArchiveID;  
  
        DELETE FROM FILTER_CONFIG_DETAIL  
        WHERE RECORD_TYPE = @FilterArchiveID;  
  
        DELETE FROM FILTER_CONFIG_HEADER  
        WHERE RECORD_TYPE = @FilterArchiveID;  
    END  
  
    /* [comment omitted] */ 
    IF NOT EXISTS (SELECT N'<literal:524>' FROM FILTER_CONFIG_HEADER WHERE RECORD_TYPE = @FilterArchiveID)   
    BEGIN 
        /* [comment omitted] */
        IF @TABLEDONAME IN (N'<literal:525>', N'<literal:526>')
        BEGIN
            SET @FilterStatement = N'<literal:527>' + @TABLEDONAME + N'<literal:528>';
            SET @attribute = N'<literal:529>';
            SET @operand = N'<literal:530>';
            SET @literalvalue = N'<literal:531>';
        END
        ELSE IF @TABLEDONAME IN (N'<literal:532>')
        BEGIN
            SET @FilterStatement = N'<literal:533>' + @TABLEDONAME + N'<literal:534>';
            SET @attribute = N'<literal:535>';
            SET @operand = N'<literal:536>';
            SET @literalvalue = N'<literal:537>';
        END
        ELSE IF @TABLEDONAME IN (N'<literal:538>')
        BEGIN
            SET @FilterStatement = N'<literal:539>' + @TABLEDONAME + N'<literal:540>' + @IDENTIFIER + N'<literal:541>';
            SET @attribute = N'<literal:542>';
            SET @operand = N'<literal:543>';
            SET @literalvalue = N'<literal:544>' + @IDENTIFIER + N'<literal:545>';
        END
        ELSE IF @TABLEDONAME IN (N'<literal:546>')
        BEGIN
            SET @FilterStatement = N'<literal:547>' + @TABLEDONAME + N'<literal:548>' + @IDENTIFIER + N'<literal:549>';
            SET @attribute = N'<literal:550>';
            SET @operand = N'<literal:551>';
            SET @literalvalue = N'<literal:552>' + @IDENTIFIER + N'<literal:553>';
        END

        /* [comment omitted] */
        INSERT INTO FILTER_CONFIG_HEADER(RECORD_TYPE,DESCRIPTION,TABLE_DO_NAME,SYSTEM_CREATED,ALLOW_ORDER_BY,USER_DEF7,USER_DEF8,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,DO_PATH,JOIN_CLAUSE,ALLOW_MATCHES)  
        VALUES(@FilterArchiveID,@ARtableName,@TABLEDONAME,N'<literal:554>',N'<literal:555>',0,0,N'<literal:556>',N'<literal:557>',GETUTCDATE(),@DOPATH,NULL,N'<literal:558>'); 
		  
        INSERT INTO FILTER_CONFIG_DETAIL(RECORD_TYPE,FILTER_NAME,DESCRIPTION,FILTER_STATEMENT,SYSTEM_CREATED,ACTIVE,USER_DEF7,USER_DEF8,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP)  
        VALUES(@FilterArchiveID,@FilterArchiveID,@ARtableName,@FilterStatement,N'<literal:559>',N'<literal:560>',0,0,N'<literal:561>',N'<literal:562>',GETUTCDATE());  
   
        INSERT INTO FILTER_STATEMENT(RECORD_TYPE,FILTER_NAME,SEQUENCE,ATTRIBUTE,OPERAND,LITERAL_VALUE,AND_OR,USER_DEF7,USER_DEF8,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,LEFT_PAREN,RIGHT_PAREN)  
        VALUES (@FilterArchiveID,@FilterArchiveID,@sequence,@attribute,@operand,@literalvalue,NULL,0,0,N'<literal:563>',N'<literal:564>',GETUTCDATE(),0,0);

        /* [comment omitted] */
        UPDATE ARCHIVE_PREFERENCES  
        SET DATA_FILTER = @FilterArchiveID 
        WHERE ARCHIVE_ID = @stArchiveID;    
    END 

    FETCH NEXT FROM cFilterCreate INTO @stArchiveID, @ARtableName, @TABLEDONAME, @DOPATH, @IDENTIFIER
 
END
 
CLOSE cFilterCreate
DEALLOCATE cFilterCreate

SET NOCOUNT OFF;
IF @DeleteLoopLimit > 0 /* [comment omitted] */
BEGIN
/* [comment omitted] */


DECLARE cArchiveTruncate CURSOR FAST_FORWARD READ_ONLY FOR
SELECT APCHILD.TABLE_DO_NAME
FROM ARCHIVE_PREFERENCES APCHILD WITH(NOLOCK)
INNER JOIN ARCHIVE_PREFERENCES APPARENT WITH(NOLOCK)
ON APCHILD.USER_DEF1 = APPARENT.ARCHIVE_ID
WHERE APCHILD.USER_DEF1 IS NOT NULL 
    AND APPARENT.SAVE_DATA = N'<literal:565>' 
    AND APPARENT.ACTIVE = N'<literal:566>'
    AND APPARENT.RUN_BY_DEFAULT = N'<literal:567>'
    AND APCHILD.TABLE_DO_NAME LIKE N'<literal:568>'
    AND EXISTS (SELECT N'<literal:569>'
                FROM 
                    SYS.TABLES T
                INNER JOIN      
                    SYS.INDEXES I ON T.OBJECT_ID = I.OBJECT_ID
                INNER JOIN 
                    SYS.PARTITIONS P ON I.OBJECT_ID = P.OBJECT_ID AND I.INDEX_ID = P.INDEX_ID
                WHERE 
                    T.NAME NOT LIKE '<literal:570>' 
                    AND T.IS_MS_SHIPPED = 0
                    AND I.OBJECT_ID > 255
                    AND T.NAME = APCHILD.TABLE_DO_NAME COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS
                    AND P.ROWS > 0
                GROUP BY T.NAME, P.ROWS)
UNION ALL
SELECT TOP 1 CASE 
	WHEN NOT EXISTS (SELECT N'<literal:571>' FROM ARCHIVE_PREFERENCES WITH(NOLOCK) WHERE ARCHIVE_NAME LIKE N'<literal:572>' AND SAVE_DATA = N'<literal:573>') 
	THEN N'<literal:574>' 
	ELSE NULL END
FROM ARCHIVE_PREFERENCES AP WITH(NOLOCK)
WHERE ARCHIVE_NAME LIKE N'<literal:575>'
    AND EXISTS (SELECT N'<literal:576>'
                FROM 
                    SYS.TABLES T
                INNER JOIN      
                    SYS.INDEXES I ON T.OBJECT_ID = I.OBJECT_ID
                INNER JOIN 
                    SYS.PARTITIONS P ON I.OBJECT_ID = P.OBJECT_ID AND I.INDEX_ID = P.INDEX_ID
                WHERE 
                    T.NAME NOT LIKE '<literal:577>' 
                    AND T.IS_MS_SHIPPED = 0
                    AND I.OBJECT_ID > 255
                    AND T.NAME = N'<literal:578>' 
                    AND P.ROWS > 0
                GROUP BY T.NAME, P.ROWS)
UNION ALL
SELECT TOP 1 CASE 
	WHEN NOT EXISTS (SELECT N'<literal:579>' FROM ARCHIVE_PREFERENCES WITH(NOLOCK) WHERE ARCHIVE_NAME LIKE N'<literal:580>' AND SAVE_DATA = N'<literal:581>') 
	THEN N'<literal:582>' 
	ELSE NULL END
FROM ARCHIVE_PREFERENCES AP WITH(NOLOCK)
WHERE ARCHIVE_NAME LIKE N'<literal:583>'
    AND EXISTS (SELECT N'<literal:584>'
                FROM 
                    SYS.TABLES T
                INNER JOIN      
                    SYS.INDEXES I ON T.OBJECT_ID = I.OBJECT_ID
                INNER JOIN 
                    SYS.PARTITIONS P ON I.OBJECT_ID = P.OBJECT_ID AND I.INDEX_ID = P.INDEX_ID
                WHERE 
                    T.NAME NOT LIKE '<literal:585>' 
                    AND T.IS_MS_SHIPPED = 0
                    AND I.OBJECT_ID > 255
                    AND T.NAME = N'<literal:586>' 
                    AND P.ROWS > 0
                GROUP BY T.NAME, P.ROWS)
ORDER BY 1
 
OPEN cArchiveTruncate
FETCH NEXT FROM cArchiveTruncate INTO @tableName
 
WHILE @@FETCH_STATUS = 0 
BEGIN
    /* [comment omitted] */
    IF (@tableName IS NOT NULL)
    BEGIN 
        SET @truncateSQL = '<literal:587>' + QUOTENAME(@tableName);
        EXEC sp_executesql @truncateSQL;
    END

	FETCH NEXT FROM cArchiveTruncate INTO @tableName
END
 
CLOSE cArchiveTruncate
DEALLOCATE cArchiveTruncate

/* [comment omitted] */


DECLARE cArchiveDelete CURSOR FAST_FORWARD READ_ONLY FOR
SELECT TABLE_DO_NAME, DAYS_HIST
FROM ARCHIVE_PREFERENCES AP WITH(NOLOCK)
WHERE ARCHIVE_NAME LIKE '<literal:588>'
AND SAVE_DATA = N'<literal:589>'
AND ACTIVE = N'<literal:590>'
AND RUN_BY_DEFAULT = N'<literal:591>'
AND EXISTS (SELECT N'<literal:592>'
        FROM 
            SYS.TABLES T
        INNER JOIN      
            SYS.INDEXES I ON T.OBJECT_ID = I.OBJECT_ID
        INNER JOIN 
            SYS.PARTITIONS P ON I.OBJECT_ID = P.OBJECT_ID AND I.INDEX_ID = P.INDEX_ID
        WHERE 
            T.NAME NOT LIKE '<literal:593>' 
            AND T.IS_MS_SHIPPED = 0
            AND I.OBJECT_ID > 255
            AND T.NAME = AP.TABLE_DO_NAME COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS
            AND P.ROWS > 0
        GROUP BY T.NAME, P.ROWS)
ORDER BY TABLE_DO_NAME
 
OPEN cArchiveDelete
FETCH NEXT FROM cArchiveDelete INTO @tableName, @DaysHist
 
WHILE @@FETCH_STATUS = 0 
BEGIN
    /* [comment omitted] */
    IF (@tableName IS NOT NULL AND @DaysHist > 0)
    BEGIN 
        SET @truncateSQL = N'<literal:594>'
 + @tableName + '<literal:595>'
 + CONVERT(NVARCHAR, @DaysHist) + N'<literal:596>'




 + CONVERT(NVARCHAR, @DeleteLoopLimit) + N'<literal:597>'



 + CONVERT(NVARCHAR, @DeleteBatchSize) + N'<literal:598>'
 + @tableName + '<literal:599>'
 + CONVERT(NVARCHAR, @DaysHist) + N'<literal:600>'







        EXEC sp_executesql @truncateSQL;
    END

	FETCH NEXT FROM cArchiveDelete INTO @tableName, @DaysHist
END

CLOSE cArchiveDelete
DEALLOCATE cArchiveDelete

/* [comment omitted] */
DECLARE cHistDelete CURSOR FAST_FORWARD READ_ONLY FOR
SELECT TABLE_DO_NAME, RIGHT(ARCHIVE_NAME, LEN(ARCHIVE_NAME) - CHARINDEX(N'<literal:601>', ARCHIVE_NAME, 14)) AS TYPE
FROM ARCHIVE_PREFERENCES WITH(NOLOCK)
WHERE ARCHIVE_NAME LIKE N'<literal:602>'
    AND SAVE_DATA = N'<literal:603>'
    AND ACTIVE = N'<literal:604>'
    AND RUN_BY_DEFAULT = N'<literal:605>'
    AND EXISTS (SELECT TOP 1 '<literal:606>' FROM AR_PROCESS_HISTORY WHERE PROCESS = RIGHT(ARCHIVE_NAME, LEN(ARCHIVE_NAME) - CHARINDEX(N'<literal:607>', ARCHIVE_NAME, 14)))
ORDER BY 1, 2
 
OPEN cHistDelete
FETCH NEXT FROM cHistDelete INTO @tableName, @HistType
 
WHILE @@FETCH_STATUS = 0 
BEGIN
    /* [comment omitted] */
    IF (@tableName IS NOT NULL AND @HistType IS NOT NULL)
    BEGIN 
        SET @truncateSQL = N'<literal:608>'

 + CONVERT(NVARCHAR, @DeleteLoopLimit) + N'<literal:609>'



 + CONVERT(NVARCHAR, @DeleteBatchSize) + N'<literal:610>'
 + @tableName + '<literal:611>'
 + @HistType + N'<literal:612>'





        EXEC sp_executesql @truncateSQL;
    END

	FETCH NEXT FROM cHistDelete INTO @tableName, @HistType
END
 
CLOSE cHistDelete
DEALLOCATE cHistDelete

/* [comment omitted] */
DECLARE cHistDelete CURSOR FAST_FORWARD READ_ONLY FOR
SELECT TABLE_DO_NAME, RIGHT(ARCHIVE_NAME, LEN(ARCHIVE_NAME) - CHARINDEX(N'<literal:613>', ARCHIVE_NAME, 14)) AS TYPE
FROM ARCHIVE_PREFERENCES WITH(NOLOCK)
WHERE ARCHIVE_NAME LIKE N'<literal:614>'
    AND SAVE_DATA = N'<literal:615>'
    AND ACTIVE = N'<literal:616>'
    AND RUN_BY_DEFAULT = N'<literal:617>'
    AND EXISTS (SELECT TOP 1 '<literal:618>' FROM AR_TRANSACTION_HISTORY WHERE TRANSACTION_TYPE = RIGHT(ARCHIVE_NAME, LEN(ARCHIVE_NAME) - CHARINDEX(N'<literal:619>', ARCHIVE_NAME, 14)))
ORDER BY 1, 2
 
OPEN cHistDelete
FETCH NEXT FROM cHistDelete INTO @tableName, @HistType
 
WHILE @@FETCH_STATUS = 0 
BEGIN
    /* [comment omitted] */
    IF (@tableName IS NOT NULL AND @HistType IS NOT NULL)
    BEGIN 
        SET @truncateSQL = N'<literal:620>'

 + CONVERT(NVARCHAR, @DeleteLoopLimit) + N'<literal:621>'



 + CONVERT(NVARCHAR, @DeleteBatchSize) + N'<literal:622>'
 + @tableName + '<literal:623>'
 + @HistType + N'<literal:624>'





        EXEC sp_executesql @truncateSQL;
    END

	FETCH NEXT FROM cHistDelete INTO @tableName, @HistType
END
 
CLOSE cHistDelete
DEALLOCATE cHistDelete
END /* [comment omitted] */

/* [comment omitted] */  
IF (SELECT @@SERVERNAME) IN (SELECT DB_SERVER FROM @NonProdServerList)
/* [comment omitted] */  
BEGIN  
UPDATE SCHEDULED_JOBS  
SET ACTIVE = N'<literal:625>',  
    NEXT_RUN_DATE_TIME = CASE   
    WHEN NEXT_RUN_DATE_TIME IS NULL THEN CONVERT(DATE, GETUTCDATE()+1)  
    WHEN NEXT_RUN_DATE_TIME > CONVERT(DATE, GETUTCDATE()+1) THEN CONVERT(DATE, GETUTCDATE()+1)   
    ELSE NEXT_RUN_DATE_TIME END,
    PARAMETER_DATA = NULL,
    DAYS_TO_RUN = N'<literal:626>',  
    USER_STAMP = N'<literal:627>',
    PROCESS_STAMP = N'<literal:628>',
    DATE_TIME_STAMP = GETUTCDATE()  
WHERE JOB_NAME = N'<literal:629>';  
END  
/* [comment omitted] */  
ELSE  
BEGIN  
UPDATE SCHEDULED_JOBS  
SET ACTIVE = N'<literal:630>',  
    NEXT_RUN_DATE_TIME = CONVERT(DATE, DATEADD(DAY, 1, GETUTCDATE() - DATEPART(DW, GETUTCDATE())  
        + CASE WHEN DATEPART(DW, GETUTCDATE()) < 1 THEN 0 ELSE 7 END )),
    PARAMETER_DATA = NULL,
    USER_STAMP = N'<literal:631>',
    PROCESS_STAMP = N'<literal:632>',
    DATE_TIME_STAMP = GETUTCDATE()  
WHERE JOB_NAME = N'<literal:633>'   
    AND NOT EXISTS (SELECT N'<literal:634>'  
    FROM SCHEDULED_JOBS WITH(NOLOCK)  
        WHERE RECORD_TYPE = N'<literal:635>'  
        AND ACTIVE = N'<literal:636>'  
        AND PARAMETER_DATA IS NULL);  
END  
  
/* [comment omitted] */  
UPDATE SCHEDULED_JOBS  
SET NEXT_RUN_DATE_TIME = DATEADD(MINUTE, 5, NEXT_RUN_DATE_TIME),  
    MINUTES_FREQUENCY = CASE WHEN MINUTES_FREQUENCY < 5 THEN 5 ELSE MINUTES_FREQUENCY END,  
    USER_STAMP = N'<literal:637>',
    PROCESS_STAMP = N'<literal:638>',
    DATE_TIME_STAMP = GETUTCDATE() 
WHERE ACTIVE = N'<literal:639>'  
    AND SPECIFIC_TIME IS NULL  
    AND NEXT_RUN_DATE_TIME IS NOT NULL  
    AND MINUTES_FREQUENCY < 5 
    AND ISNULL(USER_DEF6, N'<literal:640>') <> N'<literal:641>';  
  
END
/* [comment omitted] */