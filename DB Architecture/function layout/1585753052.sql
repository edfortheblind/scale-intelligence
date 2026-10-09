/*
	MOD NUMBER	| PROGRAMMER	| DATE   	| MODIFICATION DESCRIPTION
	--------------------------------------------------------------------
	137854		| MDL			| 04/04/14	| CREATED.

	RETRIEVES CURRENT LOCATION OF CONTAINER AS CONTENT LOCATION IF ALL CONTENT ARE ON SAME LOCATION OTHERWISE NULL.
*/	
CREATE FUNCTION SHIPCONTfn_RtrvCurrentLocation(@internalcontainernum numeric(9)) 
RETURNS nvarchar(25)
  BEGIN 
      -- LOCAL VARIABLES. 
      DECLARE @LOCATION nvarchar(25); 
      DECLARE @LOCATIONCOUNT INT; 
	  DECLARE @TREEUNIT numeric(9); 
	  DECLARE @LOCATIONTABLE TABLE(LOCATION nvarchar(25));
	  SELECT @TREEUNIT = CASE 
                     WHEN parent IS NULL THEN tree_unit 
                     ELSE NULL 
                   END 
		FROM   shipping_container 
		WHERE  internal_container_num = @internalcontainernum 

		IF @TREEUNIT IS NOT NULL 
			BEGIN 
				INSERT INTO @LOCATIONTABLE 
				SELECT location 
				FROM   shipping_container 
				WHERE  tree_unit = @TREEUNIT 
						AND item IS NOT NULL 
				GROUP  BY location 
			END 
		ELSE 
			BEGIN 
				INSERT INTO @LOCATIONTABLE 
				SELECT location 
				FROM   shipping_container 
				WHERE  parent = @internalcontainernum 
						OR internal_container_num = @internalcontainernum 
							AND item IS NOT NULL 
				GROUP  BY location 
			END 

		SELECT @LOCATIONCOUNT = Count(*) 
		FROM   @LOCATIONTABLE 

		SELECT @LOCATION = location 
		FROM   @LOCATIONTABLE 

		IF @LOCATIONCOUNT > 1 
			RETURN NULL; 
		ELSE IF @LOCATION IS NOT NULL 
			RETURN @LOCATION; 

		RETURN NULL; 
  END -- END SHIPCONTfn_RtrvCurrentLocation 
