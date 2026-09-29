-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






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
 case when (ASSIGN_MULTIPLE_WORK_UNITS = N'<literal:1>') then N'<literal:2>' else N'<literal:3>' end as AssignMultipleWorkUnits,  
 case when (WORK_UNIT_RENAME_ENABLED =N'<literal:4>')  then N'<literal:5>' else N'<literal:6>' end as DisplayNewWorkUnitField,  
 case when (@allowWorkSelectionOnSystemDirectedWork = N'<literal:7>' AND WORK_UNIT_RENAME_ENABLED =N'<literal:8>') then N'<literal:9>' else N'<literal:10>' end as AllowWorkSelectionOnSystemDirectedWork,  
 case when (@allowWorkSelectionOnSystemDirectedWork = N'<literal:11>') then N'<literal:12>' else N'<literal:13>' end as ContinueToNextFlowForNewWorkUnitEntry, 
 case when (WORK_UNIT_RENAME_ENABLED =N'<literal:14>')  then N'<literal:15>'   
   else N'<literal:16>' end as uri,  
   @userName as UserName,  
   @culture as Culture,
   @locationClass as LocationClass,
 case when (WORK_UNIT_RENAME_ENABLED = N'<literal:17>') then N'<literal:18>' else N'<literal:19>' end as NewWorkUnitEntryTitle
 from WORK_PROFILE_DETAIL   
 where WORK_PROFILE=@workProfileName and SEQUENCE=@workProfileSequence;