-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure CompleteWave_UpdateOdrDtlCond(
	@Condition nvarchar(25),
        @UserStamp nvarchar(30),
        @ProcessStamp nvarchar(100),
		@statusRel numeric(3),
        @statusShipped numeric(3),
        @launchNum numeric(9))

as
	update Order_Detail
        set 
        Condition = @Condition,
        Open_Qty = t.QTY,
        User_Stamp = @UserStamp,
        Process_Stamp = @ProcessStamp,
        Date_Time_Stamp = GETUTCDATE() 

        from Order_Detail od,
        (
            SELECT distinct Internal_Order_Num, Erp_Order_Line_Num, 
            QTY=SUM (   CASE WHEN Status1 >= @statusRel AND Status1 <  @statusShipped THEN Quantity_At_Sts1 ELSE 0.0 END + 
                        CASE WHEN Status2 >= @statusRel AND Status2 <  @statusShipped  THEN Quantity_At_Sts2 ELSE 0.0 END + 
                        CASE WHEN Status3 >= @statusRel AND Status3 <  @statusShipped  THEN Quantity_At_Sts3 ELSE 0.0 END +
                        CASE WHEN Status4 >= @statusRel AND Status4 <  @statusShipped  THEN Quantity_At_Sts4 ELSE 0.0 END +
                        CASE WHEN Status5 >= @statusRel AND Status5 <  @statusShipped  THEN Quantity_At_Sts5 ELSE 0.0 END +
                        CASE WHEN Status6 >= @statusRel AND Status6 <  @statusShipped  THEN Quantity_At_Sts6 ELSE 0.0 END +
                        CASE WHEN Status7 >= @statusRel AND Status7 <  @statusShipped  THEN Quantity_At_Sts7 ELSE 0.0 END +
                        CASE WHEN Status8 >= @statusRel AND Status8 <  @statusShipped  THEN Quantity_At_Sts8 ELSE 0.0 END +
                        CASE WHEN Status9 >= @statusRel AND Status9 <  @statusShipped  THEN Quantity_At_Sts9 ELSE 0.0 END +
                        CASE WHEN Status10 >= @statusRel AND Status10 <  @statusShipped  THEN Quantity_At_Sts10 ELSE 0.0 END
                    )   
            FROM Shipment_Detail WHERE Launch_Num = @launchNum AND Status1 >= @statusRel 
            group by internal_order_num, Erp_order_line_num 
        ) t
        where od.Internal_Order_num=t.INTERNAL_ORDER_NUM
        And od.Erp_Order_Line_Num = t.ERP_ORDER_LINE_NUM 



