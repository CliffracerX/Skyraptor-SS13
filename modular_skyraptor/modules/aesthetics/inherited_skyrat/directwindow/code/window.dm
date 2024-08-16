/obj/structure/window
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/directwindow/icons/directwindow.dmi'

/obj/machinery/door/window
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/directwindow/icons/directwindow.dmi'



/// Bespoke addition: uranium-glass windows, based on SS14
/obj/structure/window/uranium
	name = "uranium window"
	desc = "A window made out of a uranium-silicate alloy. It looks insanely tough to break and burn through, and the alloy is unbelievably good at capturing radiation - hence why these aren't glowing."
	icon_state = "uraniumwindow"
	reinf = FALSE
	heat_resistance = 50000
	armor_type = /datum/armor/window_uranium
	max_integrity = 400
	explosion_block = 1
	glass_type = /obj/item/stack/sheet/uraniumglass
	rad_insulation = RAD_HEAVY_INSULATION
	glass_material_datum = /datum/material/alloy/uraniumglass

/datum/armor/window_uranium
	melee = 85
	bullet = 10
	bomb = 50
	fire = 100
	acid = 100

/obj/structure/window/uranium/Initialize(mapload, direct)
	. = ..()
	RemoveElement(/datum/element/atmos_sensitive)

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/window/uranium/spawner, 0)

/obj/structure/window/uranium/unanchored
	anchored = FALSE



/obj/structure/window/reinforced/uranium
	name = "reinforced uranium window"
	desc = "A window made out of a uranium-silicate alloy and a rod matrix. It looks hopelessly tough to break and is most likely nigh fireproof - not to mention damn near rad-proof."
	icon_state = "uraniumrwindow"
	reinf = TRUE
	heat_resistance = 100000
	armor_type = /datum/armor/reinforced_uranium
	max_integrity = 1000
	damage_deflection = 35
	explosion_block = 3
	glass_type = /obj/item/stack/sheet/uraniumrglass
	rad_insulation = RAD_EXTREME_INSULATION
	glass_material_datum = /datum/material/alloy/uraniumglass

/datum/armor/reinforced_uranium
	melee = 85
	bullet = 30
	bomb = 70
	fire = 100
	acid = 100

/obj/structure/window/reinforced/uranium/block_superconductivity()
	return TRUE

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/window/reinforced/uranium/spawner, 0)

/obj/structure/window/reinforced/uranium/unanchored
	anchored = FALSE
	state = WINDOW_OUT_OF_FRAME
