-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
	
CREATE FUNCTION SHIPCONTfn_RtrvItemContentsCount(@internalcontainernum numeric(9)) 
RETURNS INT
  BEGIN 
      -- [comment omitted]
      DECLARE @ITEMCONTENTS_COUNT INT; 

	  SELECT @ITEMCONTENTS_COUNT= COUNT(*) FROM SHIPPING_CONTAINER WHERE (PARENT=@internalcontainernum AND INTERNAL_SHIPMENT_LINE_NUM > 0 AND CONTAINER_TYPE = N'<literal:1>') OR ( INTERNAL_CONTAINER_NUM=@internalcontainernum AND INTERNAL_SHIPMENT_LINE_NUM > 0 AND CONTAINER_TYPE <> N'<literal:2>');

	  RETURN @ITEMCONTENTS_COUNT;
    
  END -- [comment omitted]
