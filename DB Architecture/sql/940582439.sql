-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







 
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
 
    RAISERROR(N'<literal:1>', 0,1) with nowait;
 
    declare @stSessionDebug nvarchar(max);
    declare @stUserName nvarchar(30);
    declare @stWarehouse nvarchar(25);
    declare @maxQty int; 
 
    -- [comment omitted]
    declare @stHTML nvarchar(max);
    declare @stMsg nvarchar(max);
    
    -- [comment omitted]
    set @stHTML = N'<literal:2>';
 
    set @stSessionDebug = cast(@SESSIONVALUE as nvarchar(max));
    RAISERROR (N'<literal:3>', 0, 1, @stSessionDebug) WITH NOWAIT
 
    -- [comment omitted]
    EXEC GetXMLAttributeValueByAttributeName @SESSIONVALUE,N'<literal:4>',@stWarehouse OUTPUT
    -- [comment omitted]
    EXEC GetXMLAttributeValueByAttributeName @SESSIONVALUE,N'<literal:5>',@stUserName OUTPUT
 
    set @maxQty = (SELECT SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WITH(NOLOCK) WHERE RECORD_TYPE = N'<literal:6>' AND SYS_KEY = N'<literal:7>');
 
    RAISERROR (N'<literal:8>', 0, 1, @maxQty) WITH NOWAIT
 
    set @stMsg = '<literal:9>' + cast(@maxQty as nvarchar) + '<literal:10>'
    
    set @stHTML = @stHTML + char(13) + char(13) + '<literal:11>' + cast(@maxQty as nvarchar) + '<literal:12>' + char(13) + '<literal:13>' 
        + char(13) +  char(9) + '<literal:14>' + @stMsg + '<literal:15>' + char(13) + char(9) + '<literal:16>'
        + char(13) + char(9) + '<literal:17>'
        + char(13) + '<literal:18>' + char(13) + char(13);
    
    -- [comment omitted]
    if(len(@stHTML) > 0)
    begin
        set @RETURNVALUE = @stHTML;
    end
    else
    begin
        set @RETURNVALUE = null;
    end;
 
    RAISERROR (N'<literal:19>', 0, 1, @RETURNVALUE) WITH NOWAIT
 
    RAISERROR(N'<literal:20>', 0,1) with nowait;
