/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	16446	| MD		| 2005.03.21	| Created.
*/






CREATE PROCEDURE wm_RCompany02
	@Company nvarchar(25)
AS
	 SELECT *
     	   FROM COMPANY
		WHERE COMPANY = @Company AND ACTIVE = N'Y'


