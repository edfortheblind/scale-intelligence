-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




	

CREATE PROCEDURE PMN_Cycle_Trace (
	@startDateTime varchar(20)
	)
AS
	    EXEC PMN_Trace 0, @startDateTime;
		EXEC PMN_Trace 1, @startDateTime;