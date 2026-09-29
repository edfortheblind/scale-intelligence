-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













CREATE FUNCTION LBLfn_Checkdigit_86_BarnesAndNobles
(
    @UNIQUEPREFIX   NVARCHAR(50)  ,
	@DESTINATIONSAN NVARCHAR(50)
)
RETURNS INTEGER
AS
BEGIN 
      DECLARE @STRING NVARCHAR(100); 
      DECLARE @LEN INTEGER; 
      DECLARE @INDEX INTEGER; 
      DECLARE @CHAR NVARCHAR(1); 
      DECLARE @SUM INTEGER; 

      SET @SUM = 0; 
      SET @INDEX = 1 
      SET @DESTINATIONSAN = LEFT(@DESTINATIONSAN, 6); 
      SET @STRING = @UNIQUEPREFIX + @DESTINATIONSAN; 
      SET @LEN = Len(@STRING) 

      -- [comment omitted]
      WHILE @INDEX <= @LEN 
        BEGIN 
            SET @CHAR = Substring(@STRING, @INDEX, 1) 

            IF ( @INDEX % 2 ) = 1 
              BEGIN 
                  SET @SUM = @SUM + CONVERT(INT, @CHAR); 
              END 
            ELSE 
              BEGIN 
                  SET @SUM = @SUM + CONVERT(INT, @CHAR) * 3; 
              END 

            SET @INDEX= @INDEX + 1 
        END 

      -- [comment omitted]
      SET @SUM = @SUM % 10; 
      -- [comment omitted]
      SET @SUM = 10 - @SUM; 

      return @SUM; 
  END 

