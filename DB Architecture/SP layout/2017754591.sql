/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	251298      | NRJ			| 05/19/20	| Created.
	254862		| PMB			| 07/27/20	| Modified to support work unit selection on locaiton.
	254862		| PMB			| 30/07/20	| Modified to update the title when work unit selection is enabled at location.
*/
CREATE PROCEDURE SRC_SystemDirectedWorkConfiguratorModel(
	@userName nvarchar(30),
	@culture nvarchar(10),
	@workProfileName nvarchar(25),
	@workProfileSequence numeric(5),
	@fromLocation nvarchar(25),
	@warehouse nvarchar(25))
AS
	SET NOCOUNT ON;

declare @allowWorkSelectionOnSystemDirectedWork nvarchar(25); 
declare @locationClass nvarchar(25);
  
	select 
		@allowWorkSelectionOnSystemDirectedWork = ALLOW_WORK_SELECT_ON_SYS_DIR
		,@locationClass = LOCATION_CLASS 
	from Location where LOCATION = @fromLocation and warehouse =@warehouse;  
  
 select top 1  
 case when (ASSIGN_MULTIPLE_WORK_UNITS = N'Y') then N'true' else N'false' end as AssignMultipleWorkUnits,  
 case when (WORK_UNIT_RENAME_ENABLED =N'Y')  then N'true' else N'false' end as DisplayNewWorkUnitField,  
 case when (@allowWorkSelectionOnSystemDirectedWork = N'Y' AND WORK_UNIT_RENAME_ENABLED =N'N') then N'true' else N'false' end as AllowWorkSelectionOnSystemDirectedWork,  
 case when (@allowWorkSelectionOnSystemDirectedWork = N'Y') then N'false' else N'true' end as ContinueToNextFlowForNewWorkUnitEntry, 
 case when (WORK_UNIT_RENAME_ENABLED =N'Y')  then N'/outbound/scaleapi/WorkExecutionApi/renamed-WorkUnit'   
   else N'/outbound/scaleapi/WorkInstructionsApi/workInstructions' end as uri,  
   @userName as UserName,  
   @culture as Culture,
   @locationClass as LocationClass,
 case when (WORK_UNIT_RENAME_ENABLED = N'Y') then N'SYSTEM_DIRECTED' else N'UI_SYSDIRWUSELECT' end as NewWorkUnitEntryTitle
 from WORK_PROFILE_DETAIL   
 where WORK_PROFILE=@workProfileName and SEQUENCE=@workProfileSequence;