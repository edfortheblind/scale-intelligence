-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE VIEW SHIPMENT_HEADER_IN_TRANSIT
as

select distinct
            sh.internal_shipment_num,
            loc.location,
            sh.warehouse
      from
            shipment_header sh
            inner join shipment_header_location shl
            on
                 sh.internal_shipment_num = shl.shipment_header
                  
                  INNER JOIN LOCATION loc
                  ON
                        loc.object_id = shl.location
      where sh.trailing_sts < 600

union

     select distinct
            sh.internal_shipment_num,
            wi.to_loc,
            sh.warehouse
      from
            shipment_header sh
            inner join work_instruction wi
            on
                  wi.condition != N'<literal:1>'
                  and
                  wi.internal_num_type in (N'<literal:2>', N'<literal:3>')
                  and
                  wi.internal_num = sh.internal_shipment_num;