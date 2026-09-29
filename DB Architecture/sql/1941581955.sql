-- DOCUMENTATION ONLY: literals/comments removed; do not execute.





/* [comment omitted] */





CREATE PROCEDURE [dbo].[EXP_WorkCreationAfterExitPoint]
    @SESSIONVALUE xml,
    @PROCESS nvarchar(max),
	@LAUNCHNUM nvarchar(max)
AS

BEGIN

	/* [comment omitted] */

	UPDATE WORK_INSTRUCTION
	SET OUTGOING_PD_LOC = 
		CASE 
			WHEN FROM_TEMPL_FIELD2 = '<literal:1>' and FROM_TEMPL_FIELD3 in ('<literal:2>','<literal:3>') THEN '<literal:4>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:5>' and FROM_TEMPL_FIELD3 in ('<literal:6>','<literal:7>') THEN '<literal:8>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:9>' and FROM_TEMPL_FIELD3 in ('<literal:10>','<literal:11>') THEN '<literal:12>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:13>' and FROM_TEMPL_FIELD3 in ('<literal:14>','<literal:15>') THEN '<literal:16>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:17>' and FROM_TEMPL_FIELD3 in ('<literal:18>','<literal:19>') THEN '<literal:20>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:21>' and FROM_TEMPL_FIELD3 in ('<literal:22>','<literal:23>') THEN '<literal:24>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:25>' and FROM_TEMPL_FIELD3 in ('<literal:26>','<literal:27>') THEN '<literal:28>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:29>' and FROM_TEMPL_FIELD3 in ('<literal:30>','<literal:31>') THEN '<literal:32>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:33>' and FROM_TEMPL_FIELD3 in ('<literal:34>','<literal:35>') THEN '<literal:36>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:37>' and FROM_TEMPL_FIELD3 in ('<literal:38>','<literal:39>') THEN '<literal:40>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:41>' and FROM_TEMPL_FIELD3 in ('<literal:42>','<literal:43>') THEN '<literal:44>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:45>' and FROM_TEMPL_FIELD3 in ('<literal:46>','<literal:47>') THEN '<literal:48>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:49>' and FROM_TEMPL_FIELD3 in ('<literal:50>','<literal:51>') THEN '<literal:52>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:53>' and FROM_TEMPL_FIELD3 in ('<literal:54>','<literal:55>') THEN '<literal:56>' 
			WHEN FROM_TEMPL_FIELD2 = '<literal:57>' and FROM_TEMPL_FIELD3 in ('<literal:58>','<literal:59>') THEN '<literal:60>' 
		end
	WHERE INTERNAL_INSTRUCTION_NUM in (
		SELECT 
			INTERNAL_INSTRUCTION_NUM
		FROM WORK_INSTRUCTION WITH(NOLOCK)
		WHERE LAUNCH_NUM = @LAUNCHNUM
			-- [comment omitted]
			AND CONDITION = '<literal:61>'
			AND WORK_GROUP IN (N'<literal:62>')
			AND INSTRUCTION_TYPE = N'<literal:63>'
			AND WORK_TYPE IN (
				'<literal:64>', 
				'<literal:65>',
				'<literal:66>',
				'<literal:67>'
					)
			AND FROM_TEMPL_FIELD1 = '<literal:68>'
			AND FROM_TEMPL_FIELD2 = '<literal:69>'
			AND TO_TEMPL_FIELD1 = '<literal:70>'
			AND TO_TEMPL_FIELD2 IN ('<literal:71>','<literal:72>','<literal:73>')
			)

	/* [comment omitted] */

	IF EXISTS (SELECT 1 FROM sys.objects WHERE [name] = N'<literal:74>')
	BEGIN 
		EXEC TRAV_EX08_WorkCreationAfterExitPoint @SESSIONVALUE, @PROCESS, @LAUNCHNUM
	END

 END