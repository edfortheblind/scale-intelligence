-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE FUNCTION SECfn_GetSecurityCheckPointByUsername(@username nvarchar(30))
RETURNS @retCheckPoint TABLE (
  CheckPointValue varchar(1) NOT NULL,
  CheckpointId int NOT NULL,
  Form_Id varchar(6) NOT NULL
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
    CheckpointId int NOT NULL,
	Form_Id varchar(6) NOT NULL
  );

  INSERT INTO @checkpointSecurity
    SELECT
      SUBSTRING(result.SEC_VALUES, v.number + 1, 1) AS CheckPointValue,
      Number + 1 AS CheckpointId, FORM_ID as Form_ID
    FROM (SELECT
      SEC_VALUES, FORM_ID
    FROM SECURITY where
    SECURITY_LEVEL = N'<literal:1>' AND USER_NAME = @username) AS result
    JOIN @securityCPNumbers v
      ON v.number < LEN(result.SEC_VALUES)

    
  IF NOT EXISTS (SELECT
      1
    FROM @checkpointSecurity)
  BEGIN
    INSERT INTO @checkpointSecurity
      SELECT
        SUBSTRING(result.SEC_VALUES, v.number + 1, 1) AS CheckPointValue,
        Number + 1 AS CheckpointId, FORM_ID as Form_ID
      FROM (SELECT
        SEC_VALUES, FORM_ID
      FROM SECURITY 
      WHERE SECURITY_LEVEL = N'<literal:2>' AND USER_NAME = @username) AS result
      JOIN @securityCPNumbers v
        ON v.number < LEN(result.SEC_VALUES)
      

    IF NOT EXISTS (SELECT
        1
      FROM @checkpointSecurity)
    BEGIN
      INSERT INTO @checkpointSecurity
        SELECT
          SUBSTRING(result.SEC_VALUES, v.number + 1, 1) AS CheckPointValue,
          Number + 1 AS CheckpointId, FORM_ID as Form_Id
        FROM (SELECT
          SEC_VALUES, FORM_ID
        FROM SECURITY
        WHERE SECURITY_LEVEL = N'<literal:3>') AS result
        JOIN @securityCPNumbers v
          ON v.number < LEN(result.SEC_VALUES)
    END
  END

     -- [comment omitted]
    INSERT @retCheckPoint
        SELECT * from @checkpointSecurity
    RETURN;

END