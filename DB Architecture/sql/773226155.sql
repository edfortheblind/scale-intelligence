-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]

-- [comment omitted]


/* [comment omitted] */






-- [comment omitted]



CREATE PROCEDURE MetaTrans_GetLookup(
@recordType nvarchar(50), @passedWhsVal nvarchar(200), @passedWhsFld nvarchar(50), @culture nvarchar(10))
-- [comment omitted]
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	
	begin 		
		SELECT 
			N'<literal:1>' AS N'<literal:2>',
			N'<literal:3>' AS N'<literal:4>', 
			@recordType AS N'<literal:5>', 
			LR.TABLE_FIELD1 AS N'<literal:6>',
			LR.TABLE_FIELD2 AS N'<literal:7>', 
			LR.TABLE_FIELD3 AS N'<literal:8>',
			LR.TABLE_FIELD4 AS N'<literal:9>', 
			LR.TABLE_FIELD5 AS N'<literal:10>',
			LR.TABLE_FIELD6 AS N'<literal:11>',
			LR.TABLE_FIELD7 AS N'<literal:12>',
			LR.TABLE_FIELD8 AS N'<literal:13>',
			LR.TABLE_FIELD9 AS N'<literal:14>',
			LR.TABLE_FIELD10 AS N'<literal:15>',
			LR.TABLE_FIELD1_TYPE AS N'<literal:16>',
			LR.TABLE_FIELD2_TYPE AS N'<literal:17>',
			LR.TABLE_FIELD3_TYPE AS N'<literal:18>',
			LR.TABLE_FIELD4_TYPE AS N'<literal:19>',
			LR.TABLE_FIELD5_TYPE AS N'<literal:20>',
			LR.TABLE_FIELD6_TYPE AS N'<literal:21>',
			LR.TABLE_FIELD7_TYPE AS N'<literal:22>',
			LR.TABLE_FIELD8_TYPE AS N'<literal:23>',
			LR.TABLE_FIELD9_TYPE AS N'<literal:24>',
			LR.TABLE_FIELD10_TYPE AS N'<literal:25>',			
			@passedWhsVal as N'<literal:26>', 
			@passedWhsFld as N'<literal:27>', 
			N'<literal:28>' AS N'<literal:29>', 
			N'<literal:30>'  AS N'<literal:31>'
		FROM 
			LOOKUP_REFERENCE LR
		WHERE 
			RECORD_TYPE=@recordType
	end 
	