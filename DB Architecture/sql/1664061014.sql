-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE VIEW METATRANS_GetBillOfMaterialDetailsView
 AS
SELECT bomd.ITEM, 
	   bomd.ITEM_DESC, 
	   bomd.QTY_NEEDED_PER_ITEM, 
	   bomd.QUANTITY_UM,
	   bomd.INTERNAL_BOM_DETAIL_NUM, 
	   bomd.INTERNAL_BOM_HEADER_NUM,
	   item.LOT_CONTROLLED, 
	   bomd.COMPANY 
	   FROM BILL_OF_MATERIALS_DETAIL bomd 
	    LEFT OUTER JOIN ITEM item ON bomd.ITEM =item.ITEM 
		AND ISNULL(bomd.COMPANY,N'<literal:1>')=ISNULL(item.COMPANY,ISNULL(bomd.COMPANY, N'<literal:2>'))