/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------------------------------
	14902	| VK	| 08/10/05	| Merged SQL server and Oracle versions
	14902	| VK	| 08/10/05	| Modified to include company in NotExists of last Select SQL
*/


CREATE PROCEDURE wm_RItemUnitOfMeasure02
	@Item nvarchar(50),
	@Company nvarchar(25),
	@ItemClass nvarchar(50)
AS
	SELECT * 
     FROM item_unit_of_measure
	 WHERE item = @Item
		AND (company = @Company 
		     OR (company IS NULL AND @Company IS NULL))
    UNION
	SELECT * 
     FROM item_unit_of_measure
	 WHERE item = @Item
		AND company IS NULL
      AND NOT EXISTS (SELECT N'X'
                        FROM item_unit_of_measure
                   	  WHERE item = @Item
                  		 AND (company = @Company 
                  		      OR (company IS NULL AND @Company IS NULL)))
    UNION
	SELECT * 
     FROM item_unit_of_measure
	 WHERE item_class = @ItemClass
      AND NOT EXISTS (SELECT N'X'
                        FROM item_unit_of_measure
                   	  WHERE item = @Item AND (company = @company OR company IS NULL))
	ORDER BY company desc



