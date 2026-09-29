-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
-- [comment omitted]


/* [comment omitted] */






-- [comment omitted]





CREATE PROCEDURE MetaTrans_GetTransferContainer(
@internalContainerNum numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;

	-- [comment omitted]
	SELECT N'<literal:1>' AS N'<literal:2>',
	N'<literal:3>' AS N'<literal:4>', 
	SC.INTERNAL_CONTAINER_NUM AS N'<literal:5>',
	SC.COMPANY AS N'<literal:6>',
	SC.CONTAINER_ID AS N'<literal:7>',
	SC.CONTAINER_TYPE AS N'<literal:8>',
	(SELECT STATUS_NAME FROM FUNCTIONAL_AREA_STATUS_FLOW WHERE status = SC.STATUS AND FUNCTIONAL_AREA=N'<literal:9>') AS StatusName,
	SC.VOLUME as Volume,
	SC.VOLUME_UM AS VolumeUm,
	SC.warehouse AS Warehouse,
	SC.WEIGHT as Weight,
	SC.WEIGHT_UM AS WeightUm
	FROM SHIPPING_CONTAINER SC WHERE INTERNAL_CONTAINER_NUM=@internalContainerNum AND CONTAINER_TYPE <> N'<literal:10>';


	SELECT N'<literal:11>' AS N'<literal:12>',
	N'<literal:13>' AS N'<literal:14>', 
	SH.CARRIER AS N'<literal:15>',
	SH.CARRIER_SERVICE AS N'<literal:16>',
	SH.COMPANY AS N'<literal:17>',
	SH.LEADING_STS AS N'<literal:18>',
	SH.INTERNAL_SHIPMENT_NUM AS N'<literal:19>',
	SH.SHIPMENT_ID AS N'<literal:20>',
	SH.TRAILING_STS AS N'<literal:21>',
	SH.Warehouse AS N'<literal:22>'
	FROM SHIPMENT_HEADER SH
	WHERE INTERNAL_SHIPMENT_NUM IN (SELECT INTERNAL_SHIPMENT_NUM FROM SHIPPING_CONTAINER WHERE INTERNAL_CONTAINER_NUM=@internalContainerNum
	 AND CONTAINER_TYPE <> N'<literal:23>');

	SELECT N'<literal:24>' AS N'<literal:25>',
	N'<literal:26>' AS N'<literal:27>', 
	N'<literal:28>' AS N'<literal:29>';