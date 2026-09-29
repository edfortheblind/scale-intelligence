-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE MetaTrans_WavePrinterSelection
(
@internalLaunchNum numeric(9) ,  
@culture nvarchar(10)
)
AS
       SET NOCOUNT ON;

       -- [comment omitted]
       SELECT 
       N'<literal:1>' AS N'<literal:2>',
       N'<literal:3>' AS N'<literal:4>', 
       LAUNCH_STATISTICS.INTERNAL_LAUNCH_NUM AS N'<literal:5>', 
       N'<literal:6>' AS N'<literal:7>' ,
       LAUNCH_STATISTICS.warehouse AS N'<literal:8>'
	   FROM LAUNCH_STATISTICS WHERE
	   CLOSED=N'<literal:9>' AND
	   LAUNCH_STATISTICS.INTERNAL_LAUNCH_NUM = @internalLaunchNum ;

	   
