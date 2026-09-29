-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE SHP_MoveContainersBelowStatusToShipment
(
@fromShipmentInternalNum numeric(9),
@status numeric(9),
@toShipmentInternalNum numeric(9),
@userName nvarchar(30)
)
AS
BEGIN

DECLARE @counter int = 1;
DECLARE @maxCount int  = 0; 

-- [comment omitted]
DECLARE @ShippingContainerList Table(Id int,InternalContainerNum int);

-- [comment omitted]
INSERT INTO @ShippingContainerList(Id,InternalContainerNum)
SELECT ROW_NUMBER() over (ORDER BY Internal_container_num) as Id, Internal_container_num
FROM Shipping_Container
where internal_shipment_num = @fromShipmentInternalNum and status < @status

SELECT @maxCount = count(*) FROM @ShippingContainerList

-- [comment omitted]
WHILE ( @counter <= @maxCount)
BEGIN
	UPDATE SHIPPING_CONTAINER
	SET INTERNAL_SHIPMENT_NUM  = @toShipmentInternalNum,
			USER_STAMP = @userName,
			PROCESS_STAMP = N'<literal:1>',
			DATE_TIME_STAMP = getutcdate()

	WHERE INTERNAL_CONTAINER_NUM = (SELECT InternalContainerNum FROM @ShippingContainerList WHERE Id = @counter)

	SELECT @counter = @counter + 1;
END

END;

