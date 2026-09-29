-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */























CREATE procedure SHP_UpdateGroupPosition( @renameContainer bit,
	@assignSpot bit,
    @groupNum nvarchar(50) ,
    @contId nvarchar(25) ,
    @internalContNum numeric(9),
    @spotNumber numeric(9) )  
	AS
BEGIN 

	if (@assignSpot = 1 AND @spotNumber = 0) 
		BEGIN
		/* [comment omitted] */
			SELECT
			   @spotNumber = MAX(SC.GROUP_POSITION)  + 1
			FROM
			   SHIPPING_CONTAINER SC,
				WORK_INSTRUCTION WI
			WHERE
			   WI.GROUP_NUM = @groupNum
			   AND WI.INTERNAL_CONTAINER_NUM > 0
			   AND WI.TRANSPORT_CONT_ID = SC.CONTAINER_ID ; 
		END

	if @spotNumber IS NULL
		BEGIN
			SET @spotNumber = 0;
		END

	if @renameContainer = 1
		BEGIN
		/* [comment omitted] */
			UPDATE
			   SHIPPING_CONTAINER
			SET
			   CONTAINER_ID =(CASE WHEN PARENT is not null THEN CONTAINER_ID ELSE @contId END) ,
			   PARENT_CONTAINER_ID = (CASE WHEN INTERNAL_SHIPMENT_LINE_NUM > 0 THEN @contId ELSE PARENT_CONTAINER_ID END),
			   GROUP_POSITION = (CASE WHEN @assignSpot = 1 AND @spotNumber > 0 THEN @spotNumber ELSE GROUP_POSITION END),
			   GROUP_NUM = @groupNum
			WHERE
			   INTERNAL_CONTAINER_NUM = @internalContNum OR PARENT = @internalContNum;
		END 
   ELSE 
	   BEGIN
		UPDATE
		  SHIPPING_CONTAINER
		SET
		  GROUP_POSITION = (CASE WHEN @assignSpot = 1 AND @spotNumber > 0 THEN @spotNumber ELSE GROUP_POSITION END),
		  GROUP_NUM = @groupNum
		WHERE
		  INTERNAL_CONTAINER_NUM = @internalContNum OR PARENT = @internalContNum;
	   END 

	   SELECT @spotNumber;
	   
END
