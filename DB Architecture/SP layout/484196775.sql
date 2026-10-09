-- =============================================
-- Author:		Jimmy
-- Create date: 04/03/2009
-- Description:	Shipped today by minute
-- =============================================
CREATE PROCEDURE [dbo].[PM_SHIPPED_TODAY_BY_MINUTE] 
	-- Add the parameters for the stored procedure here
(
	@DATE_FROM datetime,
	@DATE_TO datetime,
	@DATE_RANGE_COLUMN nvarchar(50),
	@GROUP_BY_COLUMN nvarchar(50),
	@SELECT_COLUMN nvarchar(50),
	@TABLE_NAME nvarchar(50),
	@WAREHOUSE nvarchar(25) = NULL
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE @sql nvarchar(max);
	DECLARE @dataType nvarchar(20);

	SELECT @dataType = DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
	WHERE 
	TABLE_NAME = @Table_Name
	AND 
	COLUMN_NAME = @SELECT_COLUMN;  

SET @sql = '
SELECT Parcel225, Parcel402, LTL225, LTL402, 
Parcel225+Parcel402+LTL225+LTL402 as Total , DateTime
 FROM [VPVDB\SQL2005].viper.dbo.ShipPerMinute 
where DateTime >=DATEADD(dd,DATEDIFF(dd,0,GETDATE()),0)
'

exec dbo.sp_executesql @sql
END