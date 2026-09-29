-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











	

CREATE PROCEDURE MetaTrans_GetMonitoringBuilderModel(
@internalFormId numeric(5), @culture nvarchar(10))

AS
	SET NOCOUNT ON;

	-- [comment omitted]
	SELECT N'<literal:1>' AS N'<literal:2>',
	N'<literal:3>' AS N'<literal:4>', 
	case when @internalFormId = 0 then (select max(form_Id)+1 from form) else @internalFormId end AS N'<literal:5>',
	N'<literal:6>' AS N'<literal:7>', 
	N'<literal:8>' AS N'<literal:9>', 
	N'<literal:10>' AS N'<literal:11>';

	SELECT N'<literal:12>' AS N'<literal:13>',
	N'<literal:14>' AS N'<literal:15>',
	N'<literal:16>' AS N'<literal:17>';


	SELECT N'<literal:18>' AS N'<literal:19>',
	N'<literal:20>' AS N'<literal:21>',
	N'<literal:22>' AS N'<literal:23>';

	SELECT N'<literal:24>' AS N'<literal:25>',
	N'<literal:26>' AS N'<literal:27>',
	N'<literal:28>' AS N'<literal:29>',
	N'<literal:30>' AS N'<literal:31>',
	N'<literal:32>' AS N'<literal:33>',
	N'<literal:34>' AS N'<literal:35>';

	SELECT N'<literal:36>' AS N'<literal:37>',
	N'<literal:38>' AS N'<literal:39>',
	N'<literal:40>' AS N'<literal:41>';



