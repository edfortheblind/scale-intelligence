/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14660	| LJM			| 05/20/04	| created
	16780	| TDL			| 09/07/05	| Force Recompile
*/


CREATE PROCEDURE wm_RUploadOrderHeader02
AS
	-- #DEFINE WMW.Jsharp.Interface.BL com.pronto.bl.opr.ShippingStandardInterface ShippingStandardInterface;

	SELECT *
	FROM UPLOAD_ORDER_HEADER
	WHERE INTERFACE_CONDITION = N'System Deletion';