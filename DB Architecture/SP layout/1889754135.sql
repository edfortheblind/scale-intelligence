/*  
 Mod Number | Programmer  | Date		| Modification Description  
 --------------------------------------------------------------------  
 19596		| AK		  | 09/13/06	| created  
 13913		| AK		  | 11/15/07	| Modified to set the Mark for fields values to null.  
 191074		| DN		  | 01/23/17	| Updated parameter types
 */  
  
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;  

CREATE PROCEDURE SHP_TransferDtlForShipDistr(  
 @intLineNum numeric(9),  
 @destIntShipNum numeric(9),  
 @destShipId nvarchar(25),  
        @shipTo nvarchar(25))  
   
AS  
begin 
		--update shipment detail
		update shipment_Detail
		set internal_shipment_num = @destIntShipNum,
			      shipment_ID = @destShipId,
                              Ship_To = @shipTo,
                              MARK_FOR = NULL,
                              MARK_FOR_NAME = NULL,
                              MARK_FOR_ADDRESS1 = NULL,
                              MARK_FOR_ADDRESS2 = NULL,
                              MARK_FOR_ADDRESS3 = NULL,
                              MARK_FOR_CITY = NULL,
                              MARK_FOR_STATE = NULL,
                              MARK_FOR_COUNTRY = NULL,
                              MARK_FOR_POSTAL_CODE = NULL,
                              MARK_FOR_PHONE_NUM = NULL,
                              MARK_FOR_FAX_NUM = NULL,
                              MARK_FOR_ATTENTION_TO = NULL,
                              MARK_FOR_EMAIL_ADDRESS = NULL
		where internal_shipment_line_num = @intLineNum

                update comment_text
                set Internal_Num = @destIntShipNum
                where Internal_Line_Num = @intLineNum and
                Record_Type = N'SHIPMENT';

end --SHP_TransferDtlForShipDistr