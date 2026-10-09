CREATE FUNCTION SCI_DST_CONVERT_WHSE

(

@from_date datetime,

@whse nvarchar(100)

)

RETURNS datetime

AS BEGIN

                 -- Convert the datetime from UTC to User Default Time Zone based on WHSE and Logged User

                 DECLARE @dst_converted datetime

                 SELECT  @dst_converted = @from_date AT TIME ZONE N'UTC' AT TIME ZONE @whse

                 

  

  RETURN @dst_converted

END

