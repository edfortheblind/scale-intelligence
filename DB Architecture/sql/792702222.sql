-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE GET_SHIPMENT_SECURITY_INFO(@InternalShipmentNum numeric(9)) 
AS	
	DECLARE @SqlString nvarchar(4000) = 
		N'<literal:1>'


;
	DECLARE @HdrCompany nvarchar(25) = (SELECT SH.COMPANY FROM SHIPMENT_HEADER SH WHERE internal_shipment_num = @InternalShipmentNum);

	IF (@HdrCompany is null or @HdrCompany = N'<literal:2>')
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
					DECLARE @CurrentCompany nvarchar(25) = N'<literal:3>';
					DECLARE @CurrentColumnName nvarchar(50) = N'<literal:4>';	
					WHILE @NumberOfCompanies > 0
						BEGIN      
							with Records AS(select row_number() over(order by Company) as N'<literal:5>', * from @TempCompanies) select @CurrentCompany = Company from records where row = @NumberOfCompanies;
							IF (@CurrentCompany IS NULL)
								SET @CurrentCompany = N'<literal:6>';
							SET @CurrentCompany =  replace( @CurrentCompany,    N'<literal:7>', N'<literal:8>' );
							SET @CurrentColumnName = N'<literal:9>' + cast(@NumberOfCompanies as nvarchar(25)) + N'<literal:10>';					  							
							SET @SqlString += N'<literal:11>' + @CurrentCompany +  + N'<literal:12>' + @CurrentColumnName + N'<literal:13>'
							IF @NumberOfCompanies > 1
								SET @SqlString += N'<literal:14>';  													
							SET @NumberOfCompanies = @NumberOfCompanies - 1;
						END		
				END
			ELSE
				SET @SqlString += N'<literal:15>';		
		END		
	ELSE
		SET @SqlString += N'<literal:16>';

	SET @SqlString += N'<literal:17>' + cast(@InternalShipmentNum as nvarchar(25));
	
	EXECUTE sp_executesql  @SqlString;
