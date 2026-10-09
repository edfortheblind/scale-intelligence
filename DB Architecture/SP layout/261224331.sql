/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	153124	  	| MDL   	| 02/05/15	| Created.

	Delete customize screen and activate base
*/
CREATE PROCEDURE META_DELETECUSTOMIZESCREEN(@OBJECTID numeric(9))  AS DECLARE @FORMID numeric(5);
SELECT
   @FORMID = FORM_ID
FROM
   MAIN_UI_SCREEN
WHERE
   OBJECT_ID =@OBJECTID;
   
DELETE
FROM
   SCREEN_CONTROL_EVENT_PARAMETERS
WHERE
   SCREEN_CONTROL_EVENT_ID IN (
      SELECT
         OBJECT_ID
      FROM
         SCREEN_CONTROL_EVENT
      WHERE
         SCREEN_CONTROL_ID IN (
            SELECT
               OBJECT_ID
            FROM
               SCREEN_CONTROL
            WHERE
               SCREEN_GROUP_ID IN (
                  SELECT
                     OBJECT_ID
                  FROM
                     SCREEN_GROUP
                  WHERE
                     SCREEN_PART_ID IN (
                        SELECT
                           OBJECT_ID
                        FROM
                           SCREEN_PART
                        WHERE
                           SCREEN_ID = (
                              SELECT
                                 OBJECT_ID
                              FROM
                                 MAIN_UI_SCREEN
                              WHERE
                                 FORM_ID = @FORMID
                                 AND SYSTEM_CREATED <> N'Y'
                                 AND OBJECT_ID =@OBJECTID
                           ) 
                     ) 
               ) 
         ) 
   ) ;
DELETE
FROM
   SCREEN_CONTROL_EVENT
WHERE
   SCREEN_CONTROL_ID IN (
      SELECT
         OBJECT_ID
      FROM
         SCREEN_CONTROL
      WHERE
         SCREEN_GROUP_ID IN (
            SELECT
               OBJECT_ID
            FROM
               SCREEN_GROUP
            WHERE
               SCREEN_PART_ID IN (
                  SELECT
                     OBJECT_ID
                  FROM
                     SCREEN_PART
                  WHERE
                     SCREEN_ID = (
                        SELECT
                           OBJECT_ID
                        FROM
                           MAIN_UI_SCREEN
                        WHERE
                           FORM_ID = @FORMID
                           AND SYSTEM_CREATED <> N'Y'
                           AND OBJECT_ID =@OBJECTID
                     ) 
               ) 
         ) 
   ) ;
DELETE
FROM
   SCREEN_CONTROL_ATTRIBUTES
WHERE
   SCREEN_CONTROL_ID IN (
      SELECT
         OBJECT_ID
      FROM
         SCREEN_CONTROL
      WHERE
         SCREEN_GROUP_ID IN (
            SELECT
               OBJECT_ID
            FROM
               SCREEN_GROUP
            WHERE
               SCREEN_PART_ID IN (
                  SELECT
                     OBJECT_ID
                  FROM
                     SCREEN_PART
                  WHERE
                     SCREEN_ID = (
                        SELECT
                           OBJECT_ID
                        FROM
                           MAIN_UI_SCREEN
                        WHERE
                           FORM_ID = @FORMID
                           AND SYSTEM_CREATED <> N'Y'
                           AND OBJECT_ID =@OBJECTID
                     ) 
               ) 
         ) 
   ) ;
DELETE
FROM
   SCREEN_CONTROL_GRID_COLUMNS
WHERE
   SCREEN_CONTROL_ID IN (
      SELECT
         OBJECT_ID
      FROM
         SCREEN_CONTROL
      WHERE
         SCREEN_GROUP_ID IN (
            SELECT
               OBJECT_ID
            FROM
               SCREEN_GROUP
            WHERE
               SCREEN_PART_ID IN (
                  SELECT
                     OBJECT_ID
                  FROM
                     SCREEN_PART
                  WHERE
                     SCREEN_ID = (
                        SELECT
                           OBJECT_ID
                        FROM
                           MAIN_UI_SCREEN
                        WHERE
                           FORM_ID = @FORMID
                           AND SYSTEM_CREATED <> N'Y'
                           AND OBJECT_ID =@OBJECTID
                     ) 
               ) 
         ) 
   ) ;
