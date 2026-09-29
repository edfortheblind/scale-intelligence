-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE VIEW SHIPPING_CONTAINER_IN_TRANSIT
as
select distinct
            sc.internal_container_num,
            loc.location,
			sc.warehouse
      from
            shipping_container sc
            inner join shipping_container_location scl
            on
                 sc.internal_container_num = scl.shipping_container
                  INNER JOIN LOCATION loc
                  ON
                        loc.object_id = scl.location
					and loc.warehouse = sc.warehouse
	  where sc.status < 600
      union
select distinct 
			case when sc.tree_unit != sc.internal_container_num then sc.tree_unit else sc.internal_container_num end INTERNAL_CONTAINER_NUM,
            wi.to_loc,
			sc.warehouse
      from
            shipping_container sc
            inner join work_instruction wi
            on
                  wi.condition != N'<literal:1>'
                  and
                  wi.internal_num_type in (N'<literal:2>', N'<literal:3>')
                  and
                  wi.internal_container_num = sc.internal_container_num
		  and
		  wi.to_whs = sc.warehouse;