 /*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	235797	| MHM	| 05/27/19	| Replaced USER_NAME to EMAIL_ADDRESS.
*/
 
 /* Converts datetime from UTC to Default User Time Zone */
-- Parameter 1 � the date need to be converted
-- Parameter 2 � warehouse associated to transaction date column
-- Parameter 3 � application logged in user

CREATE FUNCTION SCI_DST_CONVERT
(
 @from_date datetime,
 @whse nvarchar(100), 
 @log_user nvarchar(100))
RETURNS datetime
AS BEGIN
                 -- Convert the datetime from UTC to User Default Time Zone based on WHSE and Logged User
                 DECLARE @dst_converted datetime
                 SELECT  @dst_converted = @from_date AT TIME ZONE N'UTC' AT TIME ZONE WAREHOUSE.TIME_ZONE
  FROM    USER_PROFILE 
          INNER JOIN WAREHOUSE ON USER_PROFILE.DEFAULT_WHS = WAREHOUSE.WAREHOUSE
  WHERE   USER_PROFILE.EMAIL_ADDRESS = @log_user
  RETURN @dst_converted
END
