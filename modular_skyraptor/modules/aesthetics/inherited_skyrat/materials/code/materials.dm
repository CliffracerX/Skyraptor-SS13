/obj/item/stack/sheet/bluespace_crystal
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/materials/icons/materials.dmi'

/obj/item/stack/ore/bluespace_crystal
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/materials/icons/materials.dmi'

/obj/item/stack/rods
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/materials/icons/materials.dmi'


// == URANIUM GLASS SUPPORT ==

/obj/item/shard/uranium
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/materials/icons/materials.dmi'
	name = "green shard"
	desc = "A nasty looking shard of uranium infused glass."
	throwforce = 12
	icon_state = "uraniumlarge"
	inhand_icon_state = "shard-titanium"
	custom_materials = list(/datum/material/alloy/uraniumglass=SHEET_MATERIAL_AMOUNT)
	icon_prefix = "uranium"
	weld_material = /obj/item/stack/sheet/uraniumglass
	shiv_type = /obj/item/knife/shiv/uranium
	craft_time = 7 SECONDS

/obj/item/knife/shiv/uranium
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/materials/icons/materials.dmi'
	name = "uranium shiv"
	icon_state = "uraniumshiv"
	inhand_icon_state = "titaniumshiv"
	desc = "A makeshift uranium-infused glass shiv."
	throwforce = 14
	throw_range = 7
	wound_bonus = 10
	armor_type = /datum/armor/shiv_titanium
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT * 4, /datum/material/uranium=SMALL_MATERIAL_AMOUNT * 2)





GLOBAL_LIST_INIT(uglass_recipes, list ( \
	new/datum/stack_recipe("directional window", /obj/structure/window/uranium/unanchored, time = 0.5 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND | CRAFT_CHECK_DIRECTION, category = CAT_WINDOWS), \
	new/datum/stack_recipe("fulltile window", /obj/structure/window/uranium/fulltile/unanchored, 2, time =  1 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND | CRAFT_IS_FULLTILE, category = CAT_WINDOWS), \
	new/datum/stack_recipe("fulltile diagonalizing window", /obj/structure/window/uranium/fulltile/diagonal/unanchored, 2, time =  1 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND | CRAFT_IS_FULLTILE, category = CAT_WINDOWS), \
	new/datum/stack_recipe("glass shard", /obj/item/shard/uranium, time = 0, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND, category = CAT_MISC), \
	new/datum/stack_recipe("glass tile", /obj/item/stack/tile/glass/uranium, 1, 4, 20, category = CAT_TILES) \
))

