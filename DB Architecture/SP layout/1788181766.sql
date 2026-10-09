/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	206751		| MHM			| 05/26/17	| Created.
*/

CREATE procedure dbc_IArchiveSerialNumbersInShipLoad
(
 @shipLoadNum numeric(9) 
)
AS
    SET NOCOUNT ON;
	INSERT INTO AR_SERIAL_NUMBER SELECT SN.* from serial_number sn, shipping_container sc, shipment_header sh, shipping_load sl
		where sn.ship_cont_num = sc.internal_container_num
		and sc.internal_shipment_num = sh.internal_shipment_num 
		and sh.shipping_load_num = sl.internal_load_num
		and sl.internal_load_num = @shipLoadNum
		
  IF (@@ROWCOUNT >0)
   BEGIN		
    DECLARE @R INT;
    SET @R=1;
    WHILE @R > 0
	 BEGIN 
          DELETE FROM SERIAL_NUMBER WHERE OBJECT_ID IN (SELECT TOP(500) SN.OBJECT_ID 
           From serial_number sn, shipping_container sc, shipment_header sh, shipping_load sl
		   where sn.ship_cont_num = sc.internal_container_num
		   and sc.internal_shipment_num = sh.internal_shipment_num 
		   and sh.shipping_load_num = sl.internal_load_num
		   and sl.internal_load_num = @shipLoadNum)

           SET @R=@@ROWCOUNT;	      
   END
  END 	