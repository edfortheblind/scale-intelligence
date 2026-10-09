/*
Mod Number | Programmer | Date     | Modification Description
--------------------------------------------------------------------
158153     | SP         | 03/16/15 | Created.

Procedure to get current build version as string for the Configuration Coordinator toolbox utility
*/

CREATE PROCEDURE SpGetBuildVersion
AS BEGIN
	DECLARE @BUILD NVARCHAR(50)
	SELECT @BUILD = BUILD FROM VERSION
	SELECT SUBSTRING(@BUILD,0, CHARINDEX(N'.',@BUILD)) + N'.0.0.0';
END