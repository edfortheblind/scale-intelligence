-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */


















-- [comment omitted]


CREATE PROCEDURE RPT_TruckManifestDetails(
	@INTERNAL_LOAD_NUM numeric(9),
	@DOCUMENT_TYPE nvarchar(25))
	
AS
begin
	set nocount on;

	select 
		shv.pro_num_alpha proNumAlpha,
		shv.bol_num_alpha bolNumAlpha,
		shv.ship_to_name stShipTo,
		shv.ship_to_address1 stAddress1,
		shv.ship_to_address2 stAddress2,
		shv.ship_to_address3 stAddress3,
		shv.ship_to_city stCity,
		shv.ship_to_state stState,
		shv.ship_to_postal_code stZip,
		shv.total_weight weight,
		shv.weight_UM wgtUM,
		shv.total_volume volume,
		shv.volume_UM volUM,
		gcdFrTerms.[description] freTerms,
		shv.route,
		shv.stop,
		dbo.RPTfn_GetPurchaseOrderText(shv.internal_shipment_num) poNum,
		shv.total_containers totShipCont,
		dbo.RPTfn_GetCommentText(shv.internal_shipment_num, 0, N'<literal:1>', @DOCUMENT_TYPE) comment1,
		shv.ship_to_phone_num stPhone,
		shv.ship_to_country stCountry,
		shv.user_def1  sh_user_def1,
		shv.user_def2  sh_user_def2,
		shv.user_def3  sh_user_def3,
		shv.user_def4  sh_user_def4,
		shv.user_def5  sh_user_def5,
		shv.user_def6  sh_user_def6,
		shv.user_def7  sh_user_def7,
		shv.user_def8  sh_user_def8
	from
		shipment_header_view shv

		left outer join generic_config_detail gcdFrTerms
		on	
			shv.freight_terms = gcdFrTerms.identifier
		and
			gcdFrTerms.record_type = N'<literal:2>'

	where
		shv.shipping_load_num = @INTERNAL_LOAD_NUM
	order by
		shv.route,
		shv.stop;	

end -- [comment omitted]






