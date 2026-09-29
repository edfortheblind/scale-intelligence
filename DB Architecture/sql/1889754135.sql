-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





  
  
-- [comment omitted]

CREATE PROCEDURE SHP_TransferDtlForShipDistr(  
 @intLineNum numeric(9),  
 @destIntShipNum numeric(9),  
 @destShipId nvarchar(25),  
        @shipTo nvarchar(25))  
   
AS  
begin 
		-- [comment omitted]
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
                Record_Type = N'<literal:1>';

end -- [comment omitted]