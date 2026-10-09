/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	80054		| AG		| 02/03/11	| Created.	 
	144345		| JS		| 07/07/14	| Modified logic for nested containers.
	165369		| MMM		| 08/26/15	| Updated second level container count in single query instead of doing it in a while loop and first level update is still done in while loop to avoid blocking due to huge update in a single query

	Parameters
		numeric(9,0)	@internalShipmentNumber		Shipment for which containers have to be considered
*/

CREATE PROCEDURE SHP_SetXOfYForShipment(
	@internalShipmentNumber numeric(9)
	)
AS
	SET NOCOUNT ON;
	
	DECLARE @LoopId  int;
	DECLARE @currentInternalId numeric(9,0);
	DECLARE @TotalContainerCount int;
	
	DECLARE @LevelOneContainersInShipment TABLE 
	( 
		LoopId  int  not null  identity(1,1),
		InternalId  numeric(9,0)  not null 
	);
	
	DECLARE @LevelTwoContainersInShipment TABLE 
	( 
		LoopId  int  not null  identity(1,1),
		InternalId  numeric(9,0)  not null 
	);
	
	INSERT INTO @LevelOneContainersInShipment (InternalId) 
		SELECT SC.INTERNAL_CONTAINER_NUM 
			FROM SHIPPING_CONTAINER SC WITH (NOLOCK)
			WHERE SC.INTERNAL_SHIPMENT_NUM = @internalShipmentNumber
			AND SC.CONTAINER_ID is not null
			AND SC.TREE_UNIT = SC.INTERNAL_CONTAINER_NUM
			AND SC.PARENT IS NULL
			ORDER BY SC.INTERNAL_CONTAINER_NUM;
			
	
	SELECT @LoopId = 1;
	SELECT @TotalContainerCount = COUNT(*) from @LevelOneContainersInShipment;
	
	WHILE @LoopId <= @TotalContainerCount 
	BEGIN 
		SELECT @currentInternalId = InternalId from @LevelOneContainersInShipment
			WHERE LoopId = @LoopId;
			
		UPDATE SHIPPING_CONTAINER 
			SET CONTAINER_COUNT_TOTAL = @TotalContainerCount,
				CONTAINER_COUNT_NUMBER = @LoopId
			WHERE INTERNAL_CONTAINER_NUM = @currentInternalId;
			
		SET @LoopId = @LoopId + 1;
	END 
	
	INSERT INTO @LevelTwoContainersInShipment (InternalId) 
		SELECT SC.INTERNAL_CONTAINER_NUM 
			FROM SHIPPING_CONTAINER SC WITH (NOLOCK)
			WHERE SC.INTERNAL_SHIPMENT_NUM = @internalShipmentNumber
			AND SC.CONTAINER_ID is not null
			AND SC.PARENT IN (SELECT DISTINCT InternalId FROM @LevelOneContainersInShipment)
			ORDER BY SC.INTERNAL_CONTAINER_NUM;
	
		UPDATE SHIPPING_CONTAINER 
		SET CONTAINER_COUNT_TOTAL = 0,
			CONTAINER_COUNT_NUMBER = 0
		WHERE INTERNAL_CONTAINER_NUM IN (SELECT InternalId from @LevelTwoContainersInShipment);