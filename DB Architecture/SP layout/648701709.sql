CREATE PROCEDURE FetchLPDetails
(
@culture nvarchar(10),
@Warehouse nvarchar(25) = null,
@LicensePlate nvarchar(50) = null
)
AS
BEGIN
    SET NOCOUNT ON;
    --Variables
    SELECT Location,Lot,LOC_INV_ATTRIBUTES_ID,
        CASE 
            WHEN Lot IS NULL THEN NULL
            ELSE Expiration_Date
        END AS Expiration_Date
    FROM LOCATION_INVENTORY WHERE WAREHOUSE = @Warehouse
      AND LOGISTICS_UNIT = @LicensePlate;
END
