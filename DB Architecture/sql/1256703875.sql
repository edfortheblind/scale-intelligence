-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











-- [comment omitted]


CREATE PROCEDURE INV_InsertLotAttributes(
	@lotId			numeric(9),
	@argumentGroupId	nvarchar(32))

AS
       SET NOCOUNT ON;

      	
     
	if @argumentGroupId is not null 
	begin
	    insert into lot_attribute(
		LOT_ID,
		ATTRIBUTE_TEMPLATE_ID,
		VALUE,
		USER_STAMP,
		PROCESS_STAMP,
		DATE_TIME_STAMP
		)
	  select
		 @lotId,
          	 cast(substring(ARGUMENT_VALUE, 1, charindex(N'<literal:1>', ARGUMENT_VALUE)-1) as numeric),
	       	 substring(ARGUMENT_VALUE, charindex(N'<literal:2>', ARGUMENT_VALUE)+1, len(ARGUMENT_VALUE)-charindex(N'<literal:3>', ARGUMENT_VALUE)),
		 N'<literal:4>',
		 N'<literal:5>',
		  GETUTCDATE()
	  FROM
	       INVENTORY_ARGUMENT
	  WHERE
		GROUP_ID = @argumentGroupId
		AND ARGUMENT_NAME = N'<literal:6>' ;
         End;

	return @@ERROR;
 
	
-- [comment omitted]


