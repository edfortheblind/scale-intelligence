-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
 /* [comment omitted] */




 
 /* [comment omitted] */
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]

CREATE FUNCTION SCI_DST_CONVERT
(
 @from_date datetime,
 @whse nvarchar(100), 
 @log_user nvarchar(100))
RETURNS datetime
AS BEGIN
                 -- [comment omitted]
                 DECLARE @dst_converted datetime
                 SELECT  @dst_converted = @from_date AT TIME ZONE N'<literal:1>' AT TIME ZONE WAREHOUSE.TIME_ZONE
  FROM    USER_PROFILE 
          INNER JOIN WAREHOUSE ON USER_PROFILE.DEFAULT_WHS = WAREHOUSE.WAREHOUSE
  WHERE   USER_PROFILE.EMAIL_ADDRESS = @log_user
  RETURN @dst_converted
END
