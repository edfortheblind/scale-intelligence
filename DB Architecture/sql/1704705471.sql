-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */







CREATE FUNCTION INVfn_RtrvConversionInfoForItemAndLocation(
	@ITEM nvarchar(50),
	@COMPANY nvarchar(25),
	@WAREHOUSE nvarchar(25),
	@LOCATION nvarchar(25),
	@BASETOTALQUANTITY numeric(19,5),
	@BASEUM nvarchar(25), 
	@BASEMOVEMENTCLASS nvarchar(25),
	@BASEWEIGHT numeric(19,5)
)

RETURNS @RETTABLE TABLE (CONVERSIONQTY numeric(19,5),
					     CONVERSIONQUANTITYUM nvarchar(25),
						 CONVERSIONQUANTITYMOVEMENTCLASS nvarchar(25),
						 WEIGHTPERITEM numeric(19,5)
						 )

AS
BEGIN
    -- [comment omitted]
	DECLARE @ITEMCLASS        nvarchar(50);
    DECLARE @QUANTITYUMLIST  nvarchar(2000);
    DECLARE @COUNT           INT;

    SELECT
        @ITEMCLASS = ITEM_CLASS
    FROM ITEM
    WHERE (ITEM = @ITEM AND ISNULL(COMPANY, N'<literal:1>') = ISNULL(@COMPANY, N'<literal:2>'))
       OR (ITEM = @ITEM AND COMPANY IS NULL);


    SELECT
        @QUANTITYUMLIST = QTY_UM_LIST
        FROM LOCATION
        WHERE LOCATION  = @LOCATION
    AND WAREHOUSE = @WAREHOUSE;

    IF (@QUANTITYUMLIST IS NOT NULL AND LEN(@QUANTITYUMLIST) > 0)
    BEGIN   
        INSERT INTO @RETTABLE
        (
            CONVERSIONQTY,
            CONVERSIONQUANTITYUM,
            CONVERSIONQUANTITYMOVEMENTCLASS,
            WEIGHTPERITEM
        )
        SELECT
            IUM.CONVERSION_QTY,
            IUM.QUANTITY_UM,
            IUM.MOVEMENT_CLS,
            IUM.WEIGHT
        FROM ITEM_UNIT_OF_MEASURE IUM
        INNER JOIN GENfn_SplitString(@QUANTITYUMLIST, N'<literal:3>') SPLIT
            ON SPLIT.VALUE = IUM.QUANTITY_UM
        WHERE IUM.ITEM = @ITEM
          AND (IUM.COMPANY = @COMPANY OR IUM.COMPANY IS NULL)
        ORDER BY
            SPLIT.ID ASC,
            IUM.SEQUENCE DESC;

        SET @COUNT = @@ROWCOUNT;

        IF (@COUNT > 0)
            RETURN;
        
        IF (@ITEMCLASS IS NOT NULL)
        BEGIN
            INSERT INTO @RETTABLE
            (
                CONVERSIONQTY,
                CONVERSIONQUANTITYUM,
                CONVERSIONQUANTITYMOVEMENTCLASS,
                WEIGHTPERITEM
            )
            SELECT
                IUM.CONVERSION_QTY,
                IUM.QUANTITY_UM,
                IUM.MOVEMENT_CLS,
                IUM.WEIGHT
            FROM ITEM_UNIT_OF_MEASURE IUM
            INNER JOIN GENfn_SplitString(@QUANTITYUMLIST, N'<literal:4>') SPLIT
                ON SPLIT.VALUE = IUM.QUANTITY_UM
            WHERE IUM.ITEM_CLASS = @ITEMCLASS
            ORDER BY
                SPLIT.ID ASC,
                IUM.SEQUENCE DESC;

            SET @COUNT = @@ROWCOUNT;

            IF (@COUNT > 0)
                RETURN;
        END
    END


    INSERT INTO @RETTABLE
    (
        CONVERSIONQTY,
        CONVERSIONQUANTITYUM,
        CONVERSIONQUANTITYMOVEMENTCLASS,
        WEIGHTPERITEM
    )
    SELECT
        CONVERSION_QTY,
        QUANTITY_UM,
        MOVEMENT_CLS,
        WEIGHT
    FROM ITEM_UNIT_OF_MEASURE
    WHERE ITEM = @ITEM
      AND (COMPANY = @COMPANY OR COMPANY IS NULL);

    SET @COUNT = @@ROWCOUNT;

    IF (@COUNT > 0)
        RETURN;

    IF (@ITEMCLASS IS NOT NULL)
        BEGIN
            INSERT INTO @RETTABLE
            (
                CONVERSIONQTY,
                CONVERSIONQUANTITYUM,
                CONVERSIONQUANTITYMOVEMENTCLASS,
                WEIGHTPERITEM
            )
            SELECT
                CONVERSION_QTY,
                QUANTITY_UM,
                MOVEMENT_CLS,
                WEIGHT
            FROM ITEM_UNIT_OF_MEASURE
            WHERE ITEM_CLASS = @ITEMCLASS;

            SET @COUNT = @@ROWCOUNT;

            IF (@COUNT > 0)
        RETURN;
    END

    INSERT INTO @RETTABLE
    (
        CONVERSIONQTY,
        CONVERSIONQUANTITYUM,
        CONVERSIONQUANTITYMOVEMENTCLASS,
        WEIGHTPERITEM
    )
    SELECT
        @BASETOTALQUANTITY,
        @BASEUM,
        @BASEMOVEMENTCLASS,
        @BASEWEIGHT;

    RETURN;
         
END  	
