/obj/item/stack/tile/glass/uranium
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/furniture/furniture.dmi'
	name = "uranium glass floor"
	singular_name = "uranium glass floor tile"
	desc = "Uranium glass window floors, for when... Whatever is down there is too scary for normal glass."
	icon_state = "tile_uglass"
	turf_type = /turf/open/floor/glass/uranium
	merge_type = /obj/item/stack/tile/glass/uranium
	mats_per_unit = list(/datum/material/alloy/uraniumglass = SHEET_MATERIAL_AMOUNT * 0.25)

/obj/item/stack/tile/rglass/uranium
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/furniture/furniture.dmi'
	name = "reinforced uranium glass floor"
	singular_name = "reinforced uranium glass floor tile"
	desc = "Reinforced uranium glass window floors, because whatever's downstairs should really stay down there."
	icon_state = "tile_ruglass"
	turf_type = /turf/open/floor/glass/reinforced/uranium
	merge_type = /obj/item/stack/tile/rglass/uranium
	mats_per_unit = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 0.125, /datum/material/alloy/uraniumglass = SHEET_MATERIAL_AMOUNT * 0.25)





/turf/open/floor/glass/uranium
	name = "uranium glass floor"
	desc = "Studies by the Nanotrasen Materials Safety Division have not yet determined if this is safe to jump on, do so at your own risk."
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/furniture/icons/floor_uraniumglass.dmi'
	icon_state = "plasma_glass-0"
	base_icon_state = "plasma_glass"
	floor_tile = /obj/item/stack/tile/glass/uranium
	starlight_color = "#d5ff80"
	alpha_to_leave = 255

/turf/open/floor/glass/uranium/icemoon
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS

/turf/open/floor/glass/uranium/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/glass/reinforced/uranium
	name = "reinforced uranium glass floor"
	desc = "Do jump on it, jump on it while in a mecha, it can take it."
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/furniture/icons/floor_reinf_uraniumglass.dmi'
	icon_state = "reinf_plasma_glass-0"
	base_icon_state = "reinf_plasma_glass"
	floor_tile = /obj/item/stack/tile/rglass/uranium
	starlight_color = "#d5ff80"
	alpha_to_leave = 206

/turf/open/floor/glass/reinforced/uranium/icemoon
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS

/turf/open/floor/glass/reinforced/uranium/airless
	initial_gas_mix = AIRLESS_ATMOS
