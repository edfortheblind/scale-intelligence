/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	  16378     | SAT	    | 4/284/2005 | Created.
	  224179	| SO		| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts. 
*/

CREATE PROCEDURE dbc_IScheduledJobs(
    @jobName nvarchar(25),
    @recordType nvarchar(25),
    @description nvarchar(50),
    @parameterData nvarchar(2000) = NULL,
    @daysToRun nvarchar(7) = NULL,
    @startTime datetime = NULL,
    @endTime datetime = NULL,
    @specificTime datetime = NULL,
    @minFrequence numeric(5) = NULL,
    @daysFrequency numeric(5) = NULL,
    @specialDay nvarchar(10) = NULL,
    @nextRunDateTime datetime = NULL,
    @lastRunDateTime datetime = NULL,
    @active nchar(1),
    @systemCreated nchar(1),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
    @processStamp nvarchar(100) = NULL,
    @userStamp nvarchar(100) = NULL)
AS
begin
    SET NOCOUNT ON;

    INSERT INTO SCHEDULED_JOBS
        (JOB_NAME,
	RECORD_TYPE,
	DESCRIPTION,
	PARAMETER_DATA,
	DAYS_TO_RUN,
	START_TIME,
	END_TIME,
	SPECIFIC_TIME,
	MINUTES_FREQUENCY,
	DAYS_FREQUENCY,
	SPECIAL_DAY,
	NEXT_RUN_DATE_TIME,
	LAST_RUN_DATE_TIME,
	ACTIVE,
	SYSTEM_CREATED,
	USER_DEF1,
	USER_DEF2,
	USER_DEF3,
	USER_DEF4,
	USER_DEF5,
	USER_DEF6,
	USER_DEF7,
	USER_DEF8,
	USER_STAMP,
	PROCESS_STAMP,
	DATE_TIME_STAMP)
    SELECT @jobName,
	   @recordType,
	   @description,
	   @parameterData,
	   @daysToRun,
	   @startTime,
	   @endTime,
	   @specificTime,
	   @minFrequence,
	   @daysFrequency,
	   @specialDay,
	   @nextRunDateTime,
	   @lastRunDateTime,
	   @active,
	   @systemCreated,
	   @userDef1,           
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           @userStamp,
           @processStamp,
           getutcdate() 
     WHERE NOT EXISTS(SELECT *
                        FROM SCHEDULED_JOBS
                       WHERE JOB_NAME = @jobName AND RECORD_TYPE = @recordType);
end --DBC_IScheduledJobs
