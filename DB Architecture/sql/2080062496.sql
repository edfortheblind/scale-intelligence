-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



CREATE view SHIPPING_CONTAINER_ON_HAND
as
select distinct
            case when sc.tree_unit != sc.internal_container_num then sc.tree_unit else sc.internal_container_num end INTERNAL_CONTAINER_NUM,
            sc.location,
		    sc.warehouse
      from
            shipping_container sc
      where
			sc.location is not null;