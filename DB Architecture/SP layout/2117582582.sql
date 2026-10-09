
CREATE PROCEDURE dbo.cycle_trace 
AS
    EXEC dbo.trace_ILS 0
    exec dbo.trace_ILS 1