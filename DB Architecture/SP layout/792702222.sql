/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	177912	| RS	| 05/23/16	| Created.
	191074	| DN	| 01/23/17	| Updated parameter types
*/


CREATE PROCEDURE GET_SHIPMENT_SECURITY_INFO(@InternalShipmentNum numeric(9)) 
AS	
	DECLARE @SqlString nvarchar(4000) = 
		N'SELECT N''SCALAR'' AS N''EntityType'',
		N''Security'' AS N''EntityName'',
		SH.WAREHOUSE AS N''HdrWarehouse'',
		';
	DECLARE @HdrCompany nvarchar(25) = (SELECT SH.COMPANY FROM SHIPMENT_HEADER SH WHERE internal_shipment_num = @InternalShipmentNum);

	IF (@HdrCompany is null or @HdrCompany = N'')
		BEGIN
			DECLARE @TempCompanies TABLE (
				Company NVARCHAR(25)
			);		

			INSERT INTO @TempCompanies
			SELECT DISTINCT(SD.COMPANY)
			FROM SHIPMENT_HEADER SH inner join SHIPMENT_DETAIL SD
			ON SH.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM
			WHERE SH.INTERNAL_SHIPMENT_NUM = @InternalShipmentNum;	
											
			DECLARE @NumberOfCompanies int;			
			SET @NumberOfCompanies = (select count(*) from @TempCompanies);
						
			IF @NumberOfCompanies > 0
				BEGIN
					DECLARE @CurrentCompany nvarchar(25) = N'';
					DECLARE @CurrentColumnName nvarchar(50) = N'';	
					WHILE @NumberOfCompanies > 0
						BEGIN      
							with Records AS(select row_number() over(order by Company) as N'row', * from @TempCompanies) select @CurrentCompany = Company from records where row = @NumberOfCompanies;
							IF (@CurrentCompany IS NULL)
								SET @CurrentCompany = N'';
							SET @CurrentCompany =  replace( @CurrentCompany,    N'''', N'''''' );
							SET @CurrentColumnName = N'Dtl' + cast(@NumberOfCompanies as nvarchar(25)) + N'Company';					  							
							SET @SqlString += N'''' + @CurrentCompany +  + N''' AS N''' + @CurrentColumnName + N''''
							IF @NumberOfCompanies > 1
								SET @SqlString += N',';  													
							SET @NumberOfCompanies = @NumberOfCompanies - 1;
						END		
				END
			ELSE
				SET @SqlString += N'SH.COMPANY AS N''HdrCompany''';		
		END		
	ELSE
		SET @SqlString += N'SH.COMPANY AS N''HdrCompany''';

	SET @SqlString += N' FROM SHIPMENT_HEADER SH WHERE SH.INTERNAL_SHIPMENT_NUM = ' + cast(@InternalShipmentNum as nvarchar(25));
	
	EXECUTE sp_executesql  @SqlString;
