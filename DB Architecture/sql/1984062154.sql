-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE view SHIPMENT_HEADER_ON_HAND
as
      select distinct
            sh.internal_shipment_num,
            leaf.location,
            sh.WAREHOUSE
      from
            shipment_header sh
            inner join shipping_container leaf
            on
                  sh.internal_shipment_num = leaf.internal_shipment_num
                  and
                  leaf.location is not null;