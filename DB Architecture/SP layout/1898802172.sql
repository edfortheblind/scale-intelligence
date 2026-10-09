/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 2/16/2004	| Created.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_ICarrierEDIReference(
    @processStamp nvarchar(100),
    @ratingId nvarchar(25),
    @resourceKey nvarchar(25),
    @symbol nvarchar(50),
    @text nvarchar(2000),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
    @value nvarchar(100) = NULL)
AS
    SET NOCOUNT ON;

	-- return if the rating_id does not exist.
	-- we have to catch this because ratingId names
	-- have changed so many times, both in baselines and
	-- in upgrades.
	if (not exists(select * from rating_id where rating_id = @ratingId))
	begin
		return;
	end;

    INSERT INTO CARRIER_EDI_REFERENCE
        (CUSTOMER,
         DATE_TIME_STAMP,
         PROCESS_STAMP,
         RATING_ID,
         RESOURCE_KEY,
         SHIP_TO,
         SYMBOL,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP,
         VALUE)
    SELECT null, -- customer
           GETUTCDATE(),
           @processStamp,
           @ratingId,
           @resourceKey,
           null, -- shipTo
           @symbol,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'System',
           @value
     WHERE NOT EXISTS(SELECT *
                        FROM CARRIER_EDI_REFERENCE
                       WHERE RATING_ID = @ratingId
                         AND SYMBOL = @symbol
                         AND CUSTOMER IS NULL
                         AND SHIP_TO IS NULL);
                         
    exec dbc_IResourceFileBase 
		@resourceGroup = N'Text',
		@resourceKey = @resourceKey,
		@text = @text,
		@processStamp = @processStamp;

-- end dbc_ICarrierEDIReference