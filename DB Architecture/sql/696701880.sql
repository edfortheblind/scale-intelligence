-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE FUNCTION fn_GetMonitorFilterParameters(@filterCriteria nVarchar(MAX))
RETURNS @criteriaTempTable TABLE (
   filterName nVarchar(300),
   filterValue nVarchar(300)
) 
AS
BEGIN
   DECLARE @criteriaIndex int
       DECLARE @criteriaSlice nVarchar(100)
       DECLARE @tempCriteriaIndex int
       DECLARE @tempFilterValueSlice nVarchar(500)
       Declare @slice nVarchar(100)
       declare @indx int

/* [comment omitted] */
  SELECT @criteriaIndex = 1
       IF len(@filterCriteria)>1
              BEGIN  
              WHILE @criteriaIndex!= 0
              BEGIN
                     SET @tempFilterValueSlice = SUBSTRING(@filterCriteria, 0 ,CHARINDEX(N'<literal:1>', @filterCriteria) + 1)
                     IF(LEN(@tempFilterValueSlice) <= 0)
                           SET @tempFilterValueSlice = SUBSTRING(@filterCriteria, 0 ,charindex(N'<literal:2>',@filterCriteria))
                                         
                     SET @criteriaIndex = LEN(@tempFilterValueSlice) - CHARINDEX(N'<literal:3>',REVERSE(@tempFilterValueSlice))+1
                     IF @criteriaIndex>1
                           SET @criteriaSlice = left(@filterCriteria,@criteriaIndex-1)
                     ELSE
                           BEGIN
                                  SET @criteriaIndex = charindex(N'<literal:4>',@filterCriteria)
                                  IF @criteriaIndex!=0
                                         SET @criteriaSlice = left(@filterCriteria,@criteriaIndex - 1)
                                  ELSE
                                         SET @criteriaSlice = @filterCriteria
                           END

                     IF(len(@criteriaSlice)>0)
                           BEGIN
                                  SET @indx = charindex(N'<literal:5>',@criteriaSlice)
                                  IF @criteriaIndex!=0 AND @indx > 0 
                                      INSERT INTO @criteriaTempTable(filterName, filterValue) VALUES(RTRIM(LTRIM(left(@criteriaSlice,@indx-1))), RTRIM(LTRIM(right(@criteriaSlice,len(@criteriaSlice) - @indx))) )                                             

                                         
                                  ELSE
                                         BEGIN
                                                SET @indx = charindex(N'<literal:6>',@criteriaSlice)
                                                IF @criteriaIndex!=0 AND @indx > 0 
                                                       INSERT INTO @criteriaTempTable(filterName, filterValue) VALUES(RTRIM(LTRIM(left(@criteriaSlice,@indx-1))), RTRIM(LTRIM(right(@criteriaSlice,len(@criteriaSlice) - @indx))) )                            

                                                          
                            ELSE
                                                       BEGIN
                                                              SET @indx = charindex(N'<literal:7>',@criteriaSlice)
                                                              IF @criteriaIndex!=0 AND @indx > 0 
                                                              INSERT INTO @criteriaTempTable(filterName, filterValue) VALUES(RTRIM(LTRIM(left(@criteriaSlice,@indx-1))), RTRIM(LTRIM(right(@criteriaSlice,len(@criteriaSlice) - @indx))) )                     

                                                                 
                                                       END
                      END                                                                                            
                           END
                     SET @filterCriteria = right(@filterCriteria,len(@filterCriteria) - @criteriaIndex)
                     IF len(@filterCriteria) = 0 BREAK
              END
       END
   RETURN
END;