-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











CREATE PROCEDURE wm_RLocationInventoryAttributes02

	@objectID numeric(9)

			

AS	

		SELECT * FROM LOCATION_INVENTORY_ATTRIBUTES

		WHERE OBJECT_ID = @objectID;

	
