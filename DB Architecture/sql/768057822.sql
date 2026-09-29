-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE  TRIGGER ship_container_tree_unit_a_i
ON shipping_container
AFTER INSERT
AS 
BEGIN
	UPDATE shipping_container 
      SET tree_unit = shipping_container.internal_container_num
     FROM inserted
    WHERE ISNULL(inserted.tree_unit,-1) < 0
      AND inserted.parent IS NULL
      AND inserted.internal_container_num = shipping_container.internal_container_num
END