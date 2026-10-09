/*

	Task	| By	| Date		| Modification Description

	--------------------------------------------------------------------

	139765	| JY	| 03/13/14	| Created

*/



CREATE PROCEDURE wm_RLocationInventoryAttributes02

	@objectID numeric(9)

			

AS	

		SELECT * FROM LOCATION_INVENTORY_ATTRIBUTES

		WHERE OBJECT_ID = @objectID;

	
