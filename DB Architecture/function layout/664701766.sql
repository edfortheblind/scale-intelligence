/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	169243	| KSS	| 03/09/16	| Created	
	
*/

CREATE FUNCTION fn_GetCriticalLevel(@criticalCriteria nVarchar(MAX), @compareValue numeric(9))
RETURNS varchar(50) 
BEGIN
declare @criteriaValue numeric(9);
declare @criticalLevel varchar(50);

DECLARE @temp TABLE( criteria NVARCHAR(MAX) );

INSERT INTO @temp (criteria) VALUES  (@criticalCriteria);

SELECT @criteriaValue = LEFT(subsrt, PATINDEX(N'%[^0-9]%', subsrt + N't') - 1) 
FROM (
    SELECT subsrt = SUBSTRING(criteria, pos, LEN(criteria))
    FROM (
        SELECT criteria, pos = PATINDEX(N'%[0-9]%', criteria)
        FROM @temp
    ) d
) t


IF(CHARINDEX(N'>=', @criticalCriteria)>0 AND @compareValue >= @criteriaValue)
	SET @criticalLevel =N'TRUE';

IF(CHARINDEX(N'<=', @criticalCriteria)>0 AND @compareValue <= @criteriaValue)
	SET @criticalLevel =N'TRUE';

IF(CHARINDEX(N'=', @criticalCriteria)>0 AND @compareValue = @criteriaValue)
	SET @criticalLevel =N'TRUE';

IF(CHARINDEX(N'>', @criticalCriteria)>0 AND @compareValue > @criteriaValue)
	SET @criticalLevel =N'TRUE';

IF(CHARINDEX(N'<', @criticalCriteria)>0 AND @compareValue < @criteriaValue)
	SET @criticalLevel =N'TRUE';


return @criticalLevel;

END;