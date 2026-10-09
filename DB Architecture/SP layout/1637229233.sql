/*
	Task	| By	| Date			| Modification Description
	-------------------------------------------------
	100711	| MMM	| 07/02/2012	| Created.
	100862	| MMM	| 07/27/2012	| Added new paramenter @startDateTime to append it to the trace file name
*/	

CREATE PROCEDURE PMN_Cycle_Trace (
	@startDateTime varchar(20)
	)
AS
	    EXEC PMN_Trace 0, @startDateTime;
		EXEC PMN_Trace 1, @startDateTime;