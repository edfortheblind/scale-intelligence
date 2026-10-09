/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	143838		| SAM			| 09/16/14	| Created.
	
	Function calculates checkdigit for Barnes and Nobles.
	
	Parameters
		@UNIQUEPREFIX is unique prefix of Barnes and Nobles.
		@DESTINATIONSAN is shipment header. ship to
	
	Return Value
		String				The Single CheckDigit.
*/
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

      -- calculate the sum of digits 
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

      -- find the remainder 
      SET @SUM = @SUM % 10; 
      -- subtract 10 by remainder  
      SET @SUM = 10 - @SUM; 

      return @SUM; 
  END 

