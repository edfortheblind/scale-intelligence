-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE FUNCTION fn_GetCriticalLevel(@criticalCriteria nVarchar(MAX), @compareValue numeric(9))
RETURNS varchar(50) 
BEGIN
declare @criteriaValue numeric(9);
declare @criticalLevel varchar(50);

DECLARE @temp TABLE( criteria NVARCHAR(MAX) );

INSERT INTO @temp (criteria) VALUES  (@criticalCriteria);

SELECT @criteriaValue = LEFT(subsrt, PATINDEX(N'<literal:1>', subsrt + N'<literal:2>') - 1) 
FROM (
    SELECT subsrt = SUBSTRING(criteria, pos, LEN(criteria))
    FROM (
        SELECT criteria, pos = PATINDEX(N'<literal:3>', criteria)
        FROM @temp
    ) d
) t


IF(CHARINDEX(N'<literal:4>', @criticalCriteria)>0 AND @compareValue >= @criteriaValue)
	SET @criticalLevel =N'<literal:5>';

IF(CHARINDEX(N'<literal:6>', @criticalCriteria)>0 AND @compareValue <= @criteriaValue)
	SET @criticalLevel =N'<literal:7>';

IF(CHARINDEX(N'<literal:8>', @criticalCriteria)>0 AND @compareValue = @criteriaValue)
	SET @criticalLevel =N'<literal:9>';

IF(CHARINDEX(N'<literal:10>', @criticalCriteria)>0 AND @compareValue > @criteriaValue)
	SET @criticalLevel =N'<literal:11>';

IF(CHARINDEX(N'<literal:12>', @criticalCriteria)>0 AND @compareValue < @criteriaValue)
	SET @criticalLevel =N'<literal:13>';


return @criticalLevel;

END;