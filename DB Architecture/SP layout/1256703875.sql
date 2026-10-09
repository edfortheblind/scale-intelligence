/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	17061       | KSP           | 07/20/05  | Created
	191074		| DN			| 01/23/17	| Updated parameter types

	Inserts lot based on supplied information.
	
	Parameters
		lotId,argumentGroupId
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


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
          	 cast(substring(ARGUMENT_VALUE, 1, charindex(N',', ARGUMENT_VALUE)-1) as numeric),
	       	 substring(ARGUMENT_VALUE, charindex(N',', ARGUMENT_VALUE)+1, len(ARGUMENT_VALUE)-charindex(N',', ARGUMENT_VALUE)),
		 N'System',
		 N'INV_InsertLotAttributes',
		  GETUTCDATE()
	  FROM
	       INVENTORY_ARGUMENT
	  WHERE
		GROUP_ID = @argumentGroupId
		AND ARGUMENT_NAME = N'Lot Attributes' ;
         End;

	return @@ERROR;
 
	
-- end INV_InsertLotAttributes


