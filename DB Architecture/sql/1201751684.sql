-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE FUNCTION SCI_DST_CONVERT_WHSE

(

@from_date datetime,

@whse nvarchar(100)

)

RETURNS datetime

AS BEGIN

                 -- [comment omitted]

                 DECLARE @dst_converted datetime

                 SELECT  @dst_converted = @from_date AT TIME ZONE N'<literal:1>' AT TIME ZONE @whse

                 

  

  RETURN @dst_converted

END