/obj/item/stack/sheet/uraniumglass
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/materials/icons/materials.dmi'
	name = "uranium glass"
	desc = "A glass sheet made out of a uranium-silicate alloy. It looks extremely tough and heavily fire resistant."
	singular_name = "uranium glass sheet"
	icon_state = "sheet-uglass"
	inhand_icon_state = "sheet-uglass"
	mats_per_unit = list(/datum/material/alloy/uraniumglass=SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/alloy/uraniumglass
	armor_type = /datum/armor/sheet_uraniumglass
	resistance_flags = ACID_PROOF
	merge_type = /obj/item/stack/sheet/uraniumglass
	grind_results = list(/datum/reagent/silicon = 20, /datum/reagent/uranium = 10)
	material_flags = NONE
	matter_amount = 15
	tableVariant = /obj/structure/table/glass/uraniumglass

/obj/item/stack/sheet/uraniumglass/fifty
	amount = 50

/datum/armor/sheet_uraniumglass
	fire = 95
	acid = 100

/obj/item/stack/sheet/uraniumglass/get_main_recipes()
	. = ..()
	. += GLOB.uglass_recipes

/obj/item/stack/sheet/uraniumglass/attackby(obj/item/W, mob/user, params)
	add_fingerprint(user)

	if(istype(W, /obj/item/stack/rods))
		var/obj/item/stack/rods/V = W
		if (V.get_amount() >= 1 && get_amount() >= 1)
			var/obj/item/stack/sheet/uraniumrglass/RG = new (get_turf(user))
			if (!QDELETED(RG))
				RG.add_fingerprint(user)
			var/replace = user.get_inactive_held_item() == src
			V.use(1)
			use(1)
			if(QDELETED(src) && replace)
				user.put_in_hands(RG)
		else
			to_chat(user, span_warning("You need one rod and one sheet of uranium glass to make reinforced uranium glass!"))
			return
	else
		return ..()


GLOBAL_LIST_INIT(urglass_recipes, list ( \
	new/datum/stack_recipe("directional reinforced window", /obj/structure/window/reinforced/uranium/unanchored, time = 0.5 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND | CRAFT_CHECK_DIRECTION, category = CAT_WINDOWS), \
	new/datum/stack_recipe("fulltile reinforced window", /obj/structure/window/reinforced/uranium/fulltile/unanchored, 2, time = 2 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND | CRAFT_IS_FULLTILE, category = CAT_WINDOWS), \
	new/datum/stack_recipe("fulltile diagonalizing reinforced window", /obj/structure/window/reinforced/uranium/fulltile/diagonal/unanchored, 2, time = 2 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND | CRAFT_IS_FULLTILE, category = CAT_WINDOWS), \
	new/datum/stack_recipe("glass shard", /obj/item/shard/uranium, time = 10, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND, category = CAT_MISC), \
	new/datum/stack_recipe("reinforced glass tile", /obj/item/stack/tile/rglass/uranium, 1, 4, 20, category = CAT_TILES) \
))

/obj/item/stack/sheet/uraniumrglass
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/materials/icons/materials.dmi'
	name = "reinforced uranium glass"
	desc = "A glass sheet made out of a uranium-silicate alloy and a rod matrix. It looks hopelessly tough and fire-proof!"
	singular_name = "reinforced uranium glass sheet"
	icon_state = "sheet-urglass"
	inhand_icon_state = "sheet-urglass"
	mats_per_unit = list(/datum/material/alloy/uraniumglass=SHEET_MATERIAL_AMOUNT, /datum/material/iron = SHEET_MATERIAL_AMOUNT * 0.5)
	armor_type = /datum/armor/sheet_uraniumrglass
	resistance_flags = ACID_PROOF
	material_flags = NONE
	merge_type = /obj/item/stack/sheet/uraniumrglass
	grind_results = list(/datum/reagent/silicon = 20, /datum/reagent/uranium = 10, /datum/reagent/iron = 10)
	//point_value = 23
	matter_amount = 20
	tableVariant = /obj/structure/table/reinforced/uraniumrglass

/datum/armor/sheet_uraniumrglass
	melee = 30
	fire = 100
	acid = 100

/obj/item/stack/sheet/uraniumrglass/fifty
	amount = 50

/obj/item/stack/sheet/uraniumrglass/get_main_recipes()
	. = ..()
	. += GLOB.urglass_recipes




/obj/effect/decal/cleanable/glass/uranium
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/materials/icons/materials.dmi'
	icon_state = "uraniumtiny"








/** Uraniumglass
 *
 * An alloy of silicate and uranium.
 */
/datum/material/alloy/uraniumglass
	name = "uraniumglass"
	desc = "Uranium-infused silicate. It is much more durable and heat resistant than either of its component materials, and something about the silica interplays with the uranium to make fantastic rad-capture."
	color = "#d5ff80"
	greyscale_colors = "#d5ff8096"
	alpha = 150
	starlight_color = "#AAFF00FF"
	init_flags = MATERIAL_INIT_MAPLOAD
	integrity_modifier = 0.75
	armor_modifiers = list(MELEE = 0.9, BULLET = 0.9, LASER = 1.5, ENERGY = 1.5, BOMB = 0.4, BIO = 1.5, FIRE = 3, ACID = 3)
	sheet_type = /obj/item/stack/sheet/uraniumglass
	shard_type = /obj/item/shard/uranium
	debris_type = /obj/effect/decal/cleanable/glass/uranium
	value_per_unit = 0.125
	categories = list(MAT_CATEGORY_RIGID=TRUE, MAT_CATEGORY_BASE_RECIPES=TRUE, MAT_CATEGORY_ITEM_MATERIAL=TRUE)
	composition = list(/datum/material/glass=1, /datum/material/uranium=0.5)






/datum/design/uraglass_alloy
	name = "Uranium Glass"
	id = "uraniumglass"
	build_type = SMELTER | PROTOLATHE | AWAY_LATHE //TODO: port colony fabs
	materials = list(/datum/material/uranium = SHEET_MATERIAL_AMOUNT * 0.5, /datum/material/glass = SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/uraniumglass
	category = list(
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS
	)
	departmental_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/uraniumrglass_alloy
	name = "Reinforced Uranium Glass"
	id = "uraniumreinforcedglass"
	build_type = SMELTER | PROTOLATHE | AWAY_LATHE //TODO: port colony fabs
	materials = list(/datum/material/uranium = SHEET_MATERIAL_AMOUNT * 0.5, /datum/material/iron = SHEET_MATERIAL_AMOUNT * 0.5,  /datum/material/glass = SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/uraniumrglass
	category = list(
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS
	)
	departmental_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/techweb_node/base/New()
	design_ids += list(
		"uraniumglass",
		"uraniumreinforcedglass",
	)
	return ..()
