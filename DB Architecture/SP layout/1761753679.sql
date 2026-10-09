/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	176530		| MJ			| 04/07/2016 | Created to improve performance of system and to acquiring row level locks instead of table level lock.
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.
	
*/

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

-- Create temp table
DECLARE @ShippingContainerList Table(Id int,InternalContainerNum int);

--Prepare temp table having Id Number to iterate
INSERT INTO @ShippingContainerList(Id,InternalContainerNum)
SELECT ROW_NUMBER() over (ORDER BY Internal_container_num) as Id, Internal_container_num
FROM Shipping_Container
where internal_shipment_num = @fromShipmentInternalNum and status < @status

SELECT @maxCount = count(*) FROM @ShippingContainerList

-- update each container row by row to prevent table level lock
WHILE ( @counter <= @maxCount)
BEGIN
	UPDATE SHIPPING_CONTAINER
	SET INTERNAL_SHIPMENT_NUM  = @toShipmentInternalNum,
			USER_STAMP = @userName,
			PROCESS_STAMP = N'SHP_MoveContainersBelowStatusToShipment',
			DATE_TIME_STAMP = getutcdate()

	WHERE INTERNAL_CONTAINER_NUM = (SELECT InternalContainerNum FROM @ShippingContainerList WHERE Id = @counter)

	SELECT @counter = @counter + 1;
END

END;

