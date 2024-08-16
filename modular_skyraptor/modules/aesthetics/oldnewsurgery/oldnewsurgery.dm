/obj/item/scalpel
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'

/obj/item/cautery
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'

/obj/item/retractor
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'

/obj/item/hemostat
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'

/obj/item/bonesetter
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'
	icon_state = "bonesetter" //idk why we need to do this, they just HAD to rename it

/obj/item/blood_filter
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'

/obj/item/circular_saw
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'

/obj/item/surgicaldrill
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'

/obj/item/scalpel/advanced
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'
	light_color = "#AAFF00"
	light_range = 2
	lefthand_file = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery_inhand_l.dmi'
	righthand_file = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery_inhand_r.dmi'

/obj/item/scalpel/advanced/on_transform(obj/item/source, mob/user, active)
	. = ..()
	if(active)
		set_light_range(2)
		set_light_color("#FF6600")
	else
		set_light_range(2)
		set_light_color("#AAFF00")

/obj/item/retractor/advanced
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'
	lefthand_file = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery_inhand_l.dmi'
	righthand_file = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery_inhand_r.dmi'

/obj/item/cautery/advanced
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'
	lefthand_file = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery_inhand_l.dmi'
	righthand_file = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery_inhand_r.dmi'
	light_color = "#AAFF00"

/obj/item/cautery/advanced/on_transform(obj/item/source, mob/user, active)
	. = ..()
	if(active)
		//set_light_range(1)
		set_light_color("#FF6600")
	else
		//set_light_range(1)
		set_light_color("#AAFF00")

/obj/item/surgical_drapes
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'

/obj/item/storage/medkit
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'
	lefthand_file = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery_inhand_l.dmi'
	righthand_file = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery_inhand_r.dmi'

/obj/item/storage/medkit/coroner
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/oldnewsurgery.dmi'

/obj/item/storage/medkit/empty
	empty = TRUE
/obj/item/storage/medkit/brute/empty
	empty = TRUE
/obj/item/storage/medkit/fire/empty
	empty = TRUE
/obj/item/storage/medkit/toxin/empty
	empty = TRUE
/obj/item/storage/medkit/o2/empty
	empty = TRUE
/obj/item/storage/medkit/surgery/empty
	empty = TRUE
/obj/item/storage/medkit/advanced/empty
	empty = TRUE

/obj/item/storage/medkit/buffs
	name = "support medkit"
	desc = "An empty medkit for creative chemists to fill with concoctions."
	icon_state = "medkit_buffs"
	inhand_icon_state = "medkit-buffs"
	damagetype_healed = HEAL_ALL_DAMAGE
	empty = TRUE

/datum/design/spare_medkit
	name = "Medkit"
	id = "medkit"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(
		/datum/material/plastic = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/iron = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/storage/medkit/empty
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL,
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/spare_medkit/brute
	name = "Brute Medkit"
	id = "medkit_brute"
	build_path = /obj/item/storage/medkit/brute/empty

/datum/design/spare_medkit/burn
	name = "Burn Medkit"
	id = "medkit_burn"
	build_path = /obj/item/storage/medkit/fire/empty

/datum/design/spare_medkit/toxin
	name = "Toxin Medkit"
	id = "medkit_toxin"
	build_path = /obj/item/storage/medkit/toxin/empty

/datum/design/spare_medkit/o2
	name = "Oxyloss Medkit"
	id = "medkit_o2"
	build_path = /obj/item/storage/medkit/o2/empty

/datum/design/spare_medkit/buffs
	name = "Support Medkit"
	id = "medkit_buffs"
	build_path = /obj/item/storage/medkit/buffs

/datum/techweb_node/biotech/New()
	design_ids += list(
		"medkit",
		"medkit_brute",
		"medkit_burn",
		"medkit_toxin",
		"medkit_o2",
		"medkit_buffs",
	)
	return ..()

/datum/design/spare_medkit_advanced
	name = "Advanced Medkit"
	id = "medkit_advanced"
	build_type = PROTOLATHE
	materials = list(
		/datum/material/plastic = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 1,
	)
	build_path = /obj/item/storage/medkit/advanced/empty
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL,
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/spare_medkit_advanced/surgery
	name = "Surgical Medkit"
	id = "medkit_surgery"
	build_path = /obj/item/storage/medkit/surgery/empty

/datum/techweb_node/adv_biotech/New()
	design_ids += list(
		"medkit_advanced",
		"medkit_surgery",
	)
	return ..()



/// Plumbing stuff
/datum/asset/spritesheet/plumbing/create_spritesheets()
	//load only what we need from the icon files,format is icon_file_name = list of icon_states we need from this file
	var/list/essentials = list(
		'icons/obj/medical/iv_drip.dmi' = list("plumb"),
		'modular_skyraptor/modules/aesthetics/oldnewsurgery/hydrochem/fluid_ducts.dmi' = list("nduct"),
		'icons/hud/radial.dmi' = list(
			"plumbing_layer1",
			"plumbing_layer2",
			"plumbing_layer4",
			"plumbing_layer8",
			"plumbing_layer16",
		),
		'modular_skyraptor/modules/aesthetics/oldnewsurgery/hydrochem/plumbers.dmi' = list(
			"synthesizer",
			"reaction_chamber",
			"grinder_chemical",
			"growing_vat",
			"fermenter",
			"pump",
			"disposal",
			"buffer",
			"manifold",
			"pipe_input",
			"filter",
			"splitter",
			"beacon",
			"pipe_output",
			"tank",
			"acclimator",
			"bottler",
			"pill_press",
			"synthesizer_soda",
			"synthesizer_booze",
			"tap_output",
		),
	)

	for(var/icon_file as anything in essentials)
		for(var/icon_state as anything in essentials[icon_file])
			Insert(sprite_name = icon_state, I = icon_file, icon_state = icon_state)

/obj/machinery/plumbing/liquid_pump
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/hydrochem/plumbers.dmi'

/obj/machinery/plumbing/synthesizer
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/hydrochem/plumbers.dmi'

/obj/machinery/plumbing
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/hydrochem/plumbers.dmi'

/datum/component/plumbing
	connection_icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/hydrochem/connects.dmi'

/obj/machinery/duct
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/hydrochem/fluid_ducts.dmi'

/obj/item/stack/ducts
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/hydrochem/fluid_ducts.dmi'

/obj/item/surgery_tray
	icon = 'modular_skyraptor/modules/aesthetics/oldnewsurgery/medicart.dmi'
