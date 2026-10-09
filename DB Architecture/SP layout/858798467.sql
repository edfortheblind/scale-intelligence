CREATE PROCEDURE WRK_BuildCart(
@workProfile nvarchar(25),
@warehouse nvarchar(25),
@groupNumber nvarchar(50),
@cartSpots integer,
@workprofileSequence numeric(5))  
AS

BEGIN

  Declare @workTypes nvarchar(2000)
  Declare @temp_work_types TABLE (work_type nvarchar(100))  
  
  Select @workTypes = WORK_TYPES from WORK_PROFILE_DETAIL where WORK_PROFILE = @workProfile and SEQUENCE = @workprofileSequence
	
  Insert into @temp_work_types
	Select value from STRING_SPLIT(@workTypes, N',') ;

  BEGIN TRANSACTION 

  Declare @temp_sc_table TABLE 
  (CONTAINER_ID nvarchar(25),
	INTERNAL_CONTAINER_NUM numeric(9),
	CONTAINER_TYPE nvarchar(25),
	GROUP_POSITION numeric(9),
	PRIORITY numeric(3),
	MIN_WORK_ZONE_SEQ numeric(4),
	MAX_WORK_ZONE_SEQ numeric(4),
	AGING_DATE_TIME datetime
	);

	-- Container data is inserted into the table based on work instruction priority decided by -
	-- Priority, Min Zone Sequence, Max Zone Sequence and Aging time
	-- Work should be of type shipment
  Insert into @temp_sc_table 
		(CONTAINER_ID, INTERNAL_CONTAINER_NUM, CONTAINER_TYPE, GROUP_POSITION, PRIORITY, 
		MIN_WORK_ZONE_SEQ, MAX_WORK_ZONE_SEQ, AGING_DATE_TIME)
	select 
		DISTINCT TOP (@cartSpots) sc.CONTAINER_ID, sc.INTERNAL_CONTAINER_NUM, sc.CONTAINER_TYPE, sc.GROUP_POSITION,
		detail.PRIORITY, header.MIN_WORK_ZONE_SEQ, header.MAX_WORK_ZONE_SEQ, detail.AGING_DATE_TIME
	from WORK_INSTRUCTION detail 
		INNER JOIN WORK_INSTRUCTION header on detail.PARENT_INSTR = header.INTERNAL_INSTRUCTION_NUM
		INNER JOIN SHIPPING_CONTAINER sc with (updlock) on sc.CONTAINER_ID = detail.TRANSPORT_CONT_ID 
	where 
		detail.INTERNAL_NUM_TYPE = N'Shipment' and detail.FROM_WHS = @warehouse
		and header.MIN_WORK_ZONE_SEQ is not null and header.MAX_WORK_ZONE_SEQ is not null
		and detail.GROUP_NUM is null and detail.HOLD_CODE is null
		and (sc.GROUP_POSITION = 0 or sc.GROUP_POSITION is null)
		and detail.WORK_TYPE in (select work_type from @temp_work_types)
		ORDER BY detail.PRIORITY asc, header.MIN_WORK_ZONE_SEQ asc, header.MAX_WORK_ZONE_SEQ asc, detail.AGING_DATE_TIME asc

	Declare @counter integer
	Declare @counter_limit integer
	Declare @container_id_temp nvarchar(25)
	Declare @container_type_temp nvarchar(25)
	Declare @internal_container_num_temp numeric(9)
	Declare @spot_table_temp table (SPOT_ASSIGNED numeric(9,0))

	Set @counter = 0
	Select @counter_limit = Count(*) from @temp_sc_table

	WHILE @counter < @counter_limit
	BEGIN
		select @container_id_temp = CONTAINER_ID, @internal_container_num_temp = INTERNAL_CONTAINER_NUM,
				@container_type_temp = CONTAINER_TYPE
				from @temp_sc_table
				ORDER BY PRIORITY asc, MIN_WORK_ZONE_SEQ asc, MAX_WORK_ZONE_SEQ asc, AGING_DATE_TIME asc
				OFFSET @counter ROWS FETCH FIRST 1 ROWS ONLY;

		Set @counter = @counter + 1;

		-- Call to the below stored procedure will update GroupNumber and Group_Position 
		-- values on WorkInstruction and Shipping Containers respectively.
		-- The insert statement is just a way to eat any unnecessary output
		insert into @spot_table_temp exec WRK_UpdateWorkInstructionForCartPicking null, @container_id_temp, @workProfile, @groupNumber, @internal_container_num_temp, 0, 1, 0
	END

  COMMIT TRANSACTION
	
	select DISTINCT sc.CONTAINER_ID, sc.CONTAINER_TYPE, sc.GROUP_POSITION 
		from SHIPPING_CONTAINER sc  inner join WORK_INSTRUCTION wi 
		on sc.CONTAINER_ID = wi.TRANSPORT_CONT_ID
		where wi.GROUP_NUM = @groupNumber and wi.INSTRUCTION_TYPE = N'Detail'
		order by sc.GROUP_POSITION	

END