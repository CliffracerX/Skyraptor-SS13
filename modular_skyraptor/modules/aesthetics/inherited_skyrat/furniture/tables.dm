/obj/structure/table/glass/uraniumglass
	name = "uranium glass table"
	desc = "Someone thought this was a good idea."
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/furniture/icons/table_uraniumglass.dmi'
	icon_state = "plasmaglass_table-0"
	base_icon_state = "plasmaglass_table"
	custom_materials = list(/datum/material/alloy/uraniumglass=SHEET_MATERIAL_AMOUNT)
	buildstack = /obj/item/stack/sheet/uraniumglass
	glass_shard_type = /obj/item/shard/uranium
	max_integrity = 200

/obj/structure/table/reinforced/uraniumrglass
	name = "reinforced uranium glass table"
	desc = "A reinforced version of the uranium glass table."
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/furniture/icons/table_ruraniumglass.dmi'
	icon_state = "rplasmaglass_table-0"
	base_icon_state = "rplasmaglass_table"
	custom_materials = list(/datum/material/alloy/uraniumglass=SHEET_MATERIAL_AMOUNT, /datum/material/iron=SHEET_MATERIAL_AMOUNT)
	buildstack = /obj/item/stack/sheet/uraniumrglass
	max_integrity = 300
