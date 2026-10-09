
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	185148	| DN	| 10/10/16	| Created.
*/


CREATE PROCEDURE [dbo].[MetaTrans_NewWave](
@warehouse nvarchar(25),
@culture nvarchar(100),
@username nvarchar(30)
)

AS
	SET NOCOUNT ON;				
	SELECT N'SCALAR' AS N'EntityType',
	N'NewWave' AS N'EntityName',
	@warehouse as N'Warehouse',
	N'' as N'Company'	,
	N'' as N'WaveMaster',
	N'' as N'WaveName',
	N'' as N'WaveFlow',
	N'' as N'AutoReleased';