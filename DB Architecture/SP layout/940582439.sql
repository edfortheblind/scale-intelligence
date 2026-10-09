/*
 Mod     | Programmer    | Date       | Modification Description
 --------------------------------------------------------------------   
         | jelliott         | 02-16-2020 | Stored Procedure for exit point:RF Check In - Add Validation JavaScript
		 
		 Replace TRAV with Client Code
 
*/
 
CREATE PROCEDURE [dbo].[TRAV_EXP_RfCheckInAddValidationJavascript] (
    @SESSIONVALUE xml,
    @INTERNALRECEIPTNUM numeric(9,0),
    @INTERNALRECEIPTLINENUM numeric(9,0),
    @ITEM nvarchar(50),
    @COMPANY nvarchar(25),
    @LOT nvarchar(25),
    @OPENQUANTITY numeric(28,13),
    @RECEIVINGPREFERENCE nvarchar(25),
    @ALLOWOVERRECEIVING nchar(1),
    @RETURNVALUE nvarchar(max) output
)
AS 
    SET NOCOUNT ON; 
 
    RAISERROR(N'TRAV_EXP_RfCheckInAddValidationJavascript: LogStart', 0,1) with nowait;
 
    declare @stSessionDebug nvarchar(max);
    declare @stUserName nvarchar(30);
    declare @stWarehouse nvarchar(25);
    declare @maxQty int; 
 
    --Variable Declarations
    declare @stHTML nvarchar(max);
    declare @stMsg nvarchar(max);
    
    --Start the HTML variable as an empty string so that it can be built.
    set @stHTML = N'';
 
    set @stSessionDebug = cast(@SESSIONVALUE as nvarchar(max));
    RAISERROR (N'TRAV_EXP_RfCheckInAddValidationJavascript: @stSessionDebug: %s', 0, 1, @stSessionDebug) WITH NOWAIT
 
    --CurrentWarehouse
    EXEC GetXMLAttributeValueByAttributeName @SESSIONVALUE,N'Session/CurrentWarehouse',@stWarehouse OUTPUT
    --User
    EXEC GetXMLAttributeValueByAttributeName @SESSIONVALUE,N'Session/User',@stUserName OUTPUT
 
    set @maxQty = (SELECT SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WITH(NOLOCK) WHERE RECORD_TYPE = N'RECEIVING' AND SYS_KEY = N'10000');
 
    RAISERROR (N'TRAV_EXP_RfCheckInAddValidationJavascript: @maxQty: %i', 0, 1, @maxQty) WITH NOWAIT
 
    set @stMsg = 'Quantity exceeds Max Check-In Quantity of ' + cast(@maxQty as nvarchar) + ', please enter a smaller quantity.'
    
    set @stHTML = @stHTML + char(13) + char(13) + 'if(trim(Form1.BASEQTY.value) > ' + cast(@maxQty as nvarchar) + ')' + char(13) + '{' 
        + char(13) +  char(9) + 'alert("' + @stMsg + '");' + char(13) + char(9) + 'Form1.BASEQTY.focus();'
        + char(13) + char(9) + 'return false;'
        + char(13) + '}' + char(13) + char(13);
    
    --If the length of the HTML is greater than zero then set this as the return value;
    if(len(@stHTML) > 0)
    begin
        set @RETURNVALUE = @stHTML;
    end
    else
    begin
        set @RETURNVALUE = null;
    end;
 
    RAISERROR (N'TRAV_EXP_RfCheckInAddValidationJavascript: @RETURNVALUE: %s', 0, 1, @RETURNVALUE) WITH NOWAIT
 
    RAISERROR(N'TRAV_EXP_RfCheckInAddValidationJavascript: LogEnd', 0,1) with nowait;
