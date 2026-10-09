/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14965	| AK		    | 02.02.2009| created
	140413  | NVS           | 04/23/14  | Change item length to 50
*/


CREATE PROCEDURE wm_RItem11
	@Item nvarchar(50)
AS
	SELECT * FROM ITEM
	WHERE ITEM = @Item
	AND COMPANY IS NOT NULL
        AND (SELECT COUNT(*) FROM ITEM WHERE ITEM = @Item) = 1



