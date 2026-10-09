
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	185148	| DN	| 10/10/16	| Created.
	189196	| NRJ	| 11/18/16	| Renamed the stored procedure MetaTrans_NewWave to MetaTrans_GetNewWave
	236626	| PMB	| 06/25/19	| added @transfer param to support transfer to other wave feature.
*/


CREATE PROCEDURE MetaTrans_GetNewWave(
@warehouse nvarchar(25),
@culture nvarchar(200),
@username nvarchar(30),
@transfer nvarchar(1) = N'N'
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
	N'' as N'AutoReleased',
	@transfer as N'Transfer';