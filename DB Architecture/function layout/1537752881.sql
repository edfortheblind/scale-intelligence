/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	187802		| MDL			| 09/25/16	| Created.
	193507		| SAM			| 12/11/16	| Added username check for User level security.
	216453		| MJ			| 12/11/17	| Modified to make db compatible with Azure SQL.
*/


CREATE FUNCTION SECfn_GetSecurityCheckPoint(@formId numeric(5), @username nvarchar(30))
RETURNS @retCheckPoint TABLE (
  CheckPointValue varchar(1) NOT NULL,
  CheckpointId int NOT NULL
)
AS
BEGIN

  DECLARE @securityCPNumbers TABLE (    
    number int NOT NULL
  );	

  INSERT INTO @securityCPNumbers ( number) VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
  (21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),
  (41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63)


  DECLARE @checkpointSecurity TABLE (
    CheckPointValue varchar(1) NOT NULL,
    CheckpointId int NOT NULL
  );


  INSERT INTO @checkpointSecurity
    SELECT
      SUBSTRING(result.SEC_VALUES, v.number + 1, 1) AS CheckPointValue,
      Number + 1 AS CheckpointId
    FROM (SELECT
      SEC_VALUES
    FROM SECURITY
    WHERE FORM_ID = @formId
    AND SECURITY_LEVEL = N'User' AND USER_NAME = @username) AS result
    JOIN @securityCPNumbers v
      ON v.number < LEN(result.SEC_VALUES)
    

  IF NOT EXISTS (SELECT
      1
    FROM @checkpointSecurity)
  BEGIN
    INSERT INTO @checkpointSecurity
      SELECT
        SUBSTRING(result.SEC_VALUES, v.number + 1, 1) AS CheckPointValue,
        Number + 1 AS CheckpointId
      FROM (SELECT
        SEC_VALUES
      FROM SECURITY
      WHERE FORM_ID = @formId
      AND SECURITY_GROUP_ID = (SELECT
        SECURITY_GROUP_ID
      FROM user_profile
      WHERE USER_NAME = @username)) AS result
      JOIN @securityCPNumbers v
        ON v.number < LEN(result.SEC_VALUES)
      

    IF NOT EXISTS (SELECT
        1
      FROM @checkpointSecurity)
    BEGIN
      INSERT INTO @checkpointSecurity
        SELECT
          SUBSTRING(result.SEC_VALUES, v.number + 1, 1) AS CheckPointValue,
          Number + 1 AS CheckpointId
        FROM (SELECT
          SEC_VALUES
        FROM SECURITY
        WHERE FORM_ID = @formId
        AND SECURITY_LEVEL = N'System') AS result
        JOIN @securityCPNumbers v
          ON v.number < LEN(result.SEC_VALUES)
       
    END
  END
     -- Return the information to the caller
    INSERT @retCheckPoint
        SELECT * from @checkpointSecurity
    RETURN;

END