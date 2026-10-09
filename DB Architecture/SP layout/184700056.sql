/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	19056       | RAB           | 6/12/2006  | Created.

	Inserts a record for dbChange scripts.
*/

CREATE PROCEDURE dbc_IRatingId(
    @active nchar(1),
    @carrierSymbol nvarchar(50),
    @ediTransmitFromPro nchar(1),
    @manifestingRequired nchar(1),
    @processStamp nvarchar(100),
    @rateAtShipmentLevel nchar(1),
    @rateIntlAtShipmentLvl nchar(1),
    @ratingId nvarchar(25),
    @serverSymbol nvarchar(50),
    @updateContAtMfstClose nchar(1),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL)
AS
    SET NOCOUNT ON;

    INSERT INTO RATING_ID
        (ACTIVE,
         CARRIER_SYMBOL,
         DATE_TIME_STAMP,
         EDI_TRANSMIT_FROM_PRO,
         MANIFESTING_REQUIRED,
         PROCESS_STAMP,
         RATE_AT_SHIPMENT_LEVEL,
         RATE_INTL_AT_SHIPMENT_LVL,
         RATING_ID,
         SERVER_SYMBOL,
         SYSTEM_CREATED,
         UPDATE_CONT_AT_MFST_CLOSE,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT @active,
           @carrierSymbol,
           GETUTCDATE(),
           @ediTransmitFromPro,
           @manifestingRequired,
           @processStamp,
           @rateAtShipmentLevel,
           @rateIntlAtShipmentLvl,
           @ratingId,
           @serverSymbol,
           N'Y',
           @updateContAtMfstClose,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'System'
     WHERE NOT EXISTS(SELECT *
                        FROM RATING_ID
                       WHERE RATING_ID = @ratingId);
-- end dbc_IRatingId