DELETE
FROM
   SCREEN_CONTROL
WHERE
   SCREEN_GROUP_ID IN (
      SELECT
         OBJECT_ID
      FROM
         SCREEN_GROUP
      WHERE
         SCREEN_PART_ID IN (
            SELECT
               OBJECT_ID
            FROM
               SCREEN_PART
            WHERE
               SCREEN_ID = (
                  SELECT
                     OBJECT_ID
                  FROM
                     MAIN_UI_SCREEN
                  WHERE
                     FORM_ID = @FORMID
                     AND SYSTEM_CREATED <> N'Y'
                     AND OBJECT_ID =@OBJECTID
               ) 
         ) 
   ) ;
DELETE
FROM
   SCREEN_GROUP_COLUMN
WHERE
   SCREEN_GROUP_ID IN (
      SELECT
         OBJECT_ID
      FROM
         SCREEN_GROUP
      WHERE
         SCREEN_PART_ID IN (
            SELECT
               OBJECT_ID
            FROM
               SCREEN_PART
            WHERE
               SCREEN_ID = (
                  SELECT
                     OBJECT_ID
                  FROM
                     MAIN_UI_SCREEN
                  WHERE
                     FORM_ID = @FORMID
                     AND SYSTEM_CREATED <> N'Y'
                     AND OBJECT_ID =@OBJECTID
               ) 
         ) 
   ) ;
DELETE
FROM
   SCREEN_GROUP
WHERE
   SCREEN_PART_ID IN (
      SELECT
         OBJECT_ID
      FROM
         SCREEN_PART
      WHERE
         SCREEN_ID = (
            SELECT
               OBJECT_ID
            FROM
               MAIN_UI_SCREEN
            WHERE
               FORM_ID = @FORMID
               AND SYSTEM_CREATED <> N'Y'
               AND OBJECT_ID =@OBJECTID
         ) 
   ) ;
DELETE
FROM
   SCREEN_PART_SEARCH
WHERE
   SCREEN_PART_ID IN (
      SELECT
         OBJECT_ID
      FROM
         SCREEN_PART
      WHERE
         SCREEN_ID = (
            SELECT
               OBJECT_ID
            FROM
               MAIN_UI_SCREEN
            WHERE
               FORM_ID = @FORMID
               AND SYSTEM_CREATED <> N'Y'
               AND OBJECT_ID =@OBJECTID
         ) 
   ) ;
DELETE
FROM
   SCREEN_PART
WHERE
   SCREEN_ID = (
      SELECT
         OBJECT_ID
      FROM
         MAIN_UI_SCREEN
      WHERE
         FORM_ID = @FORMID
         AND SYSTEM_CREATED <> N'Y'
         AND OBJECT_ID =@OBJECTID
   ) ;
DELETE
FROM
   MAIN_UI_WM_LICENSE_XREF
WHERE
   MAIN_UI_SCREEN_ID = (
      SELECT
         OBJECT_ID
      FROM
         MAIN_UI_SCREEN
      WHERE
         FORM_ID = @FORMID
         AND SYSTEM_CREATED <> N'Y'
         AND OBJECT_ID =@OBJECTID
   ) ;

DELETE
FROM
   MAIN_UI_SCREEN
WHERE
   FORM_ID = @FORMID
   AND SYSTEM_CREATED <> N'Y'
   AND OBJECT_ID =@OBJECTID;
UPDATE
   MAIN_UI_SCREEN
SET
   ACTIVE = N'Y'
WHERE
   SYSTEM_CREATED = N'Y'
   AND FORM_ID =@FORMID;
