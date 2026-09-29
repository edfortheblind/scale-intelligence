-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






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
                                 AND SYSTEM_CREATED <> N'<literal:1>'
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
                           AND SYSTEM_CREATED <> N'<literal:2>'
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
                           AND SYSTEM_CREATED <> N'<literal:3>'
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
                           AND SYSTEM_CREATED <> N'<literal:4>'
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
                     AND SYSTEM_CREATED <> N'<literal:5>'
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
                     AND SYSTEM_CREATED <> N'<literal:6>'
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
               AND SYSTEM_CREATED <> N'<literal:7>'
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
               AND SYSTEM_CREATED <> N'<literal:8>'
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
         AND SYSTEM_CREATED <> N'<literal:9>'
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
         AND SYSTEM_CREATED <> N'<literal:10>'
         AND OBJECT_ID =@OBJECTID
   ) ;

DELETE
FROM
   MAIN_UI_SCREEN
WHERE
   FORM_ID = @FORMID
   AND SYSTEM_CREATED <> N'<literal:11>'
   AND OBJECT_ID =@OBJECTID;
UPDATE
   MAIN_UI_SCREEN
SET
   ACTIVE = N'<literal:12>'
WHERE
   SYSTEM_CREATED = N'<literal:13>'
   AND FORM_ID =@FORMID;
