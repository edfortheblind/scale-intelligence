/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	247220	| TDA	| 03/27/20	| Created.
	249201	| HN	| 04/12/20	| Modified column name.
*/
CREATE PROCEDURE WHSM_InsightDetailPaneData(@objectId numeric(9), @culture nvarchar(10))  
AS 
BEGIN

select top 1 N'SCALAR' AS SCALAR,
       WM.OBJECT_ID as ObjectId
      ,WM.MENU_OPTION_NAME as MenuOptionName
      ,WM.SUBMENU_NAME as SubmenuName
      ,dbo.GENCONFIGfn_RtrvDesc(N'WHSMOBILEWORKFLOW', WM.SRC_IDENTIFIER) as SRCIdentifier
      ,PARENT.MENU_OPTION_NAME as PARENT
 FROM WAREHOUSE_MOBILE_MENU WM
 LEFT OUTER JOIN  WAREHOUSE_MOBILE_MENU PARENT
 ON WM.PARENT_OBJECT_ID = PARENT.OBJECT_ID
 WHERE
 WM.OBJECT_ID = @objectId

END






